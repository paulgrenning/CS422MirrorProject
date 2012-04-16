import QtQuick 1.0
import Qt 4.7
//import QtMultimediaKit 1.1


Item {
    id:config
    width:461
    height:300

    property alias configButtonState: configbutton1.state
    property alias lightButtonState: lightbutton.state
    property alias opacityButtonState: opacitybutton.state

    property alias generalOpacity: opacitybutton.genOpacity
    property alias lightOpacity: lightbutton.sliderValue
    ConfigButton {
        id: configbutton1
        x: 0
        y: 0
        opacity: 1.0-opacitybutton.genOpacity
        onClicked: {lightbutton.state = "closed";opacitybutton.state = "closed"}
    }

    LightButton {
        id: lightbutton
        x: 91
        y: 0
        opacity: 1.0-opacitybutton.genOpacity
        onClicked: {opacitybutton.state = "closed"; configbutton1.state = "closed" }
    }

    OpacityButton {
        id: opacitybutton
        x: 182
        y: 0
        onClicked: {lightbutton.state = "closed"; configbutton1.state = "closed" }
    }

    CameraEnableButton {
        id: cameraenablebutton1
        x: 274
        y: 206
        opacity: 1.0-opacitybutton.genOpacity
    }


}
