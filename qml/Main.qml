import Felgo 3.0
import QtQuick 2.0
import QtQuick 2.0
import QtQuick 2.7



import "model"
import "pages"
App {
    id:app
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    // * Publish your games & apps for the app stores
    // * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    // * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    licenseKey: "9013056AADAD7D776F91E474C4DBDC4A909BC6B7B0EED1B3E6F21E8DE5785B24CD8D8F518D24112F82F774EE332A6C8BFA1F10AB0E359E0451BC1F5A226C8A72CE305057F4DBB2260F67F55F94119D84417915A69978D882FF673C472C2E5D27E36F1D65AE877EA3C674501CCDCB32B912D314AD5DFA69C01DAA9EBBF687B153ABE362A72C2DD2F3D35CCED314EBABC1C7CBCF0044390EFB7CCCB9003F5E8B36A1E43BD0915BF808A875B2B848B66369F52E6833BB0C2B0CF4CBB1B1CF0FFA7E9363B6EEDFEF287AEB001E163B22EC9847186845508C39CC7EF5983E6709780DD44793322FF3C5A4943EB0BA5936F86E5ECD5207F23828EFE73070D86ED074CF36FFB216ABAC67B56234BDB2344A1B28D57380D25B9EDEF9A1C75EFC19DF14574B816A1363F9B6B097F4806E7BA1D0C457800D9E3050007607E7C5757E1F80C9"
     onInitTheme:  {
         // Set the navigation bar background to blue
         Theme.navigationBar.backgroundColor = "green"
            Theme.appButton.backgroundColor = "green"
         // Set the global text color to red
         Theme.colors.textColor = "white"
       }


    Component.onCompleted: {
       // open.setPort(settings.port)
       // console.log("this is the port: "+ open.getPort())
       var data =  {username : "admin",password : 1111}


            app.settings.setValue("login", data)
        var json1
        json1 =app.settings.getValue("login",json1)

        open.setPort(String(settings.port))
         var xhr = new XMLHttpRequest(),
         body = JSON.stringify(
             {
                 "messages": [
                     {
                         "channel": "sms",
                         "to": "+27733509706",
                         "content": dataModel.storage.getValue(4).occupied? "Your password for cabinet 4 is "+dataModel.storage.getValue(4).password : "The locker is vacant"
                     }
                 ]
             }
         );
         xhr.open('POST', 'https://platform.clickatell.com/v1/message', true);
         xhr.setRequestHeader('Content-Type', 'application/json');
         xhr.setRequestHeader('Authorization', 'tykg0nYdTQ6JGRQ-IYqIVQ==');
         xhr.onreadystatechange = function(){
             if (xhr.readyState == 4 && xhr.status == 200) {

             }
         };

         xhr.send(body)


     }

    Item {

           anchors.fill: parent
           focus: true
           Keys.onPressed: {
               if (event.key === Qt.Key_S) {
                   logic.keySpressed()
                   event.accepted = true;
               }
           }
       }

    //Components that are loaded on the go
    Components{
    id:components}



    Timer{
        id:timer
        interval: 10000

        repeat: true
       //onTriggered: navigationStack.popAllExceptFirst()


    }

    visible: true   // this is mandatory
    Settings{
    id:settings
    property int numberOfCabinets: 4
    property var port
    property var comNo
    property var baudRate
    property var hostname: "http://greenfield.zemtech.co.za/symfony24/public/index.php"
    property var adminPassword: "1111"
    property var apiUsername
    property var apiPassword


    }
    Logic{
    id:logic


    }
    DataModel{
    id:dataModel
    dispatcher: logic
    }

    NavigationStack{
    MainPage{}
}
}
