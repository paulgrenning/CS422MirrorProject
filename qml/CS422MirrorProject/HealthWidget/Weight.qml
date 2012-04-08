// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../AppVariables"

Item {
    id:background
    property real kg:0.0

    width: 520
    height: 310

    AppVariables{
        id:appVar
    }

    Text {
        id: text1
        x: 313
        y: 30
        text: (kg).toFixed(1)
        horizontalAlignment: Text.AlignRight
        anchors.right: parent.right
        anchors.rightMargin: 153
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 35
        color: "#eefff9"

        Timer{ interval: {if(kg<bargraphmodel.get(bargraphmodel.count-1).weight_kg - 5) return 1;
                         else return 5;}
               running:true;
               repeat: true;
               onTriggered:{if(kg<=bargraphmodel.get(bargraphmodel.count-1).weight_kg - 5) return (kg = kg + 2.0);
                       else if (kg < bargraphmodel.get(bargraphmodel.count-1).weight_kg) return (kg = kg + 0.1);
                 }
        }
    }


    Text {
        id: text2
        x: 337
        y: 76
        width: 30
        height: 26
        color: "#bfe4d5"
        text: (kg*2.2).toFixed(1)
        horizontalAlignment: Text.AlignRight
        anchors.right: parent.right
        anchors.rightMargin: 153
        font.pixelSize: 15
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text3
        x: 58
        y: 55
        width: 218
        height: 33
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "su peso actual:" : "your current weight:"
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 25
        font.bold: true
        font.family: "Futura"
    }


    Rectangle {
        id: clipGraph
        x: 69
        y: 120
        width: 403
        height: 175
        color: "#00000000"
        clip: true
        ListView{
            id: grid
            width: 403
            height: 175
            keyNavigationWraps: true
            preferredHighlightEnd: 0
            preferredHighlightBegin: 0
            highlightRangeMode: ListView.NoHighlightRange
            highlightMoveSpeed: 50000
            orientation: ListView.Horizontal
            x: 0
            y: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            flickableDirection: Flickable.HorizontalFlick
            model: bargraphmodel
            highlight: Rectangle { color: "transparent"; radius:14 }
            highlightFollowsCurrentItem: true
            onCurrentIndexChanged:{
                if(currentIndex == 0){
                    decrementCurrentIndex()
                }
            }
            delegate: WeightGraphDelegate{
                id:bargraphdelegate
                barImageHeight: 1.8*parseFloat(weight_kg)
                barImageY:{
                    if(appVar.currentDistanceUnit == "Kg") return 140 - 1.8*parseFloat(weight_kg)
                    else return 140 - 1.8*parseFloat(weight_kg)
                }
                weightDate: weight_date
                onWeightbarclicked: {
                    grid.currentIndex = grid.indexAt(x,y)
                }
            }

        }
    }

    XmlListModel {
        id: bargraphmodel
        source: "weightinfo.xml"
        query: "/plusService/weightList/weight"
        XmlRole { name: "weight_kg"; query: "kg/string()" }
        XmlRole { name: "weight_date"; query: "day/string()" }
    }
    Text {
        id: text4
        x: 375
        y: 30
        width: 57
        height: 53
        color: "#eefff9"
        text: "kg"
        z: 1
        font.pixelSize: 35
    }

    Text {
        id: text5
        x: 375
        y: 76
        width: 35
        height: 26
        color: "#bfe4d5"
        text: "lbs"
        font.pixelSize: 15
        anchors.rightMargin: 110
        font.bold: true
        font.family: "Futura"
        anchors.right: parent.right
    }

    Text {
        id: text
        x: 21
        y: 120
        width: 40
        height: 131
        color: "#bfe4d5"
        text: { if(appVar.currentWeightUnit == "Kg") return "100 kg 90 kg 80 kg 70 kg 60 kg 50 kg 40 kg 30 kg 20 kg 10 kg"
              else return "220 lbs 200 lbs 180 lbs 160 lbs 140 lbs 120 lbs 100 lbs 80 lbs 60 lbs 40 lbs 20 lbs"
        }
        horizontalAlignment: Text.AlignRight
        wrapMode: Text.WordWrap
        font.pixelSize: 10
        font.bold: true
        font.family: "Futura"
    }

}
