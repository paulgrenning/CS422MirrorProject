import QtQuick 1.1
import "../UtilityElements"

Button {
    id: key
    width: 84
    height: 83
    state: key_board.state

    defaultPath: "../Keyboard/images/keyBackground.png"
    clickedPath: "../Keyboard/images/keyClicked.png"

    property string currentValue: defaultValue
    property string defaultValue
    property string shiftValue: defaultValue
    property string symValue: defaultValue

    property int fontSize: 32

    onStateChanged: {
        switch(state) {
            case "default": currentValue = defaultValue; break
            case "shift": currentValue = shiftValue; break
            case "sym": currentValue = symValue; break
        }
    }

    onButtonClicked: key_board.keyPressed(currentValue)

    StdText {
        anchors.centerIn: parent
        text: currentValue
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: key.fontSize;
    }
}
