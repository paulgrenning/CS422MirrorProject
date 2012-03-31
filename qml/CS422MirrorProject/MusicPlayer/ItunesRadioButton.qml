// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    width: 270
    height: 61

    signal itunesClicked()
    signal radioClicked()

    Image {
        id: image1
        x: 0
        y: 0
        width: 270
        height: 61
        source: "images/iTunesPressed.png"
    }

    MouseArea {
        id: iTunesMouseArea
        x: 6
        y: 8
        width: 129
        height: 43
        onClicked: {
            image1.source="images/iTunesPressed.png"
            itunesClicked()
        }
    }

    MouseArea {
        id: radioMouseArea
        x: 135
        y: 9
        width: 129
        height: 43
        onClicked: {
            image1.source="images/radioPressed.png"
            radioClicked()
        }
    }

}
