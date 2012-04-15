import QtQuick 1.0
import "../UtilityElements"

Column {
    id: clock
    width: (clockText.width > greeting.paintedWidth) ? clockText.width : greeting.paintedWidth
    height: clockText.height + greeting.paintedHeight + spacing
    spacing: -15

    property int hours: 0
    property int minutes: 0
    property int seconds: 0
    property bool military: false
    property string meridiem
    property bool blinkerOn: true
    property bool blinkColon: !blinkerOn

    function timeChanged() {
        var date = new Date;
        seconds = date.getSeconds();
        minutes = date.getMinutes();
        hours = date.getHours();

        if(!military) {
            meridiem = "AM"
            if(hours == 0) hours = 12
            else if(hours > 12) {
                meridiem = "PM"
                hours = hours - 12;
            }
        }
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Timer{
        interval: 500; running: blinkerOn; repeat: true;
        onTriggered: blinkColon = !blinkColon
    }

    Item {
        id: clockText
        width: hourText.width + colon.width + minuteText.width + meridiemText.width
        height: hourText.paintedHeight
        anchors { left: parent.left; top: parent.top }

        StdText {
            id: hourText
            font.pointSize: 70
            anchors { left: parent.left; top: parent.top }
            text: (clock.hours < 10) ? ("0" + clock.hours) : (clock.hours)
        }

        StdText {
            id: colon
            visible: blinkColon
            font.pointSize: 70
            anchors { top: parent.top; topMargin: -7; left: hourText.right }
            text: ":"
        }

        StdText {
            id: minuteText
            font.pointSize: 70
            font.family: "Futura"
            anchors { top: parent.top; left: colon.right }
            text: (clock.minutes < 10) ? ("0" + clock.minutes) : (clock.minutes)

        }

        StdText {
            id: meridiemText
            font.pixelSize: 20
            anchors { top: parent.top; topMargin: 15; left: minuteText.right }
            text: clock.meridiem
        }
    }

    StdText {
        id: greeting
        font.pixelSize: 24
        visible: appVar.currentUser
        anchors { horizontalCenter: parent.horizontalCenter }
        text: "Good " + ((hours > 17 && hours < 5) ? "evening, " : (hours < 12) ? "morning, " : "afternoon, ") + appVar.currentUser
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
