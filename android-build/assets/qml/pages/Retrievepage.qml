import Felgo 3.0
import QtQuick 2.0

Page {

    title: "Retrieve deposited luggage"
    leftBarItem: NavigationBarItem{
                                     contentWidth: 200

                                      AppImage{
                                                 anchors.centerIn: parent
                                                 width: 200
                                                // height:parent.height

                                                 source: "file:/Users/Thami/Documents/build-CabinetLocker-Desktop_Qt_5_12_3_MinGW_32_bit-Release/assets/logo.png"
                                              }


                                    }
    MouseArea{
        anchors.fill: parent
        onClicked: timer.restart()


    }
Component.onCompleted: timer.restart()

Column{
anchors.top: parent.top
anchors.right: parent.right
anchors.left: parent.left
width: parent.width

spacing: Theme.navigationBar.defaultBarItemPadding
anchors.margins: Theme.navigationBar.defaultBarItemPadding

AppText{
    id:text
width: parent.width
text: "Select cabinet for retrieval"
horizontalAlignment: Text.AlignHCenter
}
GridView{
width: 350
height: 350
cellWidth: 150
cellHeight: 150


anchors.horizontalCenter: parent.horizontalCenter
model: settings.numberOfCabinets
delegate: Rectangle{

border.color: "black"
color: dataModel.storage.getValue(index+1).occupied ? "red":"green"
height: 120
width: 120
MouseArea{
anchors.fill: parent
enabled: dataModel.storage.getValue(index+1).occupied
 onClicked:   { navigationStack.push(myPassword,{freeCabinetNo:index+1,deposit:false})
 timer.restart()}


}



AppText{
width: parent.width
anchors.centerIn: parent
horizontalAlignment: Text.AlignHCenter
verticalAlignment: Text.AlignVCenter
//font.pixelSize: 12
text: (index+1) +"\n"+ (dataModel.storage.getValue(index+1).occupied ?"Occupied": "Vacant")

}


}


}


}
AppText{
anchors.bottom: parent.bottom
text: "Property of Zemtech (PTY) LTD "+ new Date().getFullYear()+ " www.zemtech.co.za"

fontSize: 8

}
}


