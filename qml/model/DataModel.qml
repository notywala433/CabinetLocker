import Felgo 3.0
import QtQuick 2.0

Item {
    //Exposed properties

    property alias dispatcher: logicConnection.target

    property alias storage: storage

    signal  lockOpened(var freeCabinet)

    signal noLockAvailable()

    signal wrongPassEntered()
    signal openSettings()

    //Prescription found
    signal prescriptionFound(var prescription)

    //Prescription not found
    signal prescriptionNotFound()

    //Fetching data:
    signal busyCommunicating()

    //done fetching data:
    signal doneCommunicating()

    //api  failed auth
    signal apiFailedAuth()

     //Avoid loading the same prescription twice
    signal alreadyLoaded(var lock)




    // Storage data for the locks

    Storage{
                id:storage

                 Component.onCompleted: {

                 var lock  = {number:1, password:"thami", occupied:false,prescription:""}

                 for(var i= 1;i<=settings.numberOfCabinets;i++){
                            console.log(JSON.stringify(storage.getValue(i)))
                        if(!storage.getValue(i)){

                             storage.setValue(i,lock)

                                                 }

                                                                }
                                         }




    }

    //Connection with the logic component

    Connections{

            id:logicConnection
             //Send SMS
            onSendSMS:_.sendSMS(prescription,vacantlock)
            //find prescription
            onFindPrescription: _.getPrescription(id)

            //Deposit signal from the Logic Component

            onDeposit: _.deposit()

            //Retrieve signal from the Logic Component

            onRetrieve:_.retrieve(password,cabinetNumber)

            //OpenCabinet signal from the Logic Component

            onOpenCabinet:_.openSetCabinet(cabinetNumber,prescription)

            //S button signal for settings

            onKeySpressed: openSettings()

            onResetLocker:_.resetLocker(prescription)
                 }

    //Private item not Accessible outside of the Component

    Item{
            id:_
            property var  apiToken
              Component.onCompleted:setApitoken()

        function findLockerdetails(prescription){
                  var found
                for(var i= 1;i<=settings.numberOfCabinets;i++){

                   var lockTest = storage.getValue(i)
                       if(lockTest.prescription === prescription[0].PrescriptionId.id){
                                   found = lockTest
                                                         }
                                                               }

              return found
              }



         //Get apiToken
         function setApitoken()
        {
             var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance
                             var theUrl = settings.hostname+"/api/login_check";
                              busyCommunicating();
                             xmlhttp.open("POST", theUrl,true);
                             xmlhttp.setRequestHeader('Content-Type', 'application/json');

                             xmlhttp.onreadystatechange = function() {
                                    console.log(xmlhttp.responseText)
                                 if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                                    // Typical action to be performed when the document is ready:

                                     _.apiToken = JSON.parse(xmlhttp.responseText);


                                       doneCommunicating()
                                 }
                                 else{
                                    apiFailedAuth()

                                 }
                             };


                             xmlhttp.send(JSON.stringify({ "username": "notywala@yahoo.com", "password":"Thamin@433" } ));


         }

        //Open a rented cabinet with a password

        function retrieve(passwd,prescription){

            var found = false
          for(var i= 1;i<=settings.numberOfCabinets;i++){

             var lockTest = storage.getValue(i)
              console.log(JSON.stringify(prescription))

                 if(lockTest.prescription[0].PrescriptionId.id == prescription && lockTest.password == passwd ){
                             found = true
                     lockTest.occupied = false
                     lockTest.prescription = ""

                     open.openChannel(i)
                     storage.setValue(i,lockTest)
                     break;                           }


                                                   }

          wrongPassEntered()



                                   }

    // Set a password for a cabinet rental and open it

    function openSetCabinet(cabinetNumber,prescription){
        console.log(cabinetNumber)
          var found = false
        for(var i= 1;i<=settings.numberOfCabinets;i++){

           var lockTest = storage.getValue(i)
               if(lockTest.prescription === prescription[0].PrescriptionId.id){
                           found = true
                   alreadyLoaded(lockTest);break;
                                                            }

                                                       }


        if(!found){
        //Generate pin number
            var pin = utils.generateRandomValueBetween(1000,9999)|0
            var lock  =  storage.getValue(cabinetNumber)

            lock.number = cabinetNumber
            //Set password

            lock.password = pin

            //Change state to occupied

            lock.occupied = true

            //Set prescription
            lock.prescription = prescription

            //Update the lock data on the storage component

            storage.setValue(cabinetNumber,lock)

            //Open the required lock

            open.openChannel(cabinetNumber)
        sendSMS(prescription,cabinetNumber,pin)

}
    }
    //Find empty Locker and return the number without opening

    //Check for a vacant lock and open

    function deposit(){

        var freeCabinet = 0

    for(var i =1;i<=settings.numberOfCabinets;i++){

            // Get lock data from storage

            var result = storage.getValue(i)

            //Find a vacant lock and emit signal

            if(result.occupied === false || typeof result.occupied ==='undefined' )

                {   freeCabinet = i

                    //Signal when vacant lock is found

                     lockOpened(freeCabinet)

                     //End the for loop if lock is found
                    break

                 }


    }
        if(freeCabinet===0)
            {
                //Signal Emmited when no lock is available

                noLockAvailable()}



    }

    // Find prescription

    function getPrescription(id){
        var prescription
        var xmlhttp2 = new XMLHttpRequest();   // new HttpRequest instance
                        var theUrl = settings.hostname+"/api/findprescription/"+id;

                         busyCommunicating();
                        xmlhttp2.open("GET", theUrl,true);
                        xmlhttp2.setRequestHeader('Content-Type', 'application/json');
                        xmlhttp2.setRequestHeader('Authorization', 'Bearer '+apiToken.token);
                        xmlhttp2.onreadystatechange = function() {
                                    console.log(xmlhttp2.readyState)
                            if (xmlhttp2.readyState === 4 && xmlhttp2.status === 200) {
                               // Typical action to be performed when the document is ready:

                                prescription = JSON.parse(xmlhttp2.responseText);


                                prescriptionFound(prescription)
                                  doneCommunicating()
                            }
                            if (xmlhttp2.readyState === 4 && xmlhttp2.status === 500) {
                               // Typical action to be performed when the document is ready:

                                prescription = JSON.parse(xmlhttp2.responseText);


                                prescriptionNotFound()
                                  doneCommunicating()
                            }

                        };


                        xmlhttp2.send();







    }

    //Send an sms
    function sendSMS(prescriptionid, vacantlock,pin){
        function send(token){

            var xhr = new XMLHttpRequest();
            var sendUrl = 'https://rest.mymobileapi.com/bulkmessages';
            busyCommunicating();
            xhr.open("POST",sendUrl,true)
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.setRequestHeader('Authorization', 'Bearer '+token);

            xhr.onreadystatechange = function() {

            if (xhr.readyState === 4 && xhr.status === 200) {
               // Typical action to be performed when the document is ready:




                  doneCommunicating()
            }

       } ;
            var message = "Good day "+prescriptionid[0].PrescriptionId.PatientId.name+" "+prescriptionid[0].PrescriptionId.PatientId.surname+",\n"+
                    "Your prescription is now ready to be collected.\n"+
                    "Please use the following to collect:\n"+
                    "Prescription No: "+prescriptionid[0].PrescriptionId.id+"\n"+
                    "Pin: "+pin
            var data2 = JSON.stringify({ "messages":[{"content":message,"destination":prescriptionid[0].PrescriptionId.PatientId.cellNumber}]})
    xhr.send(data2);






       }
        var token = Qt.btoa("31cb1fda-0783-406a-9e25-1489316027d9:b6TqgCmIjinGoRGRCLKIbQshMEJEtxjt")
        var sendToken
        var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance
                        var theUrl = "https://rest.mymobileapi.com/Authentication";
                         busyCommunicating();
                        xmlhttp.open("GET", theUrl,true);
                        xmlhttp.setRequestHeader('Content-Type', 'application/json');
                        xmlhttp.setRequestHeader('Authorization', 'Basic '+token);

                        xmlhttp.onreadystatechange = function() {

                            if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                               // Typical action to be performed when the document is ready:

                                sendToken = JSON.parse(xmlhttp.responseText)


                                send(sendToken.token)

                                  doneCommunicating()
                            }
                            else{
                               apiFailedAuth()

                            }
                        };


                        xmlhttp.send();


    }



    //Admin reset and open a locker

    function resetLocker(prescription){






        var data = dataModel.storage.getValue(prescription.number)

        data.password = ""
        data.occupied = false
        data.prescription = ""
        dataModel.storage.setValue(prescription.number,data)
        open.openChannel(prescription.number)


    }





    }
}
