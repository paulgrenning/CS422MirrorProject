import QtQuick 1.1

Item {
    id: slider; width: 8; height: 90
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
            x: 0
            y: -15
            width: 27
            height: slider.height + 30
            border { left: 1; top: 1; right: 1; bottom: 1}
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "images/volumeSlider.png"
        }
    }

    Rectangle {
        id: handle; smooth: true
        x: -6
        y: 0
        width: slider.width+12;
        height: 20;
        radius: 20
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightgray" }
            GradientStop { position: 1.0; color: "gray" }
        }

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
