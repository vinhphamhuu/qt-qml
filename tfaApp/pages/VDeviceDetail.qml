import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick 2.12
Rectangle {

    property int speed_fan: 5000
    VBackBtn {
        onClicked: current_page = 1
        anchors {
            top: parent.top
            topMargin: 20
            left: parent.left
            leftMargin: 20
        }
    }

    Text {
        id: lbNameDevice
        text: listLove.get(device_selected).name
        font {
            pixelSize: 24
            bold: true

        }
        color: "gray"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }
    }
    Rectangle {
        width: parent.width / 4
        height: 40
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: lbNameDevice.bottom
            topMargin: 40
        }
        Rectangle {
            id: rectOnOff
            height: parent.height
            width: height
            radius: height
            color: vstatus ?  "#FF6969" : "#33C897"
            anchors.centerIn: parent
            property bool vstatus: false

            Text {
                text: "\uf011"
                font {
                    family: fontAwesome.name
                    pixelSize: 18
                }
                anchors.centerIn: parent
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rectOnOff.vstatus = !rectOnOff.vstatus

                }
            }
        }
    }
    ColorOverlay {
        anchors.fill: iconDevice
        source: iconDevice
        color: "lightyellow"  // make image like it lays under red glass
    }
    Image {
        id: iconDevice
        source: listLove.get(device_selected).url
        width: parent.width * 0.5
        height: width
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: parent.height * 0.3
        }
        smooth: true
        RotationAnimator on rotation {
//            target: iconDevice
            running: rectOnOff.vstatus ;
            from: 0;
            to: 360;
            duration: speed_fan;
            loops: Animation.Infinite
        }
//        PropertyAnimation {
//            target: iconDevice
//            running: rectOnOff.vstatus ; property: "rotation"
//            from: 0; to: 359; duration: speed_fan; loops: Animation.Infinite
//        }

        //        Behavior on rotation {
        //            NumberAnimation { duration: 200 }
        //        }

        //        RotationAnimation on rotation {

        //            loops: Animation.Infinite
        //            from: 0
        //            to: 359
        //            duration: speed_fan
        //            running: rectOnOff.vstatus
        //        }

    }
//    Image {
//        id: img_fan
//        width: rotatingBox.height
//        height: rotatingBox.height
//        anchors {
//            verticalCenter: rotatingBox.verticalCenter
//            right: rotatingBox.right
//        }


//        fillMode: Image.PreserveAspectFit
//        source: "qrc:/image/fan.png"

//        RotationAnimator on rotation {
//            from: 360 * view_driection
//            to:  360 - 360 * view_driection
//            duration: 3000
//            running: true
//            loops: Animation.Infinite
//            direction:  view_driection == 0 ? RotationAnimator.Clockwise : RotationAnimator.Counterclockwise
//        }
//    }
    Row {
        height: 50
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: parent.height * 0.1
        }
        spacing: 10
        Rectangle {
            height: parent.height
            width: height
            radius: height
            color: "#33C897"

            Text {
                text: qsTr("1")
                anchors.centerIn: parent
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rectOnOff.vstatus = false
                    speed_fan = 5000
                    rectOnOff.vstatus = true
                }
            }
        }
        Rectangle {
            height: parent.height
            width: height
            radius: height
            color: "#33C897"

            Text {
                text: qsTr("2")
                anchors.centerIn: parent
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rectOnOff.vstatus = false
                    speed_fan = 3000
                    rectOnOff.vstatus = true
                }
            }
        }
        Rectangle {
            height: parent.height
            width: height
            radius: height
            color: "#33C897"
            Text {
                text: qsTr("3")
                anchors.centerIn: parent
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rectOnOff.vstatus = false
                    speed_fan = 1000
                    rectOnOff.vstatus = true
                }
            }
        }
    }
}
