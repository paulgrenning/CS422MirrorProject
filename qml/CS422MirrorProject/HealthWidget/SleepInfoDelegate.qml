// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: item1

    width: 270
    height: 250


    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 181
        height: 250
        color: "#00000000"

        BorderImage {
            id:barimage3
            Component.onCompleted: {animation3.start();}
            transformOrigin: Item.Right
            x: 0
            y: 200
            height: 50
            border { left: 35; top: 15; right: 35; bottom: 15}
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "images/sleepBorderImage.png"
            PropertyAnimation {id: animation3; target: barimage3; property: "width"; from: 0; to: (light_minutes/deep_minutes)*180; duration: 1000}

            Text {
                id: text3
                y: 12
                color: "#bfe4d5"
                text: (light_minutes/60).toFixed(2)+" hrs"
                anchors.left: parent.left
                anchors.leftMargin: 191
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.family: "Futura"
                font.bold: true
                horizontalAlignment: Text.AlignLeft
            }
        }

        BorderImage {
            id:barimage1
            Component.onCompleted: {animation.start();}
            transformOrigin: Item.Right
            x: 0
            y: 98
            height: 50
            border { left: 35; top: 15; right: 35; bottom: 15}
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "images/sleepBorderImage.png"
            PropertyAnimation {id: animation; target: barimage1; property: "width"; from: 0; to: (rem_minutes/deep_minutes)*180; duration: 1000}

            Text {
                id: text1
                y: 12
                color: "#bfe4d5"
                text: (rem_minutes/60).toFixed(2)+" hrs"
                anchors.left: parent.left
                anchors.leftMargin: 191
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.family: "Futura"
                font.bold: true
                horizontalAlignment: Text.AlignLeft
            }
        }

        BorderImage {
            id:barimage2
            Component.onCompleted: {animation2.start();}
            transformOrigin: Item.Left
            x: 0
            y: 149
            height: 50
            border { left: 35; top: 15; right: 35; bottom: 15}
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "images/sleepBorderImage.png"
            PropertyAnimation {id: animation2; target: barimage2; property: "width"; from: 0; to: (deep_minutes/deep_minutes)*180; duration: 1000}

            Text {
                id: text2
                y: 10
                color: "#bfe4d5"
                text: (deep_minutes/60).toFixed(2)+" hrs"
                anchors.left: parent.left
                anchors.leftMargin: 191
                anchors.verticalCenter: parent.verticalCenter
                font.family: "Futura"
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 20
            }
    }


    }


    Text {
        id: text4
        x: 104
        y: 5
        width: 101
        height: 60
        color: "#ffffff"
        text: ((parseInt(light_minutes)+parseInt(deep_minutes)+parseInt(rem_minutes))/60).toFixed(1)
        verticalAlignment: Text.AlignBottom
        font.pixelSize: 60
        font.bold: true
        font.family: "Futura"
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: text5
        x: 205
        y: 15
        width: 103
        height: 43
        color: "#ffffff"
        text: " hrs"
        anchors.left: text4.right
        anchors.leftMargin: 0
        font.pixelSize: 33
        font.family: "Futura"
        font.bold: true
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
}
