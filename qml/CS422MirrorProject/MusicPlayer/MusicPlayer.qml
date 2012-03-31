import QtQuick 1.0
import Qt 4.7
//import QtMultimediaKit 1.1

//code used as reference: http://doc.qt.nokia.com/4.7-snapshot/demos-declarative-flickr-common-slider-qml.html
//modifications made to make it a vertical slider and used our own images


Item {
    id:music
    width:310
    height:496

    MouseArea {
         anchors.fill: parent
         drag.target: parent
         drag.axis: Drag.XandYAxis
         drag.minimumX: 0
         drag.maximumX: rootElement.width - parent.width
         drag.minimumY: 0
         drag.maximumY: rootElement.height - parent.height
    }

    Image {
        id: musicbackground
        anchors.fill: parent
        source: (appVar.currentLanguage == "Español") ? "images/musicwidgetbackgroundSP.png" : "images/musicwidgetbackground.png"

        Image {
            id: image1
            x: 120
            y: 11
            width: 71
            height: 30
            source: "images/musicTitleEN.png"
        }

        VolumeSliderVertical {
            id: volumeslider
            x: 252
            y: 50
            width: 29
            height: 90
            maximum: 1.0
            minimum: 0.0
            onValueChanged: {
                playMusic.volume = 1.0-volumeslider.value;
            }
        }

        ItunesRadioButton {
            id: itunesradiobutton1
            x: 21
            y: 158
            onItunesClicked: {
                songlist.model = ituneslibrarymodel
                songlist.currentIndex = 0
            }
            onRadioClicked: {
                songlist.model = somalibrarymodel
                songlist.currentIndex = 0
            }


        }

        Image {
            id: image2
            x: 248
            y: 136
            width: 38
            height: 35
            source: (volumeslider.value >0.9)? "images/volumeMin.png":"images/volumeMax.png"
        }
    }

    Image {
        id: playimage
        x: 59
        y: 64
        width: 45
        height: 50
        source: (playMusic.playing) ? "images/pausebutton.png" : "images/playbutton.png"

        MouseArea {
            id: playMouseArea
            x: 0
            y: 0
            width: 45
            height: 50
            onReleased: {
                if(playMusic.playing){
                    playMusic.stop();
                }
                else
                {
                    playMusic.play();
                    playMusic.volume = 1.0;
                }
                console.log(playMusic.status)
            }
        }
    }

//    Audio {
//        id: playMusic
//        source: "music/ABandaMaisBonitaDaCidade/11-11 Oração.mp3"
//    }

    ListView{
        id: songlist
        x: 18
        y: 228
        width: 275
        height: 250
        clip: true
        z: 1
        flickableDirection: Flickable.VerticalFlick
        model: ituneslibrarymodel
        currentIndex: 0
        highlight: Rectangle { color: "lightsteelblue"; radius:14 }
        highlightFollowsCurrentItem: true
        delegate: SongDelegate{
            id:songdelegate
            state: {
                if(songlist.model=== somalibrarymodel) return "radio"
                else return "itunes"
            }
            onSongClicked:{
                playMusic.stop()
                playMusic.source = songFile
                playMusic.play()
                songlist.currentIndex = songlist.indexAt(x,y)
            }
        }
    }

    XmlListModel {
        id: ituneslibrarymodel
        source: "iTunesMusicLibrary.xml"
        query: "/plist/dict/dict/dict"
        //XmlRole { name: "song_name"; query: "key[text()='Track ID']/following-sibling/string()"}
        XmlRole { name: "song_name"; query: "key[text()='Name']/following-sibling::string[1]/string()"}
        XmlRole { name: "song_genre"; query: "key[text()='Genre']/following-sibling::string[1]/string()"}
        XmlRole { name: "song_file"; query: "key[text()='Location']/following-sibling::string[1]/string()"}
        XmlRole { name: "song_artist"; query: "key[text()='Artist']/following-sibling::string[1]/string()"}

    }

    XmlListModel {
        id: somalibrarymodel
        source: "http://somafm.com/channels.xml"
        query: "/channels/channel"
        XmlRole { name: "song_name"; query: "@id/string()"}
        XmlRole { name: "song_genre"; query: "genre/string()"}
        XmlRole { name: "song_file"; query: "fastpls[@format='mp3']/string()"}
        XmlRole { name: "song_image"; query: "image/string()"}

    }
}
