// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    anchors.fill: parent
    width: 400
    height: 60
    id: accountsTabHandler
    state: "runSetup"

    Image {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 50
            leftMargin: 25
        }
        height: 60
        width: 400

        id: runSetupButton
        source: (appVar.currentLanguage == "Español") ? "images/runSetupSP.png" : "images/runSetup.png"
        opacity: 1.0
    }

    Text {
        anchors {
            top: runSetupButton.bottom
            left: runSetupButton.left
            leftMargin: 20
        }
        height: 60
        width: 400
        color: "#7dd9b3"
        font.pointSize: 24
        font.family: "Futura"
        text: (appVar.currentLanguage == "Español") ? "Quite Cuentas" : "Remove Accounts"
    }
}
