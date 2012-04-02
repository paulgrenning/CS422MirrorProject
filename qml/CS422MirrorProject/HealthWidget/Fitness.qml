// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt 4.7
import "../AppVariables"

Item {
    id: item1
    width: 520
    height: 310

    function getMonth(){
        var date = new Date();
        var months = ['January','February','March','April','May','June','July','August','September','October','November','December']
        return months[date.getMonth()]
    }


    AppVariables{
        id:appVar
    }

    Text {
        id: text1
        x: 23
        y: 25
        text: (appVar.currentLanguage == "Español") ? "carrera de hoy" : "today's run"
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 30
        color: "#bfe4d5"
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

    Rectangle {
        id: clipGraph
        x: 71
        y: 110
        width: 379
        height: 170
        color: "#00000000"
        z: 1
        clip: true
        GridView{
            id: grid
            width: 50*bargraphmodel.count
            x: -50*bargraphmodel.count+contentWidth+10
            y: 0
            contentWidth: 379
            contentHeight: 170
            clip:true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            cellHeight: 170
            flickableDirection: Flickable.HorizontalFlick
            interactive: true
            cellWidth: 50
            model: bargraphmodel
            highlight: Rectangle { color: "lightsteelblue"; radius:14 }
            highlightFollowsCurrentItem: true
            delegate: BarGraphDelegate{
            }
        }
    }


    Image {
        id: image1
        x: 300
        y: 19
        width: 220
        height: 50
        source: "images/runningPressed.png"
    }

    Text {
        id: text2
        x: 42
        y: 77
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "tiempo" : "time"
        font.pixelSize: 15
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text3
        x: 211
        y: 77
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "distancia" : "distance"
        font.pixelSize: 15
        font.family: "Futura"
        font.bold: true
    }

    Text {
        id: text4
        x: 372
        y: 77
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "calorías" : "calories"
        font.pixelSize: 15
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text5
        x: -4
        y: 287
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "por mes" : getMonth()
        anchors.horizontalCenter: clipGraph.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 17
        font.bold: true
        font.family: "Futura"
    }

    Text {
        x: 31
        y: 110
        width: 29
        height: 124
        color: "#bfe4d5"
        text: "10km 9km 8km 7km 6km 5km 4km 3km 2km 1km"
        horizontalAlignment: Text.AlignRight
        wrapMode: Text.WordWrap
        font.pixelSize: 10
        font.bold: true
        font.family: "Futura"
    }
    states: [
        State {
            name: "running"
        },
        State {
            name: "steps"

            PropertyChanges {
                target: clipGraph
                x: 75
                y: 89
                width: 371
                height: 159
            }

            PropertyChanges {
                target: grid
                x: 0
                y: 0
                height: 159
            }

            PropertyChanges {
                target: text1
                x: 31
                y: 19
            }
        }
    ]
}
