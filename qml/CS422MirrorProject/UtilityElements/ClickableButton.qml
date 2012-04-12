// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Button {
    id: clickableButton

    property bool isSelected: false

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: canHover

        onEntered: if(canHover) overlay.opacity = .6
        onExited: if(canHover) overlay.opacity = 0
        onClicked: clickAnimation.running = true
    }

    SequentialAnimation {
        id: clickAnimation
        running: false
        PropertyAction { target: clickableButton; property: currentPath; value: clickedPath }
        PauseAnimation { duration: 50 }
        PropertyAction { target: clickableButton; property: currentPath; value: defaultPath }
    }
}
