import QtQuick 2.0

Item {
    id: root
    width: parent.width
    height: 80
    signal clicked
    Rectangle {
        width: parent.width
        height: 1
        anchors.bottom: parent.bottom
        color: "#CCD1D1"
    }
    Image {
        id: imgDevice
        height: parent.height * 0.5
        width: height
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 18
        }
        source: url
    }
    Column {
        spacing: 10
        anchors {
            verticalCenter: parent.verticalCenter
            left: imgDevice.right
            leftMargin: 18
        }
        Text {
            text: name
            font {
                pixelSize: 18
            }
        }
        Rectangle {
            height: lbStatus.height  + 10
            width: lbStatus.width + 20
            radius: height
            color: status ? "#33C897" : "#FF6969"
            Text {
                id: lbStatus
                text: status ? "Đang hoạt động" : "Mất kết nối"
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 8
            }
        }
    }

    Text {
        text: value
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 18
        }
        font {
            pixelSize: parent.height * 0.5
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()

    }
}
