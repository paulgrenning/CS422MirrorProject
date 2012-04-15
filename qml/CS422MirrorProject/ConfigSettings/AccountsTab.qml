import QtQuick 1.1
import "../UtilityElements"

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

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appVar.renderIntroFlow = true;
                handleNewUser();
            }
        }

        id: runSetupButton
        source: (appVar.currentLanguage == "Español") ? "images/runSetupSP.png" : "images/runSetup.png"
        opacity: 1.0
    }

    StdText {
        anchors {
            top: runSetupButton.bottom
            left: runSetupButton.left
            leftMargin: 20
        }
        height: 60
        width: 400
        font.pointSize: 24
        text: (appVar.currentLanguage == "Español") ? "Quite Cuentas" : "Remove Accounts"
    }
}
