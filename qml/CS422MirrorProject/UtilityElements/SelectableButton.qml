// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Button {
    id: selectableButton

    property bool isSelected: false

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: canHover

        onEntered: if(canHover) overlay.opacity = .6
        onExited: if(canHover) overlay.opacity = 0
        onClicked: {
            if(!isSelected) select()
            else deselect()
        }
    }

    function select() {
        currentPath = clickedPath;
    }

    function deselect() {
        currentPath = defaultPath
    }
}
