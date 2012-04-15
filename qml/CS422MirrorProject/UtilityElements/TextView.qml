import QtQuick 1.1
import "../Keyboard"
import "../UtilityElements"

InputView {
    id: textView
    width: keyboard.width
    height: keyboard.height

    property string inputLabel
    property string inputMessage

    property variant validator
    property string failMessage

    property bool skippable: false
    property bool isPassword: false

    signal inputReady(string input)
    signal skipInput()

    Column {
        id: contents
        width: keyboard.width
        height: message.paintedHeight + keyboard.height

        StdText {
            id: message
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
            state: "orange"
            text: inputMessage
        }

        KeyBoard {
            id: keyboard
            inputLabel: textView.inputLabel
            skippable: textView.skippable
            isPassword: textView.isPassword

            onInputReady: {
                if(validator) {
                    if(input.match(validator)) textView.inputReady(input)
                    else if(failMessage) errorPopup.opacity = 1
                } else {
                    textView.inputReady(input)
                }
            }

            onSkipInput: textView.skipInput()
            onReceivedTouch: errorPopup.opacity = 0
        }
    }

    Item {
        id: errorPopup
        width: popupBackground.width
        height: popupBackground.height
        opacity: 0

        anchors {
            bottom: contents.top
            bottomMargin: (inputMessage) ? -85 : -55
            right: contents.right
            rightMargin: (skippable) ? 330 : 285
        }

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        Image {
            id: popupBackground
            width: 225
            height: 114
            source: "../IntroFlow/images/errorPopup.png"
            anchors.fill: parent
        }

        StdText {
            id: popupText
            width: parent.width - 30
            height: parent.height - 10
            anchors.centerIn: parent
            font.pixelSize: 18
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: failMessage
        }
    }
}
