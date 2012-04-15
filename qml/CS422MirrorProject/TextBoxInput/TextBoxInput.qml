import QtQuick 1.1
import "../UtilityElements"

Item {
    Item {
        anchors.fill: parent
        id: textBox
        opacity: 0

        StdText {
            anchors{
                right: textBoxImage.left
                top: textBoxImage.top
                topMargin: 10
            }
            id: infoText
            text: ""

            font.pointSize: 20
        }

        Image {
            id: textBoxImage
            width: 365
            height: 50
            anchors {
                left: parent.left
                leftMargin: 500
                top: parent.top
                topMargin: 100
            }
            source: "../textBox.png";

            TextInput {
                    anchors.fill: parent
                    anchors {
                        topMargin: 10
                        leftMargin: 20
                        rightMargin: 20
                    }

                    color: "#bee7d5"
                    font.pointSize: 20
                    font.family: "Futura"
            }
        }
    }

    PropertyAnimation {id:textBoxAnim; target: textBox; property: "opacity"; to: (textBox.opacity == 0) ? displayOpacity : 0; duration: 500}
}

