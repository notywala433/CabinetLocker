import Felgo 3.0
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0




Page {

    property var freeCabinetNo
    property var password
    property bool deposit
    leftBarItem: NavigationBarItem{
                                     contentWidth: 200

                                      AppImage{
                                                 anchors.centerIn: parent
                                                 width: 200
                                                // height:parent.height

                                                 source: "file:/Users/Thami/Documents/build-CabinetLocker-Desktop_Qt_5_12_3_MinGW_32_bit-Release/assets/logo.png"
                                              }


                                    }
    title: "Vacant cabinet No: "+freeCabinetNo


    Column{
        id:column
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: dp(Theme.navigationBar.defaultBarItemPadding)
        AppText{
        //anchors.centerIn:  parent
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter


        text: "Please enter your password and click on Enter"

        }

        AppTextField{
        id:pwdText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: dp(20)
        height: dp(30)
        width: parent.width/2
        validator: IntValidator{
            bottom:0
            top:9

        }
        //placeholderText: "Please type in  your password"
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
        onClicked: pwdText.text = pwdText.text+"1"
    }
    AppButton{
        text:"2"
        onClicked: pwdText.text = pwdText.text+"2"
    }
    AppButton{
        text:"3"
        onClicked: pwdText.text = pwdText.text+"3"
    }
    AppButton{
        text:"4"
        onClicked: pwdText.text = pwdText.text+"4"
    }
    AppButton{
        text:"5"
        onClicked: pwdText.text = pwdText.text+"5"
    }
    AppButton{
        text:"6"
        onClicked: pwdText.text = pwdText.text+"6"
    }
    AppButton{
        text:"7"
        onClicked: pwdText.text = pwdText.text+"7"
    }
    AppButton{
        text:"8"
        onClicked: pwdText.text = pwdText.text+"8"
    }
    AppButton{
        text:"9"
        onClicked: pwdText.text = pwdText.text+"9"
    }
    AppButton{
        icon: IconType.arrowleft
        onClicked: pwdText.text = ""
    }
    AppButton{
        text:"0"
        onClicked: pwdText.text = pwdText.text+"0"
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
                    password = pwdText.text
                    logic.retrieve(freeCabinetNo,password)
                    navigationStack.popAllExceptFirst()
                }}}}}
    AppText{
    width: parent.width
    text: deposit? ("Please make sure your luggage is deposited in Cabinet No: "+freeCabinetNo+".\n"+"Close the door after depositing! "):("You are retrieving luggage from Cabinet No: "+freeCabinetNo+".\n"+"Close the door after retrieving! ")
    color: "red"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    horizontalAlignment: Text.AlignHCenter

    }
    }



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


