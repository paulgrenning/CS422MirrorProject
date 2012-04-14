// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../Keyboard"

InputView {
    id: textView
    width: keyboard.width
    height: keyboard.height

    property string inputLabel

    signal inputReady(string input)

    // onHideViewChanged: keyboard.inUse = !hideView;

    KeyBoard {
        id: keyboard
        inputLabel: parent.inputLabel

        onInputReady: parent.inputReady(input)
    }
}
