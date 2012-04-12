 // import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    width: 290; height: 124
    clip: true

    Rectangle {
        id: rectangle2
        x: 0
        y: 0
        width: 290
        height: 124
        color: "#00000000"
    }

    Image {
        id: image1
        x: 19
        y: 10
        width: 110
        height: 114
        z: -2
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

Rectangle {
            id: rectangle1
            x: 146
            y: 0
            width: 132
            height: 125
            color: "#00000000"
            clip: false
            z: -1

            Text{
                id: tempTxt
                x: -67
                y: 0
                width: 132
                height: 68
                color: "#7dd9b3"
                text: (appVar.currentDegreeSystem == "Celsius") ? temp_c + "°C" : temp_f + "°F"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Futura"
                wrapMode: Text.WordWrap
                font.pointSize: 50
            }

            Text{
                id: condTxt
                x: -68
                y: 63
                width: 133
                height: 16
                color: "#7dd9b3"
                text: condition
                anchors.horizontalCenterOffset: 0
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Futura"
            }

            Text{
                id: humidityTxt
                x: -67
                y: 87
                width: 132
                height: 17
                color: "#7dd9b3"
                text: humidity
                anchors.horizontalCenterOffset: 0
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Futura"
            }

            Text{
                id: windTxt
                x: -68
                y: 110
                width: 133
                height: 16
                color: "#7dd9b3"
                text: wind_condition
                anchors.horizontalCenterOffset: 0
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }
}


