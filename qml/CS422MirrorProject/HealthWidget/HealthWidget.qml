import QtQuick 1.1
import Qt 4.7
import "../AppVariables"
//import QtMultimediaKit 1.1
import "../UtilityElements"

Widget{
    id:healthwidget
    bgImgPath: (appVar.currentLanguage == "Español") ? "../HealthWidget/images/fitnessTabBackgroundSP.png" : "../HealthWidget/images/fitnessTabBackground.png"
    isVisible: false
    property variant laststate: "fitness"
    property alias barstate: healthwidget.state

    width:554
    height:375

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

        MouseArea {
            id: fitnessTabMouseArea
            x: 29
            y: 16
            width: 129
            height: 30
            onClicked: {
                healthwidget.laststate = "fitness"
                healthwidget.state = "fitness"

            }
        }

        MouseArea {
            id: weightTabMouseArea
            x: 158
            y: 16
            width: 121
            height: 30
            onClicked: {
                healthwidget.laststate = "weight"
                healthwidget.state = "weight"
            }
        }

        MouseArea {
            id: nutritionTabMouseArea
            x: 279
            y: 16
            width: 121
            height: 30
            onClicked: {
                healthwidget.laststate = "nutrition"
                healthwidget.state = "nutrition"
            }
        }

        MouseArea {
            id: sleepTabMouseArea
            x: 400
            y: 16
            width: 126
            height: 30
            onClicked: {
                healthwidget.laststate = "sleep"
                healthwidget.state = "sleep"
            }
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


    states: [
        State {
            name: "fitness"
            PropertyChanges {
                target: healthwidget
                bgImgPath: (appVar.currentLanguage == "Español") ? "../HealthWidget/images/fitnessTabBackgroundSP.png" : "../HealthWidget/images/fitnessTabBackground.png"
            }
            PropertyChanges {
                target: loader
                source: "Fitness.qml"
            }
        },
        State {
            name: "weight"
            PropertyChanges {
                target: healthwidget
                bgImgPath: (appVar.currentLanguage == "Español") ? "../HealthWidget/images/weightTabBackgroundSP.png" : "../HealthWidget/images/weightTabBackground.png"
            }

            PropertyChanges {
                target: loader
                source: "Weight.qml"
            }
        },
        State {
            name: "nutrition"
            PropertyChanges {
                target: healthwidget
                bgImgPath: (appVar.currentLanguage == "Español") ? "../HealthWidget/images/nutritionTabBackgroundSP.png": "../HealthWidget/images/nutritionTabBackground.png"
            }

            PropertyChanges {
                target: loader
                source: "Nutrition.qml"
            }
        },
        State {
            name: "sleep"
            PropertyChanges {
                target: healthwidget
                bgImgPath: (appVar.currentLanguage == "Español") ? "../HealthWidget/images/sleepTabBackgroundSP.png" : "../HealthWidget/images/sleepTabBackground.png"
            }

            PropertyChanges {
                target: loader
                source: "../HealthWidget/Sleep.qml"
            }
        }
    ]

}

