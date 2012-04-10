import QtQuick 1.1

Item {
    id: widget
    width: pWidth
    height: pHeight

    property int pWidth
    property int pHeight
    property string bgImgPath

    MouseArea {
         anchors.fill: parent
         drag.target: widget
         drag.axis: Drag.XandYAxis
         drag.minimumX: 0
         drag.maximumX: rootElement.width - parent.width
         drag.minimumY: 0
         drag.maximumY: rootElement.height - parent.height
    }

    Image {
        id: widgetBackground
        width: parent.width
        height: parent.height
        source: bgImgPath
        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
    }
}
