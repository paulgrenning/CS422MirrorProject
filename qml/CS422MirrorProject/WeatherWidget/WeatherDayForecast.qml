import QtQuick 1.1
import "../UtilityElements"

Item {
   width: 75; height: 100
   clip: true
   Rectangle{
       anchors.fill: parent
       width: 75; height: 100
       color: "#00000000"
       clip: true

       Rectangle {
           id: rectangle1
           color: "#00000000"
           anchors.fill: parent
           clip: true
           z: -1

           StdText{
               id: lowTxt
               x: -29
               y: 84
               width: 133
               height: 16
               state: "blue"
               text: (appVar.currentDegreeSystem == "Celsius") ? parseInt((low_f*1 - 32)*5/9.0) + "°C" : low_f + "°F"
               anchors.horizontalCenterOffset: 0
               horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
           }

           StdText{
               id: highxt
               x: -28
               y: 65
               width: 132
               height: 17
               state: "orange"
               text: (appVar.currentDegreeSystem == "Celsius") ? parseInt((high_f*1 - 32)*5/9.0) + "°C" : high_f + "°F"
               font.pointSize: 16
               anchors.horizontalCenterOffset: 0
               horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
           }

           StdText{
               id: timeTxt
               x: 0
               y: 0
               width: 132
               height: 68
               state: "white"
               text: time_of_day
               font.pointSize: 16
               horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
               wrapMode: Text.WordWrap
           }

           Image {
               id: image1
               x: 13
               y: 25
               width: 40
               height: 40
               anchors.horizontalCenter: parent.horizontalCenter
               source:  {
                   switch(condition){
                   case "Cloudy":
                       return "images/cloudy.png";
                   case "Overcast":
                       return "images/cloudy.png";
                   case "Drizzle":
                       return "images/drizzle.png";
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
                   case "Clear":
                       return "images/sunny.png";
                   default: return "images/sunny.png";
                   }
               }

           }
       }
   }
}


