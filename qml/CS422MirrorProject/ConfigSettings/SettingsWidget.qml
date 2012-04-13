// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: settingsTab
    state: "general"
    width: 400
    height: 400

    Image {
        id: backgroundImage
        source: "images/configTabGeneral.png"
    }

    MouseArea {
        id: generalMouseArea
        x: 21
        y: 10
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 10
        }

        width: 143
        height: 36
        anchors.leftMargin: 21

        onClicked: {
            console.log("general");
            settingsTab.state = "general";
        }
    }

    MouseArea {
        id: accountsMouseArea
        x: 164
        y: 10
        anchors {
            top: parent.top
            left: generalMouseArea.right
            topMargin: 10
        }

        width: 133
        height: 36

        onClicked: {
            console.log("accounts");
            settingsTab.state = "accounts";
        }
    }

    MouseArea {
        id: wifiMouseArea
        x: 297
        y: 10
        anchors {
            top: parent.top
            left: accountsMouseArea.right
            topMargin: 10
        }

        width: 138
        height: 36

        onClicked: {
            console.log("wifi");
            settingsTab.state = "wifi"
        }
    }

    LanguageSettings {
        id: languageSettings
        opacity: 0
        anchors {
            top: parent.top
            left: parent.left
        }
    }

    states: [
        State {
            name: "general"
            PropertyChanges { target: backgroundImage; source: "images/configTabGeneral.png" }
            PropertyChanges { target: languageSettings; opacity: 1.0 }
        },
        State {
            name: "accounts"
            PropertyChanges { target: backgroundImage; source: "images/configTabAccounts.png" }
        },
        State {
            name: "wifi"
            PropertyChanges { target: backgroundImage; source: "images/configTabWifi.png" }
        }

    ]
}
