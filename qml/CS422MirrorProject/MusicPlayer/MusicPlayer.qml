import QtQuick 1.0
import Qt 4.7
//import QtMultimediaKit 1.1


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
        source: "images/musicwidgetbackground.png"

        Image {
            id: image1
            x: 120
            y: 11
            width: 71
            height: 30
            source: "images/musicTitleEN.png"
        }

        VolumeSlider {
            id: volumeslider
            x: 275
            y: 71
            maximum: 1.0
            minimum: 0.0
            onValueChanged: {
                playMusic.volume = 1-volumeslider.value;
            }
        }
    }

    Image {
        id: playimage
        x: 37
        y: 56
        width: 45
        height: 50
        source: (playMusic.playing) ? "images/pausebutton.png" : "images/playbutton.png"
    }

    MouseArea {
        id: playMouseArea
        x: 37
        y: 56
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

//    Audio {
//        id: playMusic
//        source: "http://somafm.com/secretagent.pls"
//    }
}
