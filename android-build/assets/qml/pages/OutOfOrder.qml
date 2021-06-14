import QtQuick 2.0
import Felgo 3.0

Page {

    id: outofOrder
    title: "Out Of Order"
    Rectangle {
           id: rect
           width: 100; height: 100
           color: "green"

           PropertyAnimation on x { to: 100 }
           PropertyAnimation on y { to: 100 }
           AppText{
           text: "Out of Order"


           }
         }

}
