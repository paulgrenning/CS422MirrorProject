import QtQuick 1.0

Item {
    id: clock
    width: 200; height: 50

    property int hours
    property int minutes
    property int seconds

    function timeChanged() {
        var date = new Date;
        seconds = date.getSeconds();
        minutes = date.getMinutes();
        hours = date.getHours();
    }
    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: clock.timeChanged()
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
            id: hourTxt
            x: 0; y: -20
            color: "#7dd9b3"
            text: (clock.hours<10) ? "0" + clock.hours + ":" :clock.hours + ":"
            z: 1
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 70
            font.family: "Futura"
        }

        Text {
            id: minTxt
            x: 112; y: -20
            color: "#7dd9b3"
            text: (clock.minutes<10) ? "0"+clock.minutes:clock.minutes
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 70
            font.family: "Futura"
        }

//        Text {
//            id: secTxt
//            x: 138; y: 11
//            color: "#7dd9b3"
//            text: (clock.seconds<10) ? "0"+clock.seconds:clock.seconds
//            anchors.verticalCenter: parent.verticalCenter
//            font.pointSize: 40
//            font.family: "Futura"
//        }


    }
}
