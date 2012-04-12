// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: button

    property string label
    property bool displayLabel: false

    property string currentPath: defaultPath
    property string defaultPath
    property string hoverPath
    property string clickedPath

    property bool canHover: true

    signal buttonClicked()
    Component.onCompleted: mousearea.clicked.connect(buttonClicked)

    Image {
        id: backgroundImage
        anchors.fill: parent

        fillMode: Image.PreserveAspectFit
        smooth: true
        source: currentPath
    }

    Image {
        id: hoverOverlay
        anchors.fill: parent
        opacity: 0
        z: 2

        fillMode: Image.PreserveAspectFit
        smooth: true
        source: hoverPath
    }

    Text {
        anchors.centerIn: parent
        text: label
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: parent.displayLabel
    }
}
