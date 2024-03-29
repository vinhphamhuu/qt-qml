import QtQuick 2.0
Rectangle {
    anchors.centerIn: parent
    width: parent.width - parent.border.width
    height: parent.height - parent.border.width
    radius:parent.radius - parent.border.width/2
    smooth: true

    //border.width: parent.border.width/2
   // border.color: "#22FFFFFF"

    gradient: Gradient {
        GradientStop { position: 0;    color: "#88FFFFFF" }
        GradientStop { position: .1;   color: "#55FFFFFF" }
        GradientStop { position: .5;   color: "#33FFFFFF" }
        GradientStop { position: .7; color: "#11FFFFFF" }
        GradientStop { position: .9;   color: "#22FFFFFF" }
        GradientStop { position: 1;    color: "#55FFFFFF" }
    }
}
