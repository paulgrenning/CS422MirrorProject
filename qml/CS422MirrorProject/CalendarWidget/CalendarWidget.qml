import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: calendarContainer
    width: 305
    height: 334
    bgImgPath: "../CalendarWidget/images/calendarBG.png"


    XmlListModel {
        id: calendarModel
        source: "data/calendar.xml"
        query: "/calendar/day"

        XmlRole { name: "id"; query: "id/string()" }
        XmlRole { name: "events"; query: "events/string()" }

        onStatusChanged: console.log(calendarModel.get(1).events)
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

            Text {
                anchors.centerIn: parent
                text: events
            }
        }
    }
}
