import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: item
    RectangularGlow {
        anchors.fill: rect
        glowRadius: 0.1
        spread: 0.01
        color: "gray"
        cornerRadius: rect.radius + glowRadius
    }

    Rectangle {
        id: rect
        color: "white"
        width: item.width * 0.9
        height: item.height * 0.85
        radius: 10
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        Rectangle {
            anchors.fill: parent
            color: "#264B8CFF"
            radius: 10
        }
        Rectangle {
            id: maskGradiant
            width: parent.width
            height: parent.height
            radius: 10
            visible: false
        }
        Item {
            id: icon
            width: parent.width * 0.2
            height: parent.height * 0.8
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
            Text {
                text: model.icon
                anchors.centerIn: parent
                color: "#F1C40F"
                font {
                    family: fontAwesome.name
                    pixelSize: 24
                }
            }
        }
        Column {
            anchors {
                verticalCenter: parent.verticalCenter
                left: icon.right
                leftMargin: 5
            }
            spacing: 5
            Text {
                text: model.name
                color: "#4D5656"
                font {
                    pixelSize: 15
                }
            }
            Text {
                text: model.area
                color: "#909497"
                font {
                    pixelSize: 12
                }
            }
        }
    }
}
