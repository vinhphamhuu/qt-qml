import QtQuick 2.6
import QtQuick.Window 2.2
//import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import "pages"

Window {
    id: mainApp
    visible: true
    width: 480
    height: 720
    title: qsTr("Home App")
    color: "#f2f3f8"
    //visibility: Window.FullScreen

    property int current_page: 0
    property string status_welcome: ""
    property string time_display: ""

    property int time_in_day

    property int areas_selected
    property int device_selected: 0


    Timer {
        id: timerClock
        interval: 1000
        repeat: true
        onTriggered: {
            status_welcome = getHello()
            time_display = Qt.formatTime(new Date(),"hh:mm:ss")
        }
    }
    Component.onCompleted: status_welcome = getHello()
    function getHello() {
        var today = new Date()
        var curHr = today.getHours()


        if (curHr < 12) {
            time_in_day = 0
            return "Chào buổi sáng,"
        } else if (curHr < 18) {
            time_in_day = 1
            return "Chào buổi trưa,"

        } else {
            time_in_day = 2
            return "Chào buổi tối,"
        }
    }

    FontLoader {
        id: fontAwesome
        source: "qrc:/fonts/fontawesome-webfont.ttf"
    }

    ListModel {
        id: listImage
        ListElement {
            keys: "morning"
            url: "qrc:/assets/morning.jpg"
        }
    }
    ListModel {
        id: listRoom
        ListElement {
            keys: "area_01"
            name: "Phòng khách"
            url: "qrc:/assets/areas/area_01.svg"
            count: 10
        }
        ListElement {
            keys: "area_02"
            name: "Nhà bếp"
            url: "qrc:/assets/areas/area_02.svg"
            count: 6
        }
        ListElement {
            keys: "area_03"
            name: "Phòng ngủ"
            url: "qrc:/assets/areas/area_03.svg"
            count: 29
        }
        ListElement {
            keys: "area_04"
            name: "Phòng ngủ bé"
            url: "qrc:/assets/areas/area_02.svg"
            count: 1
        }
        ListElement {
            keys: "area_01"
            name: "Ngoài sân"
            url: "qrc:/assets/areas/area_02.svg"
            count: 3
        }
    }
    ListModel {
        id: listLove
        ListElement {
            icon: "\uf0eb"
            name: "Đèn nhà bếp"
            area: "Nhà bếp"
            area_id: "area_02"
            url: "qrc:/assets/devices/light.svg"
            status: true
            value: "100"
        }
        ListElement {
            icon: "\uf06c"
            name: "Quạt máy"
            area: "Phòng khách"
            url: "qrc:/assets/devices/fan.svg"
            status: true
            value: "100"
            area_id: "area_01"
        }
        ListElement {
            icon: "\uf042"
            name: "Camera ngoài sân"
            area: "Sân vườn"
            url: "qrc:/assets/devices/camera.svg"
            status: true
            value: "100"
            area_id: "area_02"
        }
        ListElement {
            icon: "\uf042"
            name: "Cảm biến độ ẩm"
            area: "Phòng ngủ chính"
            url: "qrc:/assets/devices/humi.svg"
            status: true
            value: "75"
            area_id: "area_03"
        }
        ListElement {
            icon: "\uf0eb"
            name: "Đèn phòng ngủ"
            area: "Phòng ngủ bé"
            url: "qrc:/assets/devices/light.svg"
            status: false
            value: "100"
            area_id: "area_04"
        }
        ListElement {
            icon: "\uf0eb"
            name: "Đèn nhà bếp"
            area: "Nhà bếp"
            url: "qrc:/assets/devices/light.svg"
            status: false
            value: "100"
            area_id: "area_02"
        }
        ListElement {
            icon: "\uf0eb"
            name: "Cảm biến nhiệt "
            area: "Mái hiên"
            url: "qrc:/assets/devices/temp.svg"
            status: true
            value: "45"
            area_id: "area_01"
        }
        ListElement {
            icon: "\uf0eb"
            name: "Đèn ngoài cổng"
            area: "Ngoài cổng"
            url: "qrc:/assets/devices/light.svg"
            status: false
            value: "40"
            area_id: "area_02"
        }
        ListElement {
            icon: "\uf0eb"
            name: "Đèn cầu thang"
            area: "Cầu thang"
            url: "qrc:/assets/devices/light.svg"
            status: true
            value: "0"
            area_id: "area_04"
        }
    }

    SwipeView {
        id: stack
        currentIndex: current_page
        anchors.fill: parent
        //interactive: false
        VDashboard {
            id: pageDashboard
        }
        VAreas {
            id: pageAreas
        }
        VDeviceDetail {
            id: pageDevice
        }
    }
}
