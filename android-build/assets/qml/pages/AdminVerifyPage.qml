import QtQuick 2.0
import Felgo 3.0

import Felgo 3.0
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.1




Page {

    property var freeCabinetNo
    property var password
    property bool deposit
    property var focusItem

    leftBarItem: NavigationBarItem{
                                     contentWidth: 200




                                    }
    title: "Administrator"


    AppImage{
               anchors.left: parent.left
               anchors.leftMargin:  30
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
            color: "black"


        text: "Please enter your Admin password and click Enter"

        }

        AppTextField{
        id:pwdText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: dp(20)
        height: dp(30)
        width: parent.width/2
        color: "black"
        onFocusChanged:{ focusItem = pwdText}

        visible: !deposit
        validator: IntValidator{
            bottom:0
            top:9

        }
        placeholderText: "Password"
        echoMode: TextInput.Password


        }

    Grid{
        id:buttonGrid
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: dp(20)
    columns: 3
    spacing: dp(3)


    AppButton{
        text:"1"
        onClicked: {focusItem.text = focusItem.text+"1"
            }
    }
    AppButton{
        text:"2"
        onClicked: {focusItem.text = focusItem.text+"2"
                    }
    }
    AppButton{
        text:"3"
        onClicked: {focusItem.text = focusItem.text+"3"
                    }
    }
    AppButton{
        text:"4"
        onClicked: {focusItem.text = focusItem.text+"4"
                    }
    }
    AppButton{
        text:"5"
        onClicked: {focusItem.text = focusItem.text+"5"
                    }
    }
    AppButton{
        text:"6"
        onClicked: {focusItem.text = focusItem.text+"6"
                    }
    }
    AppButton{
        text:"7"
        onClicked:{focusItem.text = focusItem.text+"7"
                    }
    }
    AppButton{
        text:"8"
        onClicked: {focusItem.text = focusItem.text+"8"
                    }
    }
    AppButton{
        text:"9"
        onClicked: {focusItem.text = focusItem.text+"9"
                    }
    }
    AppButton{
        icon: IconType.arrowleft
        onClicked: {focusItem.text = ""
                    }
    }
    AppButton{
        text:"0"
        onClicked:{focusItem.text = focusItem.text+"0"
                    }
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
                if(settings.adminPassword === pwdText.text){

                    navigationStack.push(components.adminPage)

                 }
                else{

                    customDialog.title = "Password Error"
                     customDialog.text  = " Password invalid"
                     customDialog.outsideTouchable = false
                     customDialog.open()


                }}}}}

    }
    AppButton{
    text: "Cancel"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top:column.bottom
    anchors.topMargin: 30
    onClicked: navigationStack.pop()


    }


Component.onCompleted: {
    focusItem = pwdText

    }
    Dialog {
           id: customDialog

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
                horizontalAlignment:Text.AlignHCenter
               wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                 }
            }
    AppText{
    anchors.bottom: parent.bottom
    text: "Property of Zemtech (PTY) LTD "+ new Date().getFullYear()+ " www.zemtech.co.za"
    horizontalAlignment: Text.AlignJustify
    fontSize: 8

    }
}


