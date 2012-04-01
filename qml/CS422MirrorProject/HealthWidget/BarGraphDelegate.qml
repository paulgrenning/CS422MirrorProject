// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: barGraphDelegate

    BorderImage {
        id:barimage
        Component.onCompleted: animation.start()
        transformOrigin: Item.Bottom
        scale: 0
        x: 0
        width: 30
        height: (bar_height > 100) ? bar_height/4 : 50
        y:(bar_height > 100) ? 126-bar_height/4 : 126-50
        border { left: 15; top: 20; right: 15; bottom: 20}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "images/graphBarBorderImage.png"
        PropertyAnimation {id: animation; target: barimage; property: "scale"; from: 0; to: 1; duration: 1200}
    }


}
