import Felgo 3.0
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0




Page {

    property var portNumber
    property var baudRate
    property bool numberOfCabinets
    Component.onCompleted:{open.setPort(settings.port)
    portUsed.currentIndex= portUsed.find(settings.port)

    }

    AppImage{
                anchors.left: parent.left
               anchors.leftMargin:  30
               width: 400
              // height:parent.height

               source: "https://www.greenfield.co.za/wp-content/uploads/logo-1.png"
            }
    title: "Application Settings "
    Column{
        id:col
        anchors.centerIn:  parent
        spacing: 5
        anchors.margins: 15
    Grid{
        spacing: 20
        columns: 2
        anchors.horizontalCenter: parent.horizontalCenter
        Grid{
            id: leftGrid

            //anchors.right: col.right
            /*anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: dp(Theme.navigationBar.defaultBarItemPadding)*/
            //anchors.centerIn: parent
            spacing: Theme.navigationBar.defaultBarItemPadding
            columns: 2

           /* Row{
                id:row
                spacing: Theme.navigationBar.defaultBarItemPadding
                anchors.horizontalCenter: parent.horizontalCenter*/
            AppText{

                color: "black"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignLeft
                fontSize: 12

            text: "API Username: "

            }
            Rectangle{
                border.width: 1
                height: type.height
                width: 100
            AppTextInput{
                id:apiUsername
                anchors.fill: parent
                font.pixelSize: 12
                anchors.leftMargin: 3
                text: settings.apiUsername? settings.apiUsername:""
                clip: true
                color: "black"
            //x:row.width

            }}
            /*}*/
            /*Row{
                spacing: Theme.navigationBar.defaultBarItemPadding
                anchors.horizontalCenter: parent.horizontalCenter*/
            AppText{
            //anchors.centerIn:  parent
                color: "black"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignLeft
                fontSize: 12

            text: "API Password:"

            }
            Rectangle{
                border.width: 1
                height: type.height
                width: 100
            AppTextInput{
                id:apiPassword
                anchors.fill: parent
                font.pixelSize: 12
                anchors.leftMargin: 3
                text: settings.apiPassword? settings.apiPassword:""
                clip: true
                color: "black"
            //x:row.width

            }}
            AppText{
            //anchors.centerIn:  parent
                color: "black"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignLeft
                fontSize: 12

            text: "Admin Password:"

            }
            Rectangle{
                border.width: 1
                height: type.height
                width: 100
            AppTextInput{
                id:adminPassword
                anchors.fill: parent
                font.pixelSize: 12
                anchors.leftMargin: 3
                text: settings.adminPassword
                clip: true
                color: "black"
            //x:row.width

            }}

        }



    Grid{

        id:rightColumn

        /*anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: dp(Theme.navigationBar.defaultBarItemPadding)*/
        //anchors.centerIn: parent
        spacing: Theme.navigationBar.defaultBarItemPadding
        columns: 2

       /* Row{
            id:row
            spacing: Theme.navigationBar.defaultBarItemPadding
            anchors.horizontalCenter: parent.horizontalCenter*/
        AppText{

            color: "black"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignLeft
            fontSize: 12

        text: "Number of Cabinets: "

        }
        ComboBox{
            id:cabinNo
            width: 100
        model:99
        currentIndex: settings.numberOfCabinets

        //x:row.width

        }
        /*}*/
        /*Row{
            spacing: Theme.navigationBar.defaultBarItemPadding
            anchors.horizontalCenter: parent.horizontalCenter*/
        AppText{
        //anchors.centerIn:  parent
            color: "black"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignLeft
            fontSize: 12

        text: "Serial Port Used :"

        }
        ComboBox{
            id:portUsed
            width: 100
        model:open.availablePorts()

       // x: row.width
        //currentIndex: open.availablePorts()








        }
        AppText{
            color: "black"

            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignLeft
            fontSize: 12

        text: "Type: "

        }
        ComboBox{
            id:type
            width: 100
        model:["Coin","RFID","Password","Remote","Finger Print"]
        currentIndex: 2

        //x:row.width

        }
        AppText{
            color: "black"

            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignLeft
            fontSize: 12

        text: "API Hostname: "

        }
        Rectangle{
            border.width: 1
            height: type.height
            width: 100
        AppTextInput{
            id:hostName
            anchors.fill: parent
            font.pixelSize: 12
            anchors.leftMargin: 3
            text: settings.hostname
            clip: true
            color: "black"
        //x:row.width

        }}

    }
       /* }*/
}

        Row{
            spacing: 5
            anchors.horizontalCenter: col.horizontalCenter
        AppButton{

        text: "Save"
        //icon: IconType.save

        onClicked: {
            settings.apiUsername = apiUsername.text
            settings.apiPassword = apiPassword.text
            settings.adminPassword = adminPassword.text


            settings.port = portUsed.currentText
                    settings.numberOfCabinets = cabinNo.currentIndex
            settings.hostname = hostName.text
                   open.setPort(portUsed.currentText)

                    navigationStack.pop()}
        }
        AppButton{

        text: "Cancel"
        //icon: IconType.close
        onClicked: navigationStack.pop()
        }
        /*}*/

        AppButton{
        //anchors.horizontalCenter: parent.horizontalCenter
        text: "Reset Cabinet Password"
        //icon: IconType.recycle


        }

        AppButton{
        //anchors.horizontalCenter: parent.horizontalCenter
        text: "Open All Cabinets"
        //icon: IconType.dropbox
        onClicked: open.openAllChannels()

        }


}
}
    AppText{
    anchors.bottom: parent.bottom
    text: "Property of Zemtech (PTY) LTD "+ new Date().getFullYear()+ " www.zemtech.co.za"
    color: "black"
    fontSize: 8

    }}


