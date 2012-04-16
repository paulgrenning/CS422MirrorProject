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
    property string textColor: "blue"

    function timeChanged() {
        var date = new Date;
        seconds = date.getSeconds();
        minutes = date.getMinutes();
        hours = date.getHours();

        greeting.text = (appVar.currentLanguage == "Español") ? "Buenos ": "Good "
        if(hours > 17 && hours < 5) {
            greeting.text += (appVar.currentLanguage == "Español") ? "noches, ":"evening, ";
        } else if(hours < 12) {
            greeting.text += (appVar.currentLanguage == "Español") ? "dias, ":"morning, ";
        } else {
            greeting.text += (appVar.currentLanguage == "Español") ? "tardes, " : "afternoon, ";
        }
        greeting.text += appVar.currentUser

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
        width: hourText.width + colon.width + minuteText.width
        height: hourText.paintedHeight
        anchors { horizontalCenter: parent.horizontalCenter; top: parent.top }

        StdText {
            id: hourText
            font.pointSize: 70
            anchors { left: parent.left; top: parent.top }
            state: textColor
            text: (clock.hours < 10) ? ("0" + clock.hours) : (clock.hours)
        }

        StdText {
            id: colon
            visible: blinkColon
            font.pointSize: 70
            state: textColor
            anchors { top: parent.top; topMargin: -7; left: hourText.right }
            text: ":"
        }

        StdText {
            id: minuteText
            font.pointSize: 70
            font.family: "Futura"
            state: textColor
            anchors { top: parent.top; left: colon.right }
            text: (clock.minutes < 10) ? ("0" + clock.minutes) : (clock.minutes)

        }

        StdText {
            id: meridiemText
            font.pixelSize: 20
            state: textColor
            anchors { top: parent.top; topMargin: 15; left: minuteText.right }
            text: clock.meridiem
        }
    }

    StdText {
        id: greeting
        font.pixelSize: 24
        visible: appVar.currentUser
        state: textColor
        anchors { horizontalCenter: parent.horizontalCenter }
    }

}
