import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../qml"
import "VHome"

Item {
    //anchors.fill: parent
    Image {
        id: imgBackground
        source: "qrc:/assets/bg_new.png"
        anchors.fill: parent
        smooth: true
    }
    Rectangle {
        id: mask
        width: 75
        height: 75
        radius: height/2
        visible: false
    }
    Row {
        spacing: 20
        anchors {
            left: parent.left
            leftMargin: 24
            top: parent.top
            topMargin: parent.height * 0.05
        }
        Image {
            id: userLogo
            width: 75
            height: 75
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
                text: getHello()

                font {
                    pixelSize: 24
                }
                color: 'black'
            }
            Text {
                id: lbUser
                text: "Hữu Vinh"

                font {
                    pixelSize: 32
                    bold: true
                }
                color: 'black'
            }
        }
    }


    Item  {
        id: rectSumary
        width: parent.width
        height: parent.height * 0.25
        anchors {
            bottom: rectRoom.top
            bottomMargin: 18
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
                    color: "#264B8C"
                    width: 140
                    height: 140
                    radius: 5
                    Rectangle {
                        anchors.fill: parent
                        color: "#264B8CFF"
                        radius: 10
                    }
                    Text {
                        text: name
                        anchors.centerIn: parent
                        color: 'white'
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            current_page = 1
                        }
                    }
                }
            }
        }
    }
}
