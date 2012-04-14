// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: button
    anchors.fill: parent
    width:300
    height: 50
    state: "km"
    Image {
        id: weightButton
        source: "images/km.png"
    }

    MouseArea {
        anchors{
            left: parent.left
            top: parent.top
        }
        width: 150
        height: 50
        onClicked: {
            button.state = "mi"
            appVar.currentDegreesUnit = "mi"
        }
    }

    MouseArea {
        anchors{
            left: parent.left
            top: parent.top
            leftMargin: 150
        }
        width: 150
        height: 50
        onClicked: {
            button.state = "km"
            appVar.currentDegreesUnit = "Km"
        }
    }

    states: [
        State {
            name: "km"
            PropertyChanges { target: weightButton; source: "images/km.png" }
        },
        State {
            name: "mi"
            PropertyChanges { target: weightButton; source: "images/miles.png" }
        }
    ]
}
