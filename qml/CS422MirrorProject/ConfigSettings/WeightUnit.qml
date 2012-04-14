// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: button
    anchors.fill: parent
    width:300
    height: 50
    state: "kg"
    Image {
        id: weightButton
        source: "images/kg.png"
    }

    MouseArea {
        anchors{
            left: parent.left
            top: parent.top
        }
        width: 150
        height: 50
        onClicked: {
            button.state = "lb"
            appVar.currentDegreesUnit = "lb"
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
            button.state = "kg"
            appVar.currentDegreesUnit = "Kg"
        }
    }

    states: [
        State {
            name: "kg"
            PropertyChanges { target: weightButton; source: "images/kg.png" }
        },
        State {
            name: "lb"
            PropertyChanges { target: weightButton; source: "images/lb.png" }
        }
    ]
}
