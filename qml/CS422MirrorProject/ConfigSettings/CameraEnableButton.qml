// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id:config
    width:186
    height:94

    state: "enabled"

    Image {
        id: cameraImage
        anchors.fill: parent
        source: (appVar.currentLanguage == "Español") ? "images/cameraEnabledButSP.png":"images/cameraEnabledBut.png"

        MouseArea {
            id: mousearea
            x: 0
            y: 0
            width: 186
            height: 94
            onClicked: (config.state == "enabled") ? config.state = "disabled" : config.state = "enabled"

        }
    }

    states: [
        State {
            name: "enabled"
        },
        State {
            name: "disabled"

            PropertyChanges {
                target: cameraImage
                opacity: 0.810
                source: (appVar.currentLanguage == "Español") ? "images/cameraDisabledButSP.png" : "images/cameraDisabledBut.png"
            }
        }
    ]
}
