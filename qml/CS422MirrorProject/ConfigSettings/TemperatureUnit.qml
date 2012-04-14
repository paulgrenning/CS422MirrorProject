// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: button
    anchors.fill: parent
    width:300
    height: 50
    state: "celsius"
    Image {
        id: temperatureButton
        source: "images/C.png"
    }

    MouseArea {
        anchors{
            left: parent.left
            top: parent.top
        }
        width: 150
        height: 50
        onClicked: {
            button.state = "fahrenheit"
            appVar.currentDegreeSystem = "Fahrenheit"
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
            button.state = "celsius"
            appVar.currentDegreeSystem = "Celsius"
        }
    }

    states: [
        State {
            name: "celsius"
            PropertyChanges { target: temperatureButton; source: "images/C.png" }
        },
        State {
            name: "fahrenheit"
            PropertyChanges { target: temperatureButton; source: "images/F.png" }
        }
    ]
}
