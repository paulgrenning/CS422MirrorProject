import QtQuick 1.1
import "../UtilityElements"

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

            StdText {
                id: text3
                y: 12
                state: "white"
                text: (parseInt(light_minutes)/60.0).toFixed(1)+" hrs"
                anchors.left: parent.left
                anchors.leftMargin: 191
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
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

            StdText {
                id: text1
                y: 12
                state: "white"
                text: (parseInt(rem_minutes/60)).toFixed(1)+" hrs"
                anchors.left: parent.left
                anchors.leftMargin: 191
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
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

            StdText {
                id: text2
                y: 10
                state: "white"
                text: (parseInt(deep_minutes)/60).toFixed(1)+" hrs"
                anchors.left: parent.left
                anchors.leftMargin: 191
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 20
            }
    }


    }


    StdText {
        id: text4
        x: 104
        y: 5
        width: 101
        height: 60
        state: "white"
        text: ((parseInt(light_minutes)+parseInt(deep_minutes)+parseInt(rem_minutes))/60).toFixed(1)
        verticalAlignment: Text.AlignBottom
        font.pixelSize: 60
        font.bold: true
        horizontalAlignment: Text.AlignLeft
    }

    StdText {
        id: text5
        x: 205
        y: 15
        width: 103
        height: 43
        state: "white"
        text: " hrs"
        anchors.left: text4.right
        anchors.leftMargin: 0
        font.pixelSize: 33
        font.bold: true
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
}
