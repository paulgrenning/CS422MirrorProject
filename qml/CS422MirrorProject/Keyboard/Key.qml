import QtQuick 1.1
import "../UtilityElements"

Button {
    id: key
    width: 84
    height: 83
    anchors.centerIn: parent

    property bool shiftPressed: false

    property string currentValue: (shiftPressed) ? shiftValue : defaultValue
    property string defaultValue
    property string shiftValue

    defaultPath: "../Keyboard/images/keyBackground.png"
    clickedPath: "../Keyboard/images/keyClicked.png"

    signal keyPressed(string value)
    onButtonClicked: keyPressed(currentValue)

    Text {
        anchors.centerIn: parent
        text: currentValue
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: parent.displayLabel
    }
}
