import QtQuick 1.1
import Qt 4.7
import "../AppVariables"
//import QtMultimediaKit 1.1

Item {
    id:healthwidget
    property alias barstate: healthwidget.state

    width:554
    height:375


    state : "fitness"

    AppVariables{
        id:appVar
    }

    MouseArea {
         anchors.fill: parent
         drag.target: healthwidget
         drag.axis: Drag.XandYAxis
         drag.minimumX: 0
         drag.maximumX: rootElement.width - healthwidget.width
         drag.minimumY: 0
         drag.maximumY: rootElement.height - parent.height
    }

    Image {
        id: background
        anchors.fill: parent
        source: "images/fitnessTabBackground.png"

        MouseArea {
            id: fitnessTabMouseArea
            x: 29
            y: 16
            width: 129
            height: 30
            onClicked: healthwidget.state = "fitness"
        }

        MouseArea {
            id: weightTabMouseArea
            x: 158
            y: 16
            width: 121
            height: 30
            onClicked: healthwidget.state = "weight"
        }

        MouseArea {
            id: nutritionTabMouseArea
            x: 279
            y: 16
            width: 121
            height: 30
            onClicked: healthwidget.state = "nutrition"
        }

        MouseArea {
            id: sleepTabMouseArea
            x: 400
            y: 16
            width: 126
            height: 30
            onClicked: healthwidget.state = "sleep"
        }

        Rectangle {
            id: rectangle1
            x: 14
            y: 46
            width: 520
            height: 310
            color: "#00000000"

            Loader{
                id:loader
                focus:true
            }
        }
    }


    states: [
        State {
            name: "fitness"
            PropertyChanges {
                target: background
                source: (appVar.currentLanguage == "Español") ? "images/fitnessTabBackgroundSP.png" : "images/fitnessTabBackground.png"
            }
            PropertyChanges {
                target: loader
                source: "Fitness.qml"
            }
        },
        State {
            name: "weight"
            PropertyChanges {
                target: background
                source: (appVar.currentLanguage == "Español") ? "images/weightTabBackgroundSP.png" : "images/weightTabBackground.png"
            }

            PropertyChanges {
                target: loader
                source: "Weight.qml"
            }
        },
        State {
            name: "nutrition"
            PropertyChanges {
                target: background
                source: (appVar.currentLanguage == "Español") ? "images/nutritionTabBackgroundSP.png": "images/nutritionTabBackground.png"
            }

            PropertyChanges {
                target: loader
                source: "Nutrition.qml"
            }
        },
        State {
            name: "sleep"
            PropertyChanges {
                target: background
                source: (appVar.currentLanguage == "Español") ? "images/sleepTabBackgroundSP.png" : "images/sleepTabBackground.png"
            }

            PropertyChanges {
                target: loader
                source: "Sleep.qml"
            }
        }
    ]

}

