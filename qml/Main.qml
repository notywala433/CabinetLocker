import Felgo 3.0
import QtQuick 2.0
import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0
import "model"
import "pages"
App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    // * Publish your games & apps for the app stores
    // * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    // * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    licenseKey: "E3C34971E19161150A77175DEF317DFA48FC1D0485985CE9E861A881EF5334403A13F2292C7CE7920FBA8C162015EF9D0A0E1858D6A96AB6C7B1C51E248AED3EE39BF2BA4FD44532082A484F59A28417B67D1E658525ACB7ACA9CBF78642DB848913FBE2F49E50818DB8C14526E84825A5E333059C8CACF7D78914A1FCB97946B6B00DE72612C679D8E1E36E4481D2AA72F2664A2428BEE50C2423AB26FFBEC7C2E706399B02F854CBC557838D267DBB1A791C01F5ABEDF40433B44C0C1EC2769585AE3F0205B4A0EF94A80D3EC4BB425B2A134E6956121910A5FD5479A42A9AB6AB60449ADC3E274E617D07CF14F168E62C008D406E2A3D07F0D24150709B49C714CA03DD4A0E9AF08647D7FD5AB084A362A31F98BDC515379EE30F658FF043D696315E37433B0E3E182963FBB8003FE6DB15F01158B9F2184AEDBAF708FE3C"
     Component.onCompleted: {
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
         xhr.setRequestHeader('Authorization', 'ATXKOZzjR3aqisQ6r4U5Qw==');
         xhr.onreadystatechange = function(){
             if (xhr.readyState == 4 && xhr.status == 200) {
                 console.log('success');
             }
         };

         xhr.send(body)


     }
    //Components that are loaded on the go
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
