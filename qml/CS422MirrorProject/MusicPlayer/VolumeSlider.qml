import QtQuick 1.1

Item {
    id: slider; width: 140; height: 29
    // value is read/write.
    property real value: 0.5
    property real maximum: 1
    property real minimum: 1
    property int xMax: width - 15
    onValueChanged: updatePos();
    onXMaxChanged: updatePos();
    onMinimumChanged: updatePos();

    function updatePos() {
        if (maximum > minimum) {
            var pos =  (value - minimum) * slider.xMax / (maximum - minimum);
            pos = Math.min(pos, width - handle.width);
            pos = Math.max(pos, 2);
            handle.x =  pos;

        } else {
            handle.x = width-30;
        }
    }

    Rectangle {
        x: 0
        y: 0
        width: 145
        height: 29
        color: "#00000000"
        radius: 8

        BorderImage {
            id: border_image1
            anchors.fill: parent
            border { left: 10; top: 10; right: 10; bottom: 10}
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "images/sliderLine.png"
        }
    }

    Image {
        id: handle; smooth: true
        x: 55
        y: 5
        width: 20;
        height: 20;
        source: "images/sliderHandle.png"
        MouseArea {
            id: mouse
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent;
            drag.target: parent
            drag.axis: Drag.XAxis;
            drag.minimumX: 0;
            drag.maximumX: slider.xMax
            onPositionChanged: { value = (maximum - minimum) * (handle.x) / slider.xMax + minimum;}
        }
        }


}
