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
        x: 70
        y: 114
        width: 394
        height: 182
        color: "#00000000"
        clip: true
        ListView{
            id: grid
            width: 382
            height: 182
            interactive: false
            boundsBehavior: Flickable.StopAtBounds
            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            x: -7
            y: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            flickableDirection: Flickable.HorizontalFlick
            model: bargraphmodel
            delegate: BarGraphDelegate{
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
        x: 31
        y: 114
        width: 29
        height: 124
        color: "#bfe4d5"
        text: "200kg 9km 8km 7km 6km 5km 4km 3km 2km 1km"
        horizontalAlignment: Text.AlignRight
        wrapMode: Text.WordWrap
        font.pixelSize: 10
        font.bold: true
        font.family: "Futura"
    }

}
