import QtQuick 1.1
import "../UtilityElements"

Item {
    id: container
    width: 13
    height: 38

    property bool blink: true
    property int moveDelta

    Timer {
        interval: 500; running: true; repeat: true;
        onTriggered: {
            container.blink = !container.blink
        }
    }

    StdText {
        id: cursor
        visible: container.blink
        anchors.fill: parent
        font.pixelSize: 32
        text: "|"
    }
}
