// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt 4.7
import "../AppVariables"

Item {
    width: 520
    height: 310

    AppVariables{
        id:appVar

    }

    Text {
        id: text1
        x: 14
        y: 24
        text: (appVar.currentLanguage == "Español") ? "carrera de hoy" : "today's run"
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 30
        color: "#bfe4d5"
    }

    Rectangle {
        id: clipGraph
        x: 67
        y: 150
        width: 343
        height: 126
        color: "#00000000"
        z: 1
        clip: true
        GridView{
            id: grid
            width: 50*bargraphmodel.count
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            cellHeight: 180
            flickableDirection: Flickable.HorizontalFlick
            interactive: true
            cellWidth: 25
            model: bargraphmodel
            delegate: BarGraphDelegate{
            }
        }
    }

    XmlListModel {
        id: bargraphmodel
        source: "http://nikeplus.nike.com/nikeplus/v1/services/widget/get_public_run_list.jsp?userID=340599345"
        query: "/plusService/runList/run"
        XmlRole { name: "bar_height"; query: "calories/string()" }
    }

    Image {
        id: image1
        x: 317
        y: 19
        width: 190
        height: 50
        source: "images/runningPressed.png"
    }

    Text {
        id: text2
        x: 40
        y: 83
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "tiempo" : "time"
        font.pixelSize: 15
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text3
        x: 208
        y: 83
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "distancia" : "distance"
        font.pixelSize: 15
        font.family: "Futura"
        font.bold: true
    }

    Text {
        id: text4
        x: 369
        y: 83
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "calorías" : "calories"
        font.pixelSize: 15
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text5
        x: 208
        y: 111
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "este mes" : "this month"
        font.pixelSize: 20
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
