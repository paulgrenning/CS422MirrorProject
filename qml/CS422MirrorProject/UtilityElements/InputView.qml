// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../Keyboard"

Item {
    width: keyboard.width
    height: keyboard.height

    property string inputLabel

    function render() {
        keyboard.inUse = true
    }

    KeyBoard {
        id: keyboard
        inputLabel: parent.inputLabel
    }
}
