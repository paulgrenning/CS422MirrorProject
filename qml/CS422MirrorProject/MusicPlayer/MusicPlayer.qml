import QtQuick 1.0
import Qt 4.7
import QtMultimediaKit 1.1

//code used as reference: http://doc.qt.nokia.com/4.7-snapshot/demos-declarative-flickr-common-slider-qml.html
//modifications made to make it a vertical slider and used our own images


Item {
    id:music
    width:310
    height:496

    state: "itunes"

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


        VolumeSliderVertical {
            id: volumeslider
            x: 262
            y: 48
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
                songlist.model.reload()
                songlist.currentIndex = 0
            }
        }


        Image {
            id: image2
            x: 258
            y: 134
            width: 38
            height: 35
            source: (volumeslider.value >0.9)? "images/volumeMin.png":"images/volumeMax.png"
        }


    }

    Image {
        id: playimage
        x: 132
        y: 55
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
            }
        }
    }




   Audio {
        id: playMusic
        source: "music/ABandaMaisBonitaDaCidade/11-11 Oração.mp3"
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
        highlight: Rectangle { color: "white"; opacity:0.3; radius:10 }
        highlightFollowsCurrentItem: true
        onCurrentIndexChanged:{
            if(currentItem==null){
                currentIndex=0
            }
            else{
                currentSongPlaying.text = currentItem.currName + " - " + currentItem.currGenre
            }

            //console.log("new index"+songlist.currentIndex + currentItem.currName)
        }
        delegate:

            SongDelegate{
                id: songItem
            property variant currName: songName
            property variant currImage: songImage
            property variant currFile: songFile
            property variant currGenre: songGenre

            songName:song_name
            songFile:song_file
            songGenre: song_genre
            songImage: {if (songlist.model === somalibrarymodel)  return song_image;
                else return "music/"+ song_artist + "/" + song_artist+".jpg"}

            state: {
                if(songlist.model=== somalibrarymodel) return "radio"
                else return "itunes"
            }
            onSongClicked:{
                playMusic.stop()
                playMusic.source = song_file
                playMusic.play()
                songlist.currentIndex = songlist.indexAt(x,y)
                currentSongPlaying.x = 50
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 60
        y: 110
        width: 188
        height: 44
        color: "#00000000"
        radius: 10
        clip: true

        Text {
            id: currentSongPlaying
            y: 14
            height: 24
            color: "#ffffff"
            text: ""
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20
            font.italic: true
            Timer{ interval: 50
                   running:true;
                   repeat: true;
                   onTriggered:{
                       if(currentSongPlaying.x < -currentSongPlaying.width){
                           currentSongPlaying.x = 188
                       }
                       else{
                            currentSongPlaying.x=currentSongPlaying.x-2;
                       }
                     }
            }
        }
    }

}
