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

            Item {
                id: eventsWrapper
                height: parent.height
                width: parent.width

                Text { text: id }
//                XmlListModel {
//                    id: eventsModel
//                    xml: events
//                    query: "/events"

//                    XmlRole { name: "start_time"; query: "start_time/string()" }
//                }

//                ListView {
//                    id: eventsView
//                    height: parent.height
//                    width: parent.width
//                    anchors.centerIn: parent

//                    model: eventsModel
//                    delegate: eventsDelegate

//                    Component {
//                        id: eventsDelegate

//                        Text { text: start_time }
//                    }
//                }
            }
        }
    }
}
