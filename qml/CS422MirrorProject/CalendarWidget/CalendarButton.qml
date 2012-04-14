import QtQuick 1.1
import "../UtilityElements"

Button {
    id: calendarButton
    width: 36
    height: 61
    z: 2

    anchors {
        top: parent.top
        topMargin: parent.height / 2 - height / 2 + 1
    }

    defaultPath: "../CalendarWidget/images/calendar" + direction + "UP.png"
    clickedPath: "../CalendarWidget/images/calendar" + direction + "DN.png"

    property string direction

}
