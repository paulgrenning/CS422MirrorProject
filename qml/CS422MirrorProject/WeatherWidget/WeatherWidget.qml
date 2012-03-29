// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: weather
    width: 324
    height: 260
    state: "simple"

    function timeChanged() {
        weathercurrent.reload();
    }

    Timer {
        interval: 10000; running: true; repeat: true;
        onTriggered: weather.timeChanged()
    }

    BorderImage {
        id: border_image1
        x: 0
        y: 1
        width: 323
        height: 143
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        border { left: 20; top: 20; right: 20; bottom: 20}
        Behavior on height {
            NumberAnimation { duration: 500 }
        }

        MouseArea {
            id: mouse_area1
            anchors.fill: parent
            onClicked: {
                if(weather.state === "simple") weather.state = "expanded"
                else weather.state = "simple"
            }
        }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "images/borderImage.png"
    }



    ListView{
        id: list
        x: 57
        y: 5
        width: 285
        height: 134
        anchors.horizontalCenterOffset: 0
        highlightRangeMode: ListView.StrictlyEnforceRange
        preferredHighlightEnd: 20
        preferredHighlightBegin: 70
        anchors.horizontalCenter: parent.horizontalCenter
        interactive: false
        model: weathercurrent
        delegate: WeatherWidgetItem{}
    }

    GridView{
        id: grid
        x: 0
        y: 144
        width: weather.width
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        flow: GridView.TopToBottom
        interactive: false
        cellWidth: 60
        model: weathertoday
        delegate: WeatherDayForecast{}
    }


    XmlListModel {
        id: weatherinfo
        source: (appVar.currentLanguage == "Español") ? "http://www.google.com/ig/api?weather=Chicago,US&hl=es" : "http://www.google.com/ig/api?weather=chicago"
        query: "/xml_api_reply/weather/forecast_information"
        XmlRole { name: "city"; query: "city/@data/string()" }
        XmlRole { name: "current_date"; query: "forecast_date/@data/string()" }
        XmlRole { name: "current_time"; query: "current_date_time/@data/string()"}
    }

    XmlListModel {
        id: weathercurrent
        source: (appVar.currentLanguage == "Español") ? "http://www.google.com/ig/api?weather=Chicago,US&hl=es" : "http://www.google.com/ig/api?weather=chicago"
        query: "/xml_api_reply/weather/current_conditions"
        //current condition
        XmlRole { name: "condition"; query: "condition/@data/string()" }
        XmlRole { name: "temp_c"; query: "temp_c/@data/string()" }
        XmlRole { name: "temp_f"; query: "temp_f/@data/string()" }
        XmlRole { name: "humidity"; query: "humidity/@data/string()" }
        XmlRole { name: "icon"; query: "icon/@data/string()" }
        XmlRole { name: "wind_condition"; query: "wind_condition/@data/string()"}
    }


    XmlListModel {
        id:weathertoday
        source: "dayforecast.xml"
        query: "/dayforecast/forecast_conditions"
        XmlRole { name: "time_of_day"; query: "time_of_day/string()" }
        XmlRole { name: "low_f"; query: "low/string()" }
        XmlRole { name: "high_f"; query: "high/string()" }
        XmlRole { name: "condition"; query: "condition/string()" }
    }
    states: [
        State {
            name: "simple"

            PropertyChanges {
                target: border_image1
                x: 0
                anchors.horizontalCenterOffset: 0
            }

            PropertyChanges {
                target: grid
                opacity: 0
            }
        },
        State {
            name: "expanded"

            PropertyChanges {
                target: border_image1
                x: 1
                y: 1
                height: 260
                anchors.horizontalCenterOffset: 0
            }

            PropertyChanges {
                target: weather
                height: 261
            }
        }
    ]

    transitions: [
        Transition{
            from: "simple"; to: "expanded"
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutExpo; duration: 1200}
        },
        Transition{
            from: "expanded"; to: "simple"
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutExpo; duration: 800}
        }
    ]

}
