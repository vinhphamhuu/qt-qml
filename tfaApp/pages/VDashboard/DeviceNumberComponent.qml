import QtQuick 2.0
import QtQuick.Layouts 1.13

Item {
    height: 32
    width: lbNumber.width + lbTypeDevice.width + 20
    //color: "lightblue"

    GridLayout {
        id: grid
        columns: 2
        Layout.bottomMargin: 5
        Layout.alignment: Qt.AlignBottom
        Text {
            id: lbNumber
            text: number
            font.pixelSize: 28
            smooth: true
            color: "#3498DB"
        }
        Text {
            id: lbTypeDevice
            text: type
            color: "#154360"
            smooth: true

            font.pixelSize: 12
        }
    }

    Rectangle {
        width: 1
        height: parent.height * 0.5
        color: "#CCD1D1"
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
    }

}
