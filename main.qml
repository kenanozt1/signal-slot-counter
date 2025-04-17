import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.15
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Basic Counter Application")
    color:"#212329"

    Connections{
        target:counterController
        // function onDecrementCount(){
        //     counterText.text = counterController.getCount();
        // }
        // function onIncrementCount(){
        //     counterText.text = counterController.getCount();
        // }
        function onValueChanged(){
            counterText.text = counterController.getCount();
        }
    }

    Rectangle{
        id:rectangle
        width: (parent.width/3)*2
        height:(parent.height/3)*2
        anchors.centerIn: parent
        color:"#252931"
        radius: 20
        layer.enabled: true
        layer.effect: DropShadow {
            anchors.fill: rectangle
            source: rectangle
            horizontalOffset: 0
            verticalOffset: 4
            radius: 16
            samples: 25
            color: "#40000000"
        }
        Rectangle{
            anchors.fill: parent
            color:"transparent"
            Rectangle{
                id:text
                color:"transparent"
                height: parent.height*0.3
                anchors{
                    left:parent.left
                    top:parent.top
                    right:parent.right
                }
                Text {
                    text: "Count"
                    anchors.centerIn: parent
                    font.pixelSize: 32
                    font.bold: true
                    color:"lightgray"
                }
            }
            Rectangle{
                id:count
                color:"transparent"
                height: parent.height*0.3
                anchors{
                    left:parent.left
                    top:text.bottom
                    right:parent.right
                }
                Text {
                    id: counterText
                    text: "0"
                    anchors.centerIn: parent
                    font.pixelSize: 70
                    font.bold: true
                    color:"white"
                }
            }
            Rectangle{
                id:button
                color:"transparent"
                height: parent.height*0.3
                anchors{
                    left:parent.left
                    top:count.bottom
                    right:parent.right
                    bottom:parent.bottom
                }
                Rectangle{
                    id:rectLeftArea
                    width:(parent.width*0.8)/2
                    height: parent.height*0.8
                    color:"#3574d5"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.margins: 15
                    radius: 20
                    Text{
                        text:"Decrement"
                        anchors.centerIn: parent
                        font.pixelSize: 28
                        color:"white"
                    }
                    MouseArea{
                        id:buttoLeftnArea
                        anchors.fill: parent
                        onClicked: {
                            counterController.decrementCount();
                            console.log("Clicked Decrement!")
                        }
                    }
                }
                Rectangle{
                    id:rectRightArea
                    width:(parent.width*0.8)/2
                    height: parent.height*0.8
                    color:"#3574d5"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.margins: 15
                    radius: 20
                    Text{
                        text:"Increment"
                        anchors.centerIn: parent
                        font.pixelSize: 28
                        color:"white"
                    }
                    MouseArea{
                        id:buttonRightArea
                        anchors.fill: parent
                        onClicked: {
                            counterController.incrementCount();
                            console.log("Clicked Increment!")
                        }
                    }
                }
            }
        }
    }
}

