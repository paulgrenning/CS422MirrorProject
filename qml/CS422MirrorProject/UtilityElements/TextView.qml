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

    signal inputReady(string input)

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

            onInputReady: {
                if(validator) {
                    if(input.match(validator)) textView.inputReady(input)
                    else if(failMessage) popup.opacity = 1
                } else {
                    textView.inputReady(input)
                }
            }
        }
    }

    Item {
        id: popup
        opacity: 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        StdText {
            id: popupText
            text: failMessage
        }
    }
}
