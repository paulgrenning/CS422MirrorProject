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
        x: 316
        y: 24
        text: (kg).toFixed(1)
        anchors.right: parent.right
        anchors.rightMargin: 134
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 45
        color: "#eefff9"

        Timer{ interval: {if(kg<60) return 1;
                         else return 5;}
               running:true;
               repeat: true;
               onTriggered:{if(kg<=63.0 && kg < 65.4) return (kg = kg + 2.0);
                       else if (kg>63.0 && kg < 65.4) return (kg = kg + 0.1);
                 }
        }
    }


    Text {
        id: text2
        x: 334
        y: 83
        width: 35
        height: 26
        color: "#bfe4d5"
        text: (kg*2.2).toFixed(1)
        anchors.right: parent.right
        anchors.rightMargin: 151
        font.pixelSize: 20
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text3
        x: 48
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
        y: 114
        width: 403
        height: 182
        color: "#00000000"
        clip: true
        ListView{
            id: grid
            width: 403
            height: 182
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
                console.log(bargraphmodel.get(count-1).run_time)
            }
            delegate: WeightGraphDelegate{
                id:bargraphdelegate
                barImageHeight: parseFloat(run_distance)*10
                barImageY:{
                    if(appVar.currentDistanceUnit == "Km") return 140 - parseFloat(run_distance)*10
                    else return 140 - parseFloat(run_distance)*10
                }
                runDate: run_date
                onBarclicked: {
                    grid.currentIndex = grid.indexAt(x,y)
                }
            }

        }
    }

    XmlListModel {
        id: bargraphmodel
        source: "runplus.xml"
        query: "/plusService/runList/run"
        XmlRole { name: "run_distance"; query: "distance/string()" }
        XmlRole { name: "run_time"; query: "duration/string()" }
        XmlRole { name: "run_calories"; query: "calories/string()" }
        XmlRole { name: "run_date"; query: "startTime/string()" }
    }
    Text {
        id: text4
        x: 394
        y: 24
        width: 57
        height: 53
        color: "#eefff9"
        text: "kg"
        z: 1
        font.pixelSize: 45
    }

    Text {
        id: text5
        x: 397
        y: 83
        width: 35
        height: 26
        color: "#bfe4d5"
        text: "lbs"
        font.pixelSize: 20
        anchors.rightMargin: 88
        font.bold: true
        font.family: "Futura"
        anchors.right: parent.right
    }

    Text {
        id: text
        x: 20
        y: 101
        width: 40
        height: 124
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
