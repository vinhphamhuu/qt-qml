import QtQuick 2.0
import QtGraphicalEffects 1.0
import "VDashboard"
import "VHome"
Item {
    Image {
        id: imgBackground
        source: getImageBackground(time_in_day)
        anchors.fill: parent
        smooth: true
    }
    function getImageBackground(key) {
        var url
        switch (key) {
        case 0:
            url = "qrc:/assets/morning.jpg"
            break;
        case 1:
            url = "qrc:/assets/afternoon.jpg"
            break;
        case 2:
            url = "qrc:/assets/evening.jpg"
            break;
        default:
            url = "qrc:/assets/bg_new.png"
            break;
        }
        return url;
    }

    Rectangle {
        id: mask
        width: 50
        height: 50
        radius: height/2
        visible: false
    }
    Row {
        id: rowUser
        spacing: 20
        anchors {
            left: parent.left
            leftMargin: 24
            top: parent.top
            topMargin: parent.height * 0.05
        }
        Image {
            id: userLogo
            width: 50
            height: 50
            source: "qrc:/assets/afternoon.jpg"
            anchors.verticalCenter: columnWelcome.verticalCenter
            fillMode: Image.PreserveAspectCrop
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }
        }
        Column {
            id: columnWelcome
            spacing: 5
            Text {
                id: lbHello
                text: status_welcome
                font {
                    pixelSize: 15
                }
                color: 'black'
            }
            Text {
                id: lbUser
                text: "Hữu Vinh"

                font {
                    pixelSize: 18
                    bold: true
                }
                color: 'black'
            }
        }

    }
    Column {
        id: columnClock
        spacing: 5
        anchors {
            right: parent.right
            rightMargin: 24
            top: parent.top
            topMargin: parent.height * 0.05
        }
        Text {
            id: lbDay
            text: Qt.formatDate(new Date(),"dd/MM/yyyy")
            font {
                pixelSize: 15
                bold: true
            }
            color: 'black'
        }
        Text {
            id: lbClock
            text: time_display
            font {
                pixelSize: 15
            }
            color: 'black'
        }
    }
    RectangularGlow {
        anchors.fill: rect
        glowRadius: 0.1
        spread: 0.01
        color: "gray"
        cornerRadius: rect.radius + glowRadius
    }

    Rectangle {
        id: rect
        width: parent.width * 0.95
        height: 200
        radius: 5
        color: "white"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: rowUser.bottom
            topMargin: 20
        }
        DeviceSumaryStatus {
            height: parent.height * 0.75
            anchors {
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 20
            }
        }

        //list device type
        ListModel {
            id: listDeviceType
            ListElement {
                number: 55
                type: "Đèn"
            }
            ListElement {
                number: 5
                type: "Quạt máy"
            }
            ListElement {
                number: 9
                type: "Camera"
            }
            ListElement {
                number: 2
                type: "Cảm biến nhiệt độ"
            }
            ListElement {
                number: 2
                type: "Cảm biến độ ẩm"
            }
            ListElement {
                number: 2
                type: "Tốc độ gió"
            }
            ListElement {
                number: 5
                type: "Máy lạnh"
            }
        }

        Item {
            width: parent.width
            height: 32
            anchors {
                bottom: rect.bottom
                bottomMargin: 10
            }
            Flickable {
                width: parent.width * 0.9
                height: parent.height
                flickableDirection: Flickable.HorizontalFlick
                clip: true
                contentWidth: rowList.width + 20;
                contentHeight: rowList.height
                Row {
                    id: rowList
                    spacing: 10
                    anchors {
                        left: parent.left
                        leftMargin: 20
                    }
                    Repeater {
                        model: listDeviceType
                        DeviceNumberComponent {  }
                    }
                }
            }
        }

    }

    //list loves
    Item  {
        id: rectSumary
        width: parent.width
        height: parent.height * 0.25
        anchors {
            top: rect.bottom
            topMargin: 18
        }
        Text {
            text: "Danh sách yêu thích"
            color: 'white'
            anchors {
                left: parent.left
                leftMargin: 18
                top: parent.top
            }
            font.pixelSize: 15
        }
        Item {
            id: itemListLove
            width: parent.width
            height: parent.height * 0.85
            anchors {
                left: parent.left
                leftMargin: 18
                bottom: parent.bottom
            }
            GridView {
                id: grid
                anchors.fill: parent
                //anchors.margins: 2
                cellWidth: mainApp.width * 0.4 ;
                cellHeight: itemListLove.height / 2
                model: listLove
                delegate: LoveComponent {
                    width: mainApp.width * 0.4
                    height: itemListLove.height / 2
                }

                focus: true
                layoutDirection: Qt.LeftToRight
                flow: GridView.FlowTopToBottom
                clip: true
            }
        }
    }
    //list areas
    Item {
        id: rectRoom
        width: parent.width
        height: parent.height * 0.25
        anchors {
            bottom: parent.bottom
            bottomMargin: 18
        }
        Item {
            id: itemAreasHead
            width: parent.width
            height: parent.height * 0.2
            Row {
                spacing: 10
                anchors {
                    left: parent.left
                    leftMargin: 18
                    verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "Khu vực"
                    color: 'white'
                    anchors.verticalCenter: icon.verticalCenter
                    font.pixelSize: 15
                }
                Text {
                    id: icon
                    text: "\uf055"
                    color: "white"
                    font {
                        family: fontAwesome.name
                        pixelSize: 14
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listRoom.append({"name": "Phong "+listRoom.count, "key": "room_c" })
                            console.log(listRoom.count, listRoom.count - 1, 1)
                            listRoom.move(listRoom.count-1, 0, 1)
                        }
                    }
                }
            }
            Text {
                text: qsTr("Tất cả")
                anchors {
                    right: parent.right
                    rightMargin: 18
                    verticalCenter: parent.verticalCenter
                }
                color: "white"
            }
        }
        Item {
            id: itemListRoom
            width: parent.width
            height: parent.height * 0.8
            anchors {
                left: parent.left
                leftMargin: 18
                bottom: parent.bottom
            }
            ListView {
                anchors.fill: parent
                spacing: 8
                clip: true
                model: listRoom
                orientation: ListView.Horizontal
                delegate: roomDelegate
            }

            Component {
                id: roomDelegate
                Rectangle {
                    color: "white"
                    width: 140
                    height: 140
                    radius: 5
                    Image {
                        id: imgIcon
                        source: url
                        width: parent.width * 0.4
                        height: parent.height * 0.4
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            top: parent.top
                            topMargin: 10
                        }
                        smooth: true
                    }
                    Text {
                        text: name
                        color: 'gray'
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            top: imgIcon.bottom
                            topMargin: 10
                        }
                        font.pixelSize: 15
                    }
                    Text {
                        text: count + " thiết bị"
                        color: 'gray'
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            bottom: parent.bottom
                            bottomMargin: 10
                        }
                        font.pixelSize: 10
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            areas_selected = index
                            console.log(areas_selected)
                            current_page = 1
                        }
                    }
                }
            }
        }
    }

}
