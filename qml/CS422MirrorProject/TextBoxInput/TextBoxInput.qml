// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    Item {
        anchors.fill: parent
        id: textBox
        opacity: 0

        Text {
            anchors{
                right: textBoxImage.left
                top: textBoxImage.top
                topMargin: 10
            }
            id: infoText
            text: ""

            color: "#7dd9b3"
            font.pointSize: 20
            font.family: "Futura"
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

                    color: "#7dd9b3"
                    font.pointSize: 20
                    font.family: "Futura"
            }
        }
    }

    PropertyAnimation {id:textBoxAnim; target: textBox; property: "opacity"; to: (textBox.opacity == 0) ? displayOpacity : 0; duration: 500}
}

