// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt 4.7
import "../AppVariables"

Item {
    id: item1
    width: 520
    height: 310

    state: "running"


    Image {
        id: image1
        x: 300
        y: 19
        width: 220
        height: 50
        z: 1
        source: "images/runningPressed.png"
    }

    Loader{
        id:loader
        focus:true
    }

    MouseArea {
        id: mouseAreaRunning
        x: 300
        y: 19
        width: 110
        height: 50
        opacity: 0
    }

    MouseArea {
        id: mouseAreaSteps
        x: 410
        y: 19
        width: 110
        height: 50
        opacity: 0
    }

    states: [
        State {
            name: "running"

            PropertyChanges {
                target: loader
                source: "Running.qml"
            }

            PropertyChanges {
                target: mouseAreaRunning
                opacity: 1
            }
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
