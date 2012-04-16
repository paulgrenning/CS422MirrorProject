import QtQuick 1.0
import Qt 4.7
//import QtMultimediaKit 1.1


Item {
    id:config
    width:510
    height:300
    z: 2

    property alias configButtonState: configbutton1.state
    property alias lightButtonState: lightbutton.state
    property alias opacityButtonState: opacitybutton.state
    property alias generalOpacity: opacitybutton.genOpacity
    property alias lightOpacity: lightbutton.sliderValue
    signal helpclicked()
    signal aboutclicked()
    property real removeAccount: configbutton1.removeAccount

    onRemoveAccountChanged: {
        configbutton1.removeAccount = config.removeAccount
    }

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

    Image {
        id: image1
        x: 466
        y: 211
        width: 40
        height: 40
        source: "images/helpButton.png"
        MouseArea{
            anchors.fill: parent
            onClicked: helpclicked()
        }
    }

    Image {
        id: image2
        x: 466
        y: 252
        width: 40
        height: 40
        source: "images/aboutButton.png"
        MouseArea{
            anchors.fill: parent
            onClicked: aboutclicked()
        }
    }


}
