import QtQuick 1.1
import "../UtilityElements"

Button {
    id: key
    width: 84
    height: 83

    property bool shiftPressed: false
    property bool symPressed: false

    property string currentValue: (symPressed == true) ? symValue : ((shiftPressed == true) ?  shiftValue : defaultValue)
    property string defaultValue
    property string shiftValue
    property string symValue

    property string fontType: "Futura"
    property int fontSize: 32
    property string fontColor: "#7dd9b3"

    defaultPath: "../Keyboard/images/keyBackground.png"
    clickedPath: "../Keyboard/images/keyClicked.png"

    onButtonClicked: key_board.keyPressed(currentValue)

    Text {
        anchors.centerIn: parent
        text: currentValue
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: key.fontColor
        font.family: key.fontType;
        font.pixelSize: key.fontSize;
    }
}
