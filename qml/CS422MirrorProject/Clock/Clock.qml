import QtQuick 1.0

Item {
    id: clock
    width: 250; height: 100

    property int hours: 0
    property int minutes: 0
    property int seconds: 0
    property bool military: false
    property string meridiem: "XX"
    property bool blinkerOn: true
    property bool blinkColon: !blinkerOn

    function timeChanged() {
        var date = new Date;
        seconds = date.getSeconds();
        minutes = date.getMinutes();
        hours = date.getHours();

        if(hours > 12)
            meridiem = "PM"
        else
            meridiem = "AM"

        if(military == false && hours > 12)
            hours = hours - 12;

    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Timer{
        interval: 500; running: blinkerOn; repeat: true;
        onTriggered: {
            blinkColon = !blinkColon
        }
    }

    Rectangle {
        id: rectangle1
        x: 1
        y: 71
        width: 199
        height: 50
        color: "#00000000"
        z: 1
        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: timeTxt
            x: 0; y: -20
            color: "#7dd9b3"
            text: (clock.hours < 10) ? ("0" + clock.hours) : (clock.hours)
            z: 1
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 70
            font.family: "Futura"
        }

        Text {
            id: colon
            x: 90; y: -32
            visible: blinkColon
            color: "#7dd9b3"
            text: ":"
            z: 1
            anchors.verticalCenterOffset: -11
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 70
            font.family: "Futura"
        }

        Text {
            id: minTxt
            x: 112; y: -20
            color: "#7dd9b3"
            text: (clock.minutes < 10) ? ("0" + clock.minutes) : (clock.minutes)
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 70
            font.family: "Futura"

            Text {
                id: text1
                x: 89
                y: 14
                text: clock.meridiem
                font.pixelSize: 20
                font.family: "Futura"
                color:"#7dd9b3"
            }
        }

       /*Text {
            id: secTxt
            x: 199; y: 19
            color: "#7dd9b3"
           text: (clock.seconds<10) ? "0"+clock.seconds:clock.seconds
           anchors.verticalCenterOffset: 20
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 40
            font.family: "Futura"
        }*/


    }
}
