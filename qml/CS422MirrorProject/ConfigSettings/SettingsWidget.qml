// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: settingsTab
    state: "accounts"
    width: 400
    height: 400

    Image {
        id: backgroundImage
        source: "images/tab1.png"
    }

    MouseArea {
        id: accountsMouseArea
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 10
        }

        width: 133
        height: 50

        onClicked: {
            console.log("accounts");
            settingsTab.state = "accounts";
        }
    }

    MouseArea {
        id: languageMouseArea
        anchors {
            top: parent.top
            left: accountsMouseArea.right
            topMargin: 10
        }

        width: 133
        height: 50

        onClicked: {
            console.log("languages");
            settingsTab.state = "language";
        }
    }

    MouseArea {
        id: wifiMouseArea
        anchors {
            top: parent.top
            left: languageMouseArea.right
            topMargin: 10
        }

        width: 133
        height: 50

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
            name: "accounts"
            PropertyChanges { target: backgroundImage; source: "images/tab1.png" }
        },
        State {
            name: "language"
            PropertyChanges { target: backgroundImage; source: "images/tab2.png" }
            PropertyChanges { target: languageSettings; opacity: 1.0 }
        },
        State {
            name: "wifi"
            PropertyChanges { target: backgroundImage; source: "images/tab3.png" }
        }

    ]
}
