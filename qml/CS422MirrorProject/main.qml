// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "./Clock"
import "./WeatherWidget"
import "./WidgetBar"
import "./MusicPlayer"
import "./HealthWidget"
import "./SocialWidget"
import "./ConfigSettings"
import "./AppVariables"

Rectangle {
    width: 1280
    height: 960
    color: "#dbdada"
    id: rootElement

    property real displayOpacity : 1.0-configsettings.generalOpacity

    //create object to hold all important variables for the application
    AppVariables{
        id: appVar
    }

    ConfigSettings {
        id: configsettings
        x: 28
        y: 444
        width: 461
        height: 300
        onGeneralOpacityChanged: {
            weatherwidget.opacity = displayOpacity
            clockWidget.opacity = displayOpacity
            widgetbar.opacity = displayOpacity
            if(healthwidget.opacity == 0) healthwidget.opacity = 0;
            else {healthwidget.opacity = displayOpacity;}
            if(socialwidget.opacity == 0) socialwidget.opacity = 0;
            else {socialwidget.opacity = displayOpacity;}
            if(musicplayer.opacity == 0) musicplayer.opacity = 0;
            else {musicplayer.opacity = displayOpacity;}
        }
    }

    WeatherWidget{
        id: weatherwidget
        x: 954
        y: 5
        width: 324
        height: 125

    }

    Clock {
        id: clockWidget
        x: 540
        y: 21
        width: 200
        height: 50
    }
    WidgetBar{
        id: widgetbar
        x: 690
        y: 656
        width: 615
        height: 120
        onMusicClicked: {
            musicanimopen.start()
            healthanimclose.start()
            socialanimclose.start()
        }
        onHealthClicked:{
            musicanimclose.start()
            healthanimopen.start()
            socialanimclose.start()
        }
        onSocialClicked:{
            musicanimclose.start()
            healthanimclose.start()
            socialanimopen.start()
        }
    }

    MusicPlayer{
        id: musicplayer
        x: 964
        y: 160
        width: 310
        height: 496
        opacity: 0
    }

    HealthWidget{
        id: healthwidget
        x: 725
        y: 280
        width: 554
        height: 375
        opacity: 0
    }

    SocialWidget{
        id: socialwidget
        x: 964
        y: 160
        width: 310
        height: 496
        opacity: 0
    }
    PropertyAnimation {id:musicanimopen; target: musicplayer; property: "opacity"; to: (musicplayer.opacity == 0) ? displayOpacity : 0; duration: 500}
    PropertyAnimation {id:healthanimopen; target: healthwidget; property: "opacity"; to: (healthwidget.opacity == 0) ? displayOpacity : 0; duration: 500 }
    PropertyAnimation {id:socialanimopen; target: socialwidget; property: "opacity"; to: (socialwidget.opacity == 0) ? displayOpacity : 0; duration: 500 }

    PropertyAnimation {id:musicanimclose; target: musicplayer; property: "opacity"; to: 0; duration: 500}
    PropertyAnimation {id:healthanimclose; target: healthwidget; property: "opacity"; to: 0; duration: 500 }
    PropertyAnimation {id:socialanimclose; target: socialwidget; property: "opacity"; to: 0; duration: 500 }

}
