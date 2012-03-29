// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id:config
    width:91
    height:300

    property alias state: config.state

    Image {
        id: image1
        x: 0
        y: 209
        width: 91
        height: 91

        source: (appVar.currentLanguage == "Español") ? "images/configButClosed.png" : "images/configButClosed.png"

        MouseArea {
            id: mouse_area1
            anchors.fill: parent
        }
    }
    states: [
        State {
            name: "closed"
        },
        State {
            name: "open"
        }
    ]
}
