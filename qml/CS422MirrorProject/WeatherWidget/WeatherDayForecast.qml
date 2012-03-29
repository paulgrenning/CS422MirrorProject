// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
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

           Text{
               id: lowTxt
               x: -29
               y: 84
               width: 133
               height: 16
               color: "#e5eeeb"
               text: low_f+"°"
               anchors.horizontalCenterOffset: 0
               horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
               font.family: "Futura"
           }

           Text{
               id: highxt
               x: -28
               y: 65
               width: 132
               height: 17
               color: "#bfe4d5"
               text: high_f+"°"
               font.pointSize: 16
               anchors.horizontalCenterOffset: 0
               horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
               font.family: "Futura"
           }

           Text{
               id: timeTxt
               x: 0
               y: 0
               width: 132
               height: 68
               color: "#bfe4d5"
               text: time_of_day
               font.pointSize: 16
               horizontalAlignment: Text.AlignHCenter
               anchors.horizontalCenter: parent.horizontalCenter
               font.family: "Futura"
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


