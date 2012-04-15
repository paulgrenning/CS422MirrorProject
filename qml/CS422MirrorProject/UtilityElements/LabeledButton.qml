// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Button {
    id: labeledButton

    property string label
    property int textSize: 45
    state: "default"

    StdText {
        id: buttonText
        font.pixelSize: textSize
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 16
        }

        state: labeledButton.state
        text: label
    }
}
