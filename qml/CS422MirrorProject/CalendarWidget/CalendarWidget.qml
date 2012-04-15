import QtQuick 1.1
import "../UtilityElements"
import "../DateWidget"

Widget {
    id: calendarContainer
    width: 290
    height: 331
    bgImgPath: "../CalendarWidget/images/calendarBG.png"

    property int day: 0
    property string dayTitle: getDayTitle()
    property string currentLanguage: appVar.currentLanguage

    onDayChanged: {
        if(day < 0) day = 0
        dayTitle = getDayTitle()
    }

    onCurrentLanguageChanged: {
        dayTitle = getDayTitle()
    }

    function getDayTitle() {
        switch(day) {
            case 0:
                var today = { English: "today", Español: "hoy" }
                return today[currentLanguage]
            case 1:
                var tomorrow = { English: "tomorrow", Español: "mañana" }
                return tomorrow[currentLanguage]
            case 6: case 5: case 4: case 3: case 2:
                var jsDay = ((new Date()).getDay() + day) % 7;
                return dateWidget.getDayName(jsDay, currentLanguage).toLowerCase()
            default:
                var jsDay = new Date()
                jsDay.setDate(jsDay.getDate() + day)
                var month = jsDay.getMonth() + 1; var date = jsDay.getDate()
                var dateFormat = { English: month + "/" + date, Español: date + "/" + month }
                return dateFormat[currentLanguage]
        }
    }

    StdText {
        id: title
        font.pixelSize: 30
        anchors {
            top: parent.top
            topMargin: -13
            horizontalCenter: parent.horizontalCenter
        }
        state: "blue"
        text: dayTitle
    }

    CalendarButton {
        id: calendarLeft
        direction: "Left"
        anchors.left: parent.left
        anchors.leftMargin: -4

        onButtonClicked: parent.day--;
    }

    CalendarButton {
        id: calendarRight
        direction: "Right"
        anchors.right: parent.right
        anchors.rightMargin: -4

        onButtonClicked: parent.day++;
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
        height: parent.height - anchors.topMargin * 2
        width: parent.width - anchors.leftMargin * 2
        anchors {
            top: parent.top
            topMargin: 30
            left: parent.left
            leftMargin: 50
        }

        model: calendarModel
        delegate: calendarDelegate

        spacing: 10
        clip: true

        Component {
            id: calendarDelegate

            Item {
                id: eventDescription
                height: textContainer.height
                width: parent.width

                Column {
                    id: textContainer
                    width: parent.width
                    height: startText.height + descText.height + locText.height + spacing * 2
                    spacing: 1

                    StdText {
                        id: startText
                        font.pixelSize: 20
                        text: startTime
                    }

                    StdText {
                        id: descText
                        width: parent.width
                        font.pixelSize: 16
                        elide: Text.ElideRight
                        text: "   • " + description
                    }

                    StdText {
                        id: locText
                        width: parent.width
                        font.pixelSize: 14
                        elide: Text.ElideRight
                        text: "          " + location
                    }
                }
            }
        }
    }

    StdText {
        id: emptyMessage
        width: calendarView.width
        font.pixelSize: 20
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        visible: calendarView.count == 0
        anchors {
            top: parent.top
            topMargin: 30
            left: parent.left
            leftMargin: 50
        }
        text: "you have nothing scheduled for today"
    }
}
