import QtQuick 1.0
import "../UtilityElements"

Item {
    id: container

    property int fontSize: 12
    property string text: "NOT SET"
    property string icon: ""

    signal selected

    width: 270; height: 64
    clip: true

    StdText {
        id: itemText
        x: 45
        y: 0
        width: 225
        height: 48
        font.pointSize: container.fontSize
        text: container.text
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed: click_image.opacity = 1
        onReleased: click_image.opacity = 0
    }

    Image {
        id: divider
        x: 0
        y: 48
        width: container.width
        height: 16
        source: "./images/divider.png"
    }

    BorderImage {
        id: click_image
        width: 270
        height: 48
        anchors.bottomMargin: 16
        anchors.fill: parent
        source: "./images/newsItemBackground.png"
        opacity: 0
    }

    Image {
        id: iconImage
        x: 0; y: 4
        width: 40; height: 40
        source: container.icon
    }

    Component.onCompleted: { mouseArea.clicked.connect(selected)}
}
