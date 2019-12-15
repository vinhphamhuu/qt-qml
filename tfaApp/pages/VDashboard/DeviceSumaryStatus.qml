import QtQuick 2.0

Item {
    id: root
    property int p_min: 0
    property int p_max: 100
    property int p_cur: 20
    width: id_canvas.width + colStatus.width + 40
    Canvas {
        id: id_canvas
        anchors {
            left: root.left
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }
        contextType: "2d"
        antialiasing: true
        height: root.height * 0.8
        width: height
        rotation: 270
        smooth: true
        onPaint: {
            var context = id_canvas.getContext('2d');
            context.strokeStyle = "#33C897";

            context.lineWidth = id_canvas.height * 0.1;
            context.beginPath();
            context.arc(id_canvas.height / 2, id_canvas.height / 2, id_canvas.height / 2 * 0.85, 0, Math.PI * 2, false);
            context.stroke();

            context.strokeStyle = "#FF6969";
            context.beginPath();
            context.arc(id_canvas.height / 2, id_canvas.height / 2, id_canvas.height / 2 * 0.85, 0, Math.PI * 2 * root.p_cur / root.p_max, false);
            context.stroke();
        }
    }
    Column {
        id: colTotal
        spacing: 5
        anchors.centerIn: id_canvas
        Text {
            id: lbTotalDevices
            text: "120"
            font.pixelSize: root.height * 0.15
            color: "black"
            anchors.horizontalCenter: lbAll.horizontalCenter
        }
        Text {
            id: lbAll
            text: "Tổng thiết bị"
            font.pixelSize: root.height * 0.05
            color: "gray"
        }
    }
    Column {
        id: colStatus
        spacing: 20
        anchors {
            left: id_canvas.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        Row {
            spacing: 5
            Rectangle {
                id: rectOnline
                height: 15
                width: height
                radius: height
                color: "#33C897"
            }
            Text {
                text: "Đang hoạt động - (" + (100 - root.p_cur) + "%)"
                anchors.verticalCenter: rectOnline.verticalCenter
                color: "gray"
                font.pixelSize: 13
            }
        }
        Row {
            spacing: 5
            Rectangle {
                id: rectOffline
                height: 15
                width: height
                radius: height
                color: "#FF6969"
            }
            Text {
                text: "Mất tín hiệu - (" + root.p_cur + "%)"
                anchors.verticalCenter: rectOffline.verticalCenter
                color: "gray"
                font.pixelSize: 13
            }
        }
    }

}
