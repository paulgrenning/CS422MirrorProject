// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: songDelegate

    property alias songName: songName.text
    property alias songColor: songName.color
    property alias songItalic: songName.font.italic
    property alias songImage: image1.source
    property variant songFile: song_file
    signal songClicked()
    height: 50
    width: 275

    state:"itunes"

    Image {
        id: image1
        width: 40
        height: 40
    }

    Text {
        id: songName
        x: 71
        y: 5
        height: 40
        color: "#ffffff"
        text: song_name
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
    }

    MouseArea {
        id: songMouseArea
        x: 0
        y: 0
        width: 275
        height: 50
        onClicked: songClicked()
    }

    Text {
        id: songDescription
        x: 181
        y: 5
        height: 40
        color: "#ffffff"
        text: ""
        font.italic: true
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
    }

    Image {
        id: image2
        x: 0
        y: 47
        width: 275
        height: 5
        source: "images/divider.png"
    }
    states: [
        State {
            name: "itunes"

            PropertyChanges {
                target: songDescription
                x: 178
                y: 5
                opacity: 0
            }

            PropertyChanges {
                target: songName
                x: 68
                y: 5
            }

            PropertyChanges {
                target: image1
                source: "music/"+ song_artist + "/" + song_artist+".jpg"
            }

        },
        State {
            name: "radio"

            PropertyChanges {
                target: image1
                source: song_image
            }

            PropertyChanges {
                target: songDescription
                x: 73
                y: 13
                text:song_genre
            }

            PropertyChanges {
                target: songName
                x: 73
                y: -5
            }
        }
    ]
}
