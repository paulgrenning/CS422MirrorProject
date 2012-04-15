// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id:config
    width:91
    height:300

    state: "closed"

    property alias state: config.state
    signal clicked();
    property real sliderValue: sliderLight.value

    Image {
        id: lightButImage
        x: 0
        y: 209
        width: 91
        height: 91
        source: (appVar.currentLanguage == "Español") ? "images/lightButClosedSP.png" : "images/lightButClosed.png"

        MouseArea {
            id: lightButMouseArea
            anchors.fill: parent
            onClicked:{
                config.clicked();
                if(config.state == "open")  config.state = "closed"
                else config.state = "open";
            }

        }
    }

    Slider {
        id: sliderLight
        x: 31
        y: 74
        width: 29
        height: 140
        maximum: 0.99
        minimum: 0.0
        value: 1
    }

    states: [
        State {
            name: "closed"

            PropertyChanges {
                target: sliderLight
                opacity: 0
            }
        },
        State {
            name: "open"

            PropertyChanges {
                target: lightButImage
                x: 0
                y: 46
                height: 254
                source: (appVar.currentLanguage == "Español") ? "images/lightButOpenSP.png" : "images/lightButOpen.png"
            }
        }
    ]
}
