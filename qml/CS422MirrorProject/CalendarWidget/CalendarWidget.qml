import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: calendarContainer
    width: 305
    height: 334
    bgImgPath: "../CalendarWidget/images/calendarBG.png"

    property int day: 0

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
        height: parent.height - 20
        width: parent.width - 20
        anchors.centerIn: parent

        model: calendarModel
        delegate: calendarDelegate

        Component {
            id: calendarDelegate

            Item {
                id: eventDescription
                height: timeRow.height
                width: parent.width

                Row {
                    id: timeRow
                    width: parent.width
                    height: startVal.height
                    spacing: 5

                    Text { id: startLabel; text: "" }
                    Text { id: startVal; text: startTime }
                    Text { id: endVal; text: endTime }
                }
            }
        }
    }
}
