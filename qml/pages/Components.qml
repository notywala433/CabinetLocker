import Felgo 3.0
import QtQuick 2.0
import Qt.labs.settings 1.0

//All dynamic components loaded on the go

Item {

    //Password Page property

    property alias passworPage: myPassword

    //Retrieve Page property

    property alias retrievePage: retrievePage

    //Settings Page property

    property alias settingsPage: settingsPager

    Component{

        id: settingsPager
        AppSettings{}


    }


    //Password page

    Component{

        id:myPassword

        PasswordPage{}

             }

    //Retrieve page

    Component{

    id:retrievePage

        Retrievepage{}

    }




    }

