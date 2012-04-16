import QtQuick 1.1

InputView {
    id: inputView
    width: confirmationBackground.width
    height: confirmationBackground.height
    anchors.centerIn: parent

    property string service
    property string language: appVar.currentLanguage
    property variant labels

    signal confirmationReceived(bool confirmed)

    Component.onCompleted: {
        labels = {
            English: {
                appName: "The Looking Glass",
                question1: "do you want to authorize",
                question2: "to access the email and calendar asscosciated with your '",
                question3: "' account?",
                yes: "yes",
                no: "no"
            },
            Español: {
                appName: "The Looking Glass",
                question1: "¿desea autorizar a",
                question2: "para que acceda a los datos asociados a su cuenta '",
                question3: "'?",
                yes: "sí",
                no: "no"
            }
        }
    }

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
        height: authDesc1.paintedHeight + productName.paintedHeight + authDesc2.paintedHeight + spacing * 2
        spacing: 20

        anchors {
            top: parent.top
            topMargin: 30
            horizontalCenter: parent.horizontalCenter
        }

        StdText {
            id: authDesc1
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 24
            text: labels[language].question1
        }

        StdText {
            id: productName
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
            text: labels[language].appName
            state: "blue"
        }

        StdText {
            id: authDesc2
            width: parent.width - 200
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 24
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: labels[language].question2 + service + labels[language].question3
        }
    }

    Row {
        id: buttonRow
        height: yesButton.height
        width: yesButton.width * 2 + spacing
        spacing: 10

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 30
        }

        LabeledButton {
            id: yesButton
            width: 147
            height: 102

            defaultPath: "../IntroFlow/images/confirmButtonUP.png"
            clickedPath: "../IntroFlow/images/confirmButtonDN.png"
            label: labels[language].yes

            onButtonClicked: confirmationReceived(true)
        }

        LabeledButton {
            id: noButton
            width: 147
            height: 102

            defaultPath: "../IntroFlow/images/confirmButtonUP.png"
            clickedPath: "../IntroFlow/images/confirmButtonDN.png"
            label: labels[language].no

            onButtonClicked: confirmationReceived(false)
        }
    }
}
