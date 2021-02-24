import Felgo 3.0
import QtQuick 2.0
import Qt.labs.settings 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0

Page {
           title   : qsTr("Touch to operate")
            id:main
           //Settings shortcut



           //App logo

           leftBarItem: NavigationBarItem{
                                            contentWidth: 200

                                             AppImage{
                                                        anchors.centerIn: parent
                                                        width: 200
                                                       // height:parent.height

                                                        source: "file:/Users/Thami/Documents/build-CabinetLocker-Desktop_Qt_5_12_3_MinGW_32_bit-Release/assets/logo.png"
                                                     }


                                           }
                                    Column{
                                            anchors.centerIn    : parent
                                            anchors.margins     : dp(15)
                                            spacing             : Theme.navigationBar.defaultBarItemPadding
                                                AppText{

                                                            text                        : "Please select an option below"
                                                            width                       : parent.width
                                                            font.pixelSize              : sp(12)
                                                            wrapMode                    :Text.WrapAtWordBoundaryOrAnywhere
                                                            horizontalAlignment         : Text.AlignHCenter


                                                        }
                                                Row{
                                                    // anchors.centerIn: parent
                                                        spacing : 15
                                                       AppButton{
                                                                    // backgroundColor: "#BDE1FE"
                                                                    id          :retrieveButton
                                                                    text        : "Retrieve"
                                                                    icon: IconType.signout
                                                                    width       : dp(150)
                                                                    onClicked   :{var freeCabinet = 0
                                                                        for(var i =1;i<=settings.numberOfCabinets;i++){
                                                                            var result = dataModel.storage.getValue(i)
                                                                            if(result.occupied=== true )
                                                                               {        freeCabinet = i+1
                                                                                navigationStack.push(components.retrievePage,{})
                                                                                break
                                                                                }

                                                                        }

                                                                        if(freeCabinet===0)
                                                                          {
                                                                            dialogText.text = "Nothing to retrieve! \nThere are no cabinets in use.\n "
                                                                            cabinetDialog.open()}





                                                                        }

                                                                }
                                                       AppButton{
                                                                    //backgroundColor: "#BDE1FE"
                                                                    width       : dp(150)
                                                                     text       : "Deposit"
                                                                    icon:IconType.signin
                                                                     onClicked  :{
                                                                                logic.deposit()
                                                                                timer.restart()



                                                                                                    }

                }
            }
            }

Connections{

target: dataModel
onLockOpened:navigationStack.push(components.passworPage,{freeCabinetNo:freeCabinet,deposit:true})
onNoLockAvailable:{dialogText.text = "Unfortunately, there are no cabinets available for rental"
cabinetDialog.open()}
onOpenSettings: {navigationStack.push(components.settingsPage)}
}

AppText{
anchors.bottom: parent.bottom
text: "Property of Zemtech (PTY) LTD "+ new Date().getFullYear()+ " www.zemtech.co.za"

fontSize: 8

}

Dialog{
    id:cabinetDialog
title: "No service"
negativeAction: false
onAccepted: close()
onCanceled: close()
AppText{
    id:dialogText

    anchors.fill: parent
    anchors.margins: dp(20)
    horizontalAlignment: Text.horizontalCenter
    width: parent.width

wrapMode: Text.WrapAtWordBoundaryOrAnywhere

}

}



}

