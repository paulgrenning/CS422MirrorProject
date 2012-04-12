// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: container
    width: 14
    height: 35

    property bool blink: true

    Timer{
        interval: 500; running: true; repeat: true;
        onTriggered: {
            container.blink = !container.blink
        }
    }

    Text {
        id: cursor
        text: "|"
        visible: container.blink
        anchors.fill: parent
        font.pixelSize: 32
    }
}
