import Felgo 3.0
import QtQuick 2.0

Item {
    //Exposed properties

    property alias dispatcher: logicConnection.target

    property alias storage: storage

    signal  lockOpened(var freeCabinet)

    signal noLockAvailable()

    signal wrongPassEntered
    signal openSettings()

    // Storage data for the locks

    Storage{
                id:storage

                 Component.onCompleted: {

                 var lock  = {number:1, password:"thami", occupied:false}

                 for(var i= 1;i<=settings.numberOfCabinets;i++){

                        if(!storage.getValue(i)){

                             storage.setValue(i,lock)

                                                 }

                                                                }
                                         }




    }

    //Connection with the logic component

    Connections{

            id:logicConnection

            //Deposit signal from the Logic Component

            onDeposit: _.deposit()

            //Retrieve signal from the Logic Component

            onRetrieve:_.retrieve(password,cabinetNumber)

            //OpenCabinet signal from the Logic Component

            onOpenCabinet:_.openSetCabinet(cabinetNumber,password)

            //S button signal for settings

            onKeySpressed: openSettings()
                 }

    //Private item not Accessible outside of the Component

    Item{
            id:_

        //Open a rented cabinet with a password

        function retrieve(passwd,cabinetNo){

             var lock = storage.getValue(cabinetNo)

             if(passwd === lock.password)

                {

                    lock.occupied = false

                    storage.setValue(cabinetNo,lock)

                    open.openChannel(cabinetNo)
                }
                else

                 {wrongPassEntered()}



                                    }

    // Set a password for a cabinet rental and open it

    function openSetCabinet(cabinetNumber,password){

            var lock  =  storage.getValue(cabinetNumber)

            //Set password

            lock.password = password

            //Change state to occupied

            lock.occupied = true

            //Update the lock data on the storage component

            storage.setValue(cabinetNumber,lock)

            //Open the required lock

            open.openChannel(cabinetNumber)


    }

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
}
}
