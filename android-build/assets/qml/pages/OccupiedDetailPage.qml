import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 1.4

Page {
    property var details
    property var vacantCabinet
    id: detail
    AppImage{
                id:imageLogo
               anchors.left:  parent.left
               anchors.leftMargin: 30
               width: 400
              // height:parent.height

               source: "https://www.greenfield.co.za/wp-content/uploads/logo-1.png"
            }

Grid{
        id:mainGrid
    anchors.top:imageLogo.bottom
    anchors.topMargin: 30
    anchors.horizontalCenter: parent.horizontalCenter
    columns: 2
    spacing: 100


Grid{

    id: textGrid

    columns: 2
    spacing: 10
    AppText{

    text: "Prescription No: "
    color: 'black'

    }

    AppText{

    text: details.prescription[0].PrescriptionId.id
    color: "black"
    }
    AppText{

    text: "Date Created: "
    color: 'black'

    }

    AppText{

    text: Qt.formatDate( details.prescription[0].PrescriptionId.DateCreated,"d MMMM yyyy");
    color: "black"
    }

    AppText{

    text: "Name: "
    color: 'black'

    }

    AppText{

    text: details.prescription[0].PrescriptionId.PatientId.name
    color: "black"
    }
    AppText{

    text: "Surname: "
    color: 'black'

    }

    AppText{

    text: details.prescription[0].PrescriptionId.PatientId.surname
    color: "black"
    }

    AppText{

    text: "ID: "
    color: 'black'

    }

    AppText{

    text: details.prescription[0].PrescriptionId.PatientId.iDnumber
    color: "black"
    }

    AppText{

    text: "Contact Number: "
    color: 'black'

    }

    AppText{

    text: details.prescription[0].PrescriptionId.PatientId.cellNumber
    color: "black"
    }

    AppText{

    text: "Alternate No: "
    color: 'black'

    }

    AppText{

    text: details.prescription[0].PrescriptionId.PatientId.alternateContact
    color: "black"
    }

    AppText{

    text: "Email: "
    color: 'black'

    }

    AppText{

    text: details.prescription[0].PrescriptionId.PatientId.email
    color: "black"
    }

}


TableView {
    id:table
    width: 700
    enabled: false

    height: textGrid.height
    headerDelegate: Rectangle{
        width:table.width
        height: 30
        color: "green"
    AppText{
        anchors.margins: 5
    text: styleData.value
    font.pixelSize: 18
    anchors.fill: parent

    }


    }
    itemDelegate:Item{

        AppText {
            anchors.verticalCenter: parent.verticalCenter

            anchors.fill: parent
            anchors.margins: 5
            color: styleData.textColor
            elide: styleData.elideMode
            text: styleData.value
            font.pixelSize: 14
        }
    }




    TableViewColumn {
        role: "Description"
        title: "Description"
        width: 300

    }
    TableViewColumn {
        role: "Dosage"
        title: "Dosage"
        width: 300
    }
    TableViewColumn {
        role: "Quantity"
        title: "QTY"
        width: 100
    }
   model: details.prescription[0].Pillitem
}

}

Row{
    id:btnRow
    anchors.top:mainGrid.bottom
    anchors.right: mainGrid.right
   // anchors.topMargin: 30

AppButton{
text: "Open and Reset"

onClicked:{ customDialog.title = "Prescription Exists"
    customDialog.text  = "This will open and make the locker available for loading. "
    customDialog.outsideTouchable = false
    customDialog.open()

}
}
AppButton{
text: "Cancel"

onClicked:{ navigationStack.pop()



}
}
}
AppText{
anchors.top: btnRow.bottom
anchors.margins: 50

anchors.horizontalCenter: parent.horizontalCenter
text:"This prescription is stored in locker: "+ vacantCabinet
fontSize: 48
color: "black"

}



Connections{

target: dataModel

onAlreadyLoaded:{








    customDialog.title = "Prescription Exists"
    customDialog.text  = "This prescription has already been loaded on locker "
    customDialog.outsideTouchable = false
    customDialog.open()}





}
Dialog {
       id: customDialog

       property alias text  : dialogText.text
       positiveActionLabel: "Confirm"
       negativeActionLabel: "Cancel"

       onAccepted:{ logic.resetLocker(details)
           navigationStack.popAllExceptFirst()
            close()
       }
       onCanceled: close()
       AppText { //will be placed inside the dialogs content area
                //anchors.margins: dp(30)
               //anchors.horizontalCenter: parent.horizontalCenter
           id: dialogText
           anchors.fill: parent
           color: "black"
           anchors.margins: dp(20)

           wrapMode: Text.WrapAtWordBoundaryOrAnywhere

             }
        }



}
