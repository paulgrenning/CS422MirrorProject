import QtQuick 1.1
import "../UtilityElements"

Row {
    id: todaysForecast
    width: image1.width + forecastText.width + spacing
    height: image1.height + image1.anchors.topMargin
    clip: true
    spacing: 15

    Image {
        id: image1
        width: 130
        height: 121
        anchors {
            top: parent.top
            topMargin: 15
        }

        z: -2
        smooth: true
        source:  {
            switch(condition){
            case "Overcast" :
                return "images/cloudy.png";
            case "Cloudy" :
                return "images/cloudy.png";
            case "Drizzle":
                return "images/drizzle.png";
            case "Haze":
                return "images/haze.png";
            case "Chance of Showers":
                return "images/slightdrizzle.png";
            case "Chance of Rain":
                return "images/slightdrizzle.png";
            case "Mostly Sunny":
                return "images/partlycloudy.png";
            case "Mostly Cloudy":
                return "images/partlycloudy.png";
            case "Partly Cloudy":
                return "images/partlycloudy.png";
            case "Thunderstorm":
                return "images/thunderstorm.png";

//spanish
            case "Soleado":
                return "images/sunny.png";
            case "Nublado" :
                return "images/cloudy.png";
            case "Neblina" :
                return "images/haze.png";
            case "Posibilidad de tormenta":
                return "images/drizzle.png";
            case "Lluvias de poca intensidad":
                return "images/slightdrizzle.png";
            case "Posibilidad de Tormenta":
                return "images/slightdrizzle.png";
            case "Mayormente soleado":
                return "images/partlycloudy.png";
            case "Mayormente nublado":
                return "images/partlycloudy.png";
            case "Parcialmente nublado":
                return "images/partlycloudy.png";
            case "Tormenta eléctrica":
                return "images/thunderstorm.png";
            case "Despejado":
                return "images/sunny.png";
            default: return "images/sunny.png";
            }
        }

    }

    Column {
            id: forecastText
            width: (tempTxt.width > details.width) ? tempTxt.width : details.width
            height: tempTxt.height + details.height + spacing
            clip: false
            z: -1
            spacing: 15

            anchors {
                top: parent.top
                topMargin: 15
            }

            StdText{
                id: tempTxt
                state: "white"
                text: (appVar.currentDegreeSystem == "Celsius") ? temp_c + "°C" : temp_f + "°F"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 50
            }

            Column {
                id: details
                height: condTxt.height + humidityTxt.height + windTxt.height + spacing * 2
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 2

                StdText{
                    id: condTxt
                    text: condition
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                StdText{
                    id: humidityTxt
                    text: humidity
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                StdText{
                    id: windTxt
                    text: wind_condition
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
}


