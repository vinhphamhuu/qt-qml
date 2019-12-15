import QtQuick 2.0

Rectangle {
    id: root
    width: 32
    height: width
    radius: height

    color: 'white'
    signal clicked
    Text {
        id: icon
        text: "\uf053"
        anchors.centerIn: parent
        color: "gray"
        font {
            family: fontAwesome.name
            pixelSize: 14
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.clicked()
            }
        }
    }
}
