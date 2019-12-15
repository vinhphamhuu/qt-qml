import QtQuick 2.0

Rectangle {
    radius: 5
    Image {
        id: imgAreaIcon
        source: listRoom.get(areas_selected).url
        height: parent.height * 0.5
        width: height
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 18
        }
        smooth: true
    }
    Column {
        spacing: 5
        anchors {
            verticalCenter: parent.verticalCenter
            left: imgAreaIcon.right
            leftMargin: 18
        }
        Text {
            text: listRoom.get(areas_selected).name
            font {
                pixelSize: 24
                bold: true
            }
        }
        Text {
            text: listRoom.get(areas_selected).count + " thiết bị"
            font {
                pixelSize: 15
            }
        }
    }
    Rectangle {
        width: 32
        height: width
        radius: height
        anchors {
            verticalCenter: parent.verticalCenter
            right:  parent.right
            rightMargin: 20
        }
        color: 'white'
        Text {
            text: "\uf013"
            anchors.centerIn: parent
            color: "gray"
            font {
                family: fontAwesome.name
                pixelSize: 18
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }
    }
}
