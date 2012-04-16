// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id:config
    width:91
    height:300
    state: "closed"

    property alias state: config.state
    signal clicked();

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
            onClicked:
            {
                config.clicked();
                if(config.state == "open")  config.state = "closed"
                else config.state = "open";
            }
        }
    }

    SettingsWidget {
        id: settingsWidget
        opacity: 0
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: -16
            topMargin: -170
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

    transitions: [
         Transition {
             from: "closed"
             to: "open"
             NumberAnimation { target: settingsWidget; property: "opacity"; to: 1.0; duration: 200}
         },
         Transition {
             from: "open"
             to: "closed"
             NumberAnimation { target: settingsWidget; property: "opacity"; to: 0.0; duration: 200}
         }
     ]
}
