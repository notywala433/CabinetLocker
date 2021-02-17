import Felgo 3.0
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0




Page {

    property var portNumber
    property var baudRate
    property bool numberOfCabinets
    Component.onCompleted:console.log("previous port name "+settings.port)
    leftBarItem: NavigationBarItem{
                                     contentWidth: 200

                                      AppImage{
                                                 anchors.centerIn: parent
                                                 width: 200
                                                // height:parent.height

                                                 source: "file:/Users/Thami/Documents/build-CabinetLocker-Desktop_Qt_5_12_3_MinGW_32_bit-Release/assets/logo.png"
                                              }


                                    }
    title: "Application Settings "
    Column{
        id:col
        anchors.fill: parent
        spacing: 5
        anchors.margins: 15

    Grid{
        id:column
        anchors.horizontalCenter: col.horizontalCenter
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


            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignLeft
            fontSize: 12

        text: "Number of Cabinets: "

        }
        ComboBox{
            id:comboBox
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

            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignLeft
            fontSize: 12

        text: "Port Used :"

        }
        ComboBox{
            id:combo
            width: 100
        model:open.availablePorts()
       // x: row.width
        //currentIndex: open.availablePorts()








        }
        AppText{


            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignLeft
            fontSize: 12

        text: "Type: "

        }
        ComboBox{
            id:comboBox3
            width: 100
        model:["Coin","RFID","Password","Remote","Finger Print"]
        currentIndex: 2

        //x:row.width

        }

    }
       /* }*/
        Row{
            spacing: 5
            anchors.horizontalCenter: col.horizontalCenter
        AppButton{

        text: "Save"
        //icon: IconType.save

        onClicked: {settings.port = combo.currentText
                    settings.numberOfCabinets = comboBox.currentIndex
                    open.setPort(combo.currentText)}
        }
        AppButton{

        text: "Cancel"
        //icon: IconType.close
        onClicked: navigationStack.popAllExceptFirst()
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

    fontSize: 8

    }}


