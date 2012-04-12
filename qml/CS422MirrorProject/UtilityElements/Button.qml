// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: button

    property string defaultPath
    property string clickedPath

    signal buttonClicked()
    Component.onCompleted: mousearea.clicked.connect(buttonClicked)

    Image {
        id: backgroundImage
        anchors.fill: parent

        fillMode: Image.PreserveAspectFit
        smooth: true
        source: defaultPath
    }

    Image {
        id: clickedOverlay
        anchors.fill: parent
        opacity: 0
        z: 2

        fillMode: Image.PreserveAspectFit
        smooth: true
        source: clickedPath
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent

        onClicked: clickAnimation.start()
    }

    SequentialAnimation {
        id: clickAnimation
        running: false
        NumberAnimation { target: clickedOverlay; property: "opacity"; to: .75; duration: 100 }
        NumberAnimation { target: clickedOverlay; property: "opacity"; to: 0; duration: 100 }
    }
}
