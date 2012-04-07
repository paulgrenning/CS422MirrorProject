// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt 4.7
import "../AppVariables"

Item {
    id: fitnessItem
    width: 520
    height: 310

    state: "running"


    Image {
        id: image1
        x: 300
        y: 19
        width: 220
        height: 50
        z: 2
        source: "images/runningPressed.png"

        MouseArea {
            id: mouseAreaRunning
            x: 0
            y: 0
            width: 110
            height: 50
            opacity: 1
            onClicked: {
                console.log("run")
                fitnessItem.state = "running"
            }
        }

        MouseArea {
            id: mouseAreaSteps
            x: 110
            y: 0
            width: 110
            height: 50
            opacity: 1
            onClicked: {
                console.log("step")
                fitnessItem.state = "steps"
            }
        }
    }

    Loader{
        id:loader
        focus:true
    }

    states: [
        State {
            name: "running"

            PropertyChanges {
                target: loader
                source: "Running.qml"
            }

            PropertyChanges {
                target: image1
                source: (appVar.currentLanguage == "Español") ? "images/runningPressedSP.png" :  "images/runningPressed.png"
            }

        },
        State {
            name: "steps"

            PropertyChanges {
                target: image1
                source: (appVar.currentLanguage == "Español") ? "images/stepsPressedSP.png" : "images/stepsPressed.png"
            }
        }
    ]
}
