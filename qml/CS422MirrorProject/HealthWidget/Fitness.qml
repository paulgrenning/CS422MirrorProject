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
        x: 288
        y: 14
        width: 220
        height: 50
        z: 3
        source: "images/runningPressed.png"
        Timer{ interval: 1
               running:true;
               repeat: true;
               onTriggered:{
                   if(opacity==1)opacity=0.99
                   else opacity=1
                 }
        }

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
                source: (appVar.currentLanguage === "Español") ? "images/runningPressedSP.png" :  "images/runningPressed.png"
            }

        },
        State {
            name: "steps"

            PropertyChanges {
                target: loader
                source: "Steps.qml"
            }

            PropertyChanges {
                target: image1
                source: (appVar.currentLanguage === "Español") ? "images/stepsPressedSP.png" : "images/stepsPressed.png"
            }
        }
    ]
}
