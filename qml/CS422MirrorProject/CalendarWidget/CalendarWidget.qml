import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: calendarContainer
    width: 305
    height: 334
    bgImgPath: "../CalendarWidget/images/calendarBG.png"

    property int day: 0
    property string dayTitle: "today"

    onDayChanged: {
        switch(day) {
            case 0: return "today"
            case 1: return "tomorrow"
            default: return "not defined yet"
        }
    }

    StdText {
        id: title
        font.pixelSize: 30
        anchors {
            top: parent.top
            topMargin: -10
            horizontalCenter: parent.horizontalCenter
        }
        text: dayTitle
    }

    XmlListModel {
        id: calendarModel
        source: "data/calendar.xml"
        query: "/calendar/day[@id=\"" + day + "\"]/events/event"

        XmlRole { name: "startTime"; query: "start_time/string()" }
        XmlRole { name: "endTime"; query: "end_time/string()" }
        XmlRole { name: "description"; query: "description/string()" }
        XmlRole { name: "location"; query: "location/string()" }
    }

    ListView {
        id: calendarView
        height: parent.height - anchors.topMargin
        width: parent.width - anchors.leftMargin
        anchors {
            top: parent.top
            topMargin: 30
            left: parent.left
            leftMargin: 50
        }

        model: calendarModel
        delegate: calendarDelegate

        Component {
            id: calendarDelegate

            Item {
                id: eventDescription
                height: textContainer.height
                width: parent.width

                Column {
                    id: textContainer
                    width: timeRow
                    height: startText.height + descText.height + locText.height + spacing * 2
                    spacing: 1

                    StdText {
                        id: startText
                        font.pixelSize: 20
                        text: startTime
                    }

                    StdText {
                        id: descText
                        font.pixelSize: 16
                        text: "   • " + description
                    }

                    StdText {
                        id: locText
                        font.pixelSize: 14
                        text: "          " + location
                    }
                }
            }
        }
    }
}
