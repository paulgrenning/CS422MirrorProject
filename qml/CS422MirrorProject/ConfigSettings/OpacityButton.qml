// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id:config
    width:91
    height:300
    state: "closed"

    property alias state: config.state
    property alias genOpacity: sliderOpacity.value
    signal clicked();

    Image {
        id: opacityButImage
        x: 0
        y: 209
        width: 91
        height: 91
        source: (appVar.currentLanguage == "Español") ? "images/opacityButClosedSP.png" : "images/opacityButClosed.png"

        MouseArea {
            id: opacityButMouseArea
            anchors.fill: parent
            onClicked:  {
                config.clicked();
                if(config.state == "open")  config.state = "closed"
                else config.state = "open";
            }
        }
    }

    Slider {
        id: sliderOpacity
        x: 31
        y: 74
        width: 29
        height: 140
        maximum: 0.99
        minimum: 0.0
        value: 0
    }

    states: [
        State {
            name: "closed"

            PropertyChanges {
                target: sliderOpacity
                opacity: 0
            }
        },
        State {
            name: "open"

            PropertyChanges {
                target: opacityButImage
                x: 0
                y: 47
                height: 253
                source: (appVar.currentLanguage == "Español") ? "images/opacityButOpenSP.png" : "images/opacityButOpen.png"
            }
        }
    ]
}
