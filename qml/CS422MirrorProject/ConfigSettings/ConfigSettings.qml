import QtQuick 1.0
import Qt 4.7
//import QtMultimediaKit 1.1


Item {
    id:config
    width:461
    height:300

    property alias generalOpacity: opacitybutton.genOpacity

    ConfigButton {
        id: configbutton1
        x: 0
        y: 0
        opacity: 1.0-opacitybutton.genOpacity
    }

    LightButton {
        id: lightbutton
        x: 91
        y: 0
        opacity: 1.0-opacitybutton.genOpacity
    }

    OpacityButton {
        id: opacitybutton
        x: 182
        y: 0
    }

    CameraEnableButton {
        id: cameraenablebutton1
        x: 274
        y: 206
        opacity: 1.0-opacitybutton.genOpacity
    }


}
