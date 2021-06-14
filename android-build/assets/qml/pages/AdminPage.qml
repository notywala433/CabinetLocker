import QtQuick 2.0
import Felgo 3.0

Page {

    id: admin
    property var lockData: dataModel.storage


    AppImage{
                id:image
               anchors.left: parent.left
               anchors.leftMargin: 30
               width: 400
              // height:parent.height

               source: "https://www.greenfield.co.za/wp-content/uploads/logo-1.png"
            }
        onPopped: navigationStack.popAllExceptFirst()
        Row{
            id:row
        anchors.top: image.bottom
        spacing: 2
        anchors.horizontalCenter: parent.horizontalCenter
        Column{
            spacing: 2
        Rectangle
        {
            height: 100
            width: 100
            color: lockData.getValue(2).occupied? "red":"green"

            AppText{
            anchors.centerIn: parent
            text:   lockData.getValue(2).occupied? "Occupied":"Vacant"

            }
            MouseArea{
            anchors.fill: parent

            enabled: lockData.getValue(2).occupied
            onClicked: navigationStack.push(components.occupiedDetailPage,{details:lockData.getValue(2),vacantCabinet:2 })
            }

        }

        Rectangle
        {
            height: 100
            width: 100
            color: lockData.getValue(3).occupied? "red":"green"
            AppText{
            anchors.centerIn: parent
            text:   lockData.getValue(3).occupied? "Occupied":"Vacant"

            }
            MouseArea{
            anchors.fill: parent

            enabled: lockData.getValue(3).occupied
            onClicked: navigationStack.push(components.occupiedDetailPage,{details:lockData.getValue(3),vacantCabinet:3 })
            }
        }

        }

        Column{
            spacing: 2
        Rectangle
        {
            height: row.height
            width: 100
            color: "red"

            Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 5
            height: 50
            width: parent.width
            color: "white"
            Image {
                id: img
                source: "../../assets/images.jpg"
                anchors.fill: parent
            }


            }

        }



        }

        Column{
            spacing: 2
        Rectangle
        {
            height: 100
            width: 100
            color: lockData.getValue(1).occupied? "red":"green"
            AppText{
            anchors.centerIn: parent
            text:   lockData.getValue(1).occupied? "Occupied":"Vacant"

            }
            MouseArea{
            anchors.fill: parent
            onClicked: navigationStack.push(components.occupiedDetailPage,{details:lockData.getValue(1),vacantCabinet:1 })
            enabled: lockData.getValue(1).occupied
            }
        }

        Rectangle
        {
            height: 100
            width: 100

             color: lockData.getValue(4).occupied? "red":"green"
             AppText{
             anchors.centerIn: parent
             text:   lockData.getValue(4).occupied? "Occupied":"Vacant"

             }
             MouseArea{
             anchors.fill: parent

             enabled: lockData.getValue(4).occupied
             onClicked:navigationStack.push(components.occupiedDetailPage,{details:lockData.getValue(4),vacantCabinet:4 })
             }
        }

        }




        }


        Grid{
            anchors.centerIn: parent
        spacing: 3
        columns: 2
   AppButton{
    text:"Load Prescription"
    implicitWidth: 250
    onClicked: {
        var count=0
                for(var i=1;i<=settings.numberOfCabinets;i++){
                    var data = lockData.getValue(i)
                    if(data.occupied == true){
                        count++

                    }

                }

                if(count == 4){
                    customDialogadmin.title = "Notification"
                     customDialogadmin.text  = "Locker is now full"
                     customDialogadmin.outsideTouchable = false
                     customDialogadmin.open()

                }
                else{
                navigationStack.push(components.prescriptionPage)}

        }
   }
   AppButton{
    text:"Open Reset Locker"
    implicitWidth: 250
    }
   AppButton{
    text:"Settings"
    onClicked: navigationStack.push(components.settingsPage)
    implicitWidth: 250
    }
   AppButton{
    text:"Resend Collection SMS"
    implicitWidth: 250

    }
}

        Dialog {
               id: customDialogadmin

               property alias text  : dialogText.text
               positiveActionLabel: "OK"

               //negativeActionLabel: "No"
               //onCanceled: title = "Think again!"
               onAccepted: close()
               onCanceled: close()
               AppText { //will be placed inside the dialogs content area
                        //anchors.margins: dp(30)
                       //anchors.horizontalCenter: parent.horizontalCenter
                   id: dialogText
                   anchors.fill: parent
                   color: "black"
                   anchors.margins: dp(20)

                   wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    horizontalAlignment:Text.AlignHCenter
                     }
                }
}
