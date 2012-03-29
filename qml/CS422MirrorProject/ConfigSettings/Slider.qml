import QtQuick 1.1

Item {
    id: slider; width: 29; height: 140
    // value is read/write.
    property real value: 0.5
    property real maximum: 1
    property real minimum: 1
    property int yMax: height - 15
    onValueChanged: updatePos();
    onYMaxChanged: updatePos();
    onMinimumChanged: updatePos();

    function updatePos() {
        if (maximum > minimum) {
            var pos =  (value - minimum) * slider.yMax / (maximum - minimum);
            pos = Math.min(pos, height - handle.height);
            pos = Math.max(pos, 2);
            handle.y =  pos;

        } else {
            handle.y = height-30;
        }
    }

    Rectangle {
        x: -9
        y: 4
        width: 27
        height: 96
        color: "#00000000"
        radius: 8

        BorderImage {
            id: border_image1
            x: 10
            y: -12
            width: 29
            height: slider.height+20
            border { left: 10; top: 10; right: 10; bottom: 10}
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "images/sliderLine.png"
        }
    }

    Image {
        id: handle; smooth: true
        x: 5
        y: 35
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
            drag.axis: Drag.YAxis;
            drag.minimumY: 0;
            drag.maximumY: slider.yMax
            onPositionChanged: { value = (maximum - minimum) * (handle.y) / slider.yMax + minimum;}
        }
        }


}
