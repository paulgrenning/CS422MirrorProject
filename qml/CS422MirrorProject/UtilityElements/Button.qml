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

    property bool isSelectable: true
    property bool isSelected: false
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

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: canHover

        onEntered: if(canHover) overlay.opacity = .6
        onExited: if(canHover) overlay.opacity = 0
        onClicked: {
            if(isSelectable) {
                if(!isSelected) select()
                else deselect()
            }
        }
    }

    function select() {
        currentPath = clickedPath;
    }

    function deselect() {
        currentPath = defaultPath
    }
}
