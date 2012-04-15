// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

InputView {
    id: inputView
    width: confirmationBackground.width
    height: confirmationBackground.height
    anchors.centerIn: parent

    property string service

    Image {
        id: confirmationBackground
        width: 742
        height: 357
        anchors.fill: parent

        fillMode: Image.PreserveAspectFit
        smooth: true
        source: "../IntroFlow/images/confirmBackground.png"
    }

    Column {
        id: content
        width: parent.width
        height: authorizeQuestion.height + + productName.height + buttonRow.height + spacing * 2
        spacing: 20

        anchors {
            top: parent.top
            topMargin: 30
            horizontalCenter: parent.horizontalCenter
        }

        StdText {
            id: authorizeQuestion
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
            text: "do you want to authorize"
        }

        StdText {
            id: productName
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
            text: "COOL MIRROR PRODUCT NAME"
            state: "blue"
        }

        Row {
            id: buttonRow
            height: yesButton.height
            width: yesButton.width * 2 + spacing
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            LabeledButton {
                id: yesButton
                width: 147
                height: 102

                defaultPath: "../IntroFlow/images/confirmButtonUP.png"
                clickedPath: "../IntroFlow/images/confirmButtonDN.png"

                label: "yes"
            }

            LabeledButton {
                id: noButton
                width: 147
                height: 102

                defaultPath: "../IntroFlow/images/confirmButtonUP.png"
                clickedPath: "../IntroFlow/images/confirmButtonDN.png"

                label: "no"
            }
        }
    }
}
