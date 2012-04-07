// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: songItem
    property alias songName: songNameTxt.text
    property alias songColor: songNameTxt.color
    property alias songItalic: songNameTxt.font.italic
    property variant songImage
    property variant songGenre
    property variant songFile: song_file
    property alias state: songItem.state
    signal songClicked()
    height: 50
    width: 275

    state:"itunes"

    Image {
        id: image1
        x: 7
        y: 5
        width: 40
        height: 40
        source:songImage
    }

    Text {
        id: songNameTxt
        x: 71
        y: 5
        height: 40
        color: "#ffffff"
        text: ""
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
                target: songNameTxt
                x: 68
                y: 5
            }

        },
        State {
            name: "radio"

            PropertyChanges {
                target: songDescription
                x: 73
                y: 13
                text:song_genre
            }

            PropertyChanges {
                target: songNameTxt
                x: 73
                y: -5
            }
        }
    ]
}
