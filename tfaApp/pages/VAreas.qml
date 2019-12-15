import QtQuick 2.0
import QtGraphicalEffects 1.0
import "VAreas"
Rectangle {
    color: '#f2f3f8'
    VImageSlideShow {
        width: parent.width
        height: 150
    }
    VBackBtn {
        onClicked: current_page = 0
        anchors {
            top: parent.top
            topMargin: 20
            left: parent.left
            leftMargin: 20
        }
    }

    RectangularGlow {
        anchors.fill: rect
        glowRadius: 0.1
        spread: 0.01
        color: "gray"
        cornerRadius: rect.radius + glowRadius
    }
    VInfoArea {
        id: rect
        width: parent.width * 0.9
        height: 100
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 80
        }
    }
    Rectangle {
        width: parent.width * 0.9
        height: parent.height - rect.height - 100
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: rect.bottom
            topMargin: 10
        }
        ListView {
            anchors.fill: parent
            model: listLove
            clip: true
            delegate: VDeviceComponent {
            onClicked: {
                device_selected = index
                current_page = 2
            }
            }
        }
    }
}
