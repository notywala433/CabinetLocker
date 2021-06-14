import Felgo 3.0
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0




Page {

    property var freeCabinetNo
    property var password
    property bool deposit
    property var focusItem


    leftBarItem: NavigationBarItem{
                                     contentWidth: 200




                                    }
    title: freeCabinetNo? "Vacant cabinet No: ": "Prescription Loading"
    AppImage{
                anchors.left: parent.left
               anchors.leftMargin: parent.leftMargin
               width: 400
              // height:parent.height

               source: "https://www.greenfield.co.za/wp-content/uploads/logo-1.png"
            }

    Column{
        id:column
        anchors.centerIn: parent
        spacing: 10
        anchors.margins: dp(Theme.navigationBar.defaultBarItemPadding)
        AppText{
        //anchors.centerIn:  parent
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter



        text: "Please enter your Prescription No, Pin and click Enter"
        color: "black"
        }
        AppTextField{
        id:prescriptionText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: dp(20)

        height: dp(30)
        width: parent.width/2
        validator: IntValidator{
            bottom:0
            top:9

        }
        color: "black"
        placeholderText: "Prescription No"

        maximumLength: 4
        onPressed: focusItem = prescriptionText
        //onActiveFocusChanged: focusItem = pwdText
        }

        AppTextField{
        id:pwdText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: dp(20)
        height: dp(30)
        width: parent.width/2
        color: "black"
        onPressed: { focusItem = pwdText}

        visible: !deposit
        validator: IntValidator{
            bottom:0
            top:9

        }
        placeholderText: "Password"
        echoMode: TextInput.Password
        maximumLength: 4

        }

    Grid{

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: dp(20)
    columns: 3
    spacing: dp(3)


    AppButton{
        text:"1"
        onClicked: focusItem.text = focusItem.text+"1"
    }
    AppButton{
        text:"2"
        onClicked: focusItem.text = focusItem.text+"2"
    }
    AppButton{
        text:"3"
        onClicked: focusItem.text = focusItem.text+"3"
    }
    AppButton{
        text:"4"
        onClicked: focusItem.text = focusItem.text+"4"
    }
    AppButton{
        text:"5"
        onClicked: focusItem.text = focusItem.text+"5"
    }
    AppButton{
        text:"6"
        onClicked: focusItem.text = focusItem.text+"6"
    }
    AppButton{
        text:"7"
        onClicked:focusItem.text = focusItem.text+"7"
    }
    AppButton{
        text:"8"
        onClicked: focusItem.text = focusItem.text+"8"
    }
    AppButton{
        text:"9"
        onClicked: focusItem.text = focusItem.text+"9"
    }
    AppButton{
        icon: IconType.arrowleft
        onClicked: focusItem.text = ""
    }
    AppButton{
        text:"0"
        onClicked:focusItem.text = focusItem.text+"0"
    }
    AppButton{
       text:"Enter"
       onClicked: {
            //Validate and make sure there password length is not less than 4 characters or less
            if(pwdText.text === ""|| pwdText.length<4){
               customDialog.title = "Password Error"
                customDialog.text  = " Password cannot be empty or less than 4 characters"
                customDialog.outsideTouchable = false
                customDialog.open()
            }
            else{
                if(deposit){
                    password = pwdText.text
                    logic.openCabinet(freeCabinetNo,password)
                    navigationStack.pop()
                 }
                else{
                   var preNumber = prescriptionText.text
                    var password = pwdText.text
                    logic.retrieve(preNumber,password)

                    navigationStack.popAllExceptFirst()
                }}}}}


    AppText{
    width: parent.width
    text: deposit? ("Please close the door after depositing!"):("Please close the door after retrieving! ")
    color: "red"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    horizontalAlignment: Text.AlignHCenter

    }
    }
    AppButton{
    text: "Cancel"
    implicitWidth: column.implicitWidth
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: column.bottom
    anchors.topMargin: 10
    onClicked: navigationStack.pop()

    }

Component.onCompleted:  if(!deposit){ focusItem = prescriptionText}
    Dialog {
           id: customDialog
           title:" The open cabinet is :" +freeCabinetNo
           property alias text  : dialogText.text
           positiveActionLabel: "OK"
           //negativeActionLabel: "No"
           //onCanceled: title = "Think again!"
           onAccepted: close()
           onCanceled: navigationStack.pop()
           AppText { //will be placed inside the dialogs content area
                    //anchors.margins: dp(30)
                   //anchors.horizontalCenter: parent.horizontalCenter
               id: dialogText
               anchors.fill: parent
               color: "black"
               anchors.margins: dp(20)
               text: "Cabinet No: "+freeCabinetNo+" has been reserved for you"
               wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                 }
            }
    AppText{
    anchors.bottom: parent.bottom
    text: "Property of Zemtech (PTY) LTD "+ new Date().getFullYear()+ " www.zemtech.co.za"

    fontSize: 8

    }
}


