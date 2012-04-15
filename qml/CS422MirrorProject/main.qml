// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "./Clock"
import "./WeatherWidget"
import "./WidgetBar"
import "./MusicPlayer"
import "./HealthWidget"
import "./SocialWidget"
import "./DateWidget"
import "./CalendarWidget"
import "./ConfigSettings"
import "./AppVariables"
import "./UtilityElements"
import "./IntroFlow"
import "./Keyboard"
import "./News"
//import opencvqml 1.0
//import opencvqml 1.0
import "./Keyboard"
import "./News"

Rectangle {
    width: 1280
    height: 960
    color: "#00000000"
    id: rootElement

    property real displayOpacity : 1.0-configsettings.generalOpacity

    Component.onCompleted: handleNewUser();

    function handleNewUser() {
        if(appVar.renderIntroFlow) {
            introFlow.start();
            hideableWidgets.opacity = 0
        }
    }

//    CameraOpenCv{
//        id:cambackground
//        x:0
//        y:0
//        z:-1
//    }

    // create object to hold all important variables for the application
    AppVariables {
        id: appVar
    }

    IntroFlow {
        id: introFlow
        onIntroFlowFinished: hideableWidgets.opacity = 1
    }

    DateWidget {
        id: dateWidget
        x: 10
        y: 0
    }

    Clock {
        id: clockWidget
        x: 540
        y: 21
        width: 200
        height: 50
    }

    WeatherWidget {
        id: weatherwidget
        x: 954
        y: 5
        width: 324
        height: 125
    }

    Item {
        id: hideableWidgets

        Behavior on opacity {
            NumberAnimation { duration: 200 }
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

        CalendarWidget {
             id: calendarWidget
             x: 0
             y: dateWidget.height
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

        News {
            id: newswidget
            x: 964
            y: 153
            opacity: 0
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
                newsanimclose.start()
            }
            onHealthClicked:{
                musicanimclose.start()
                healthanimopen.start()
                socialanimclose.start()
                healthwidget.barstate = healthwidget.laststate
                newsanimclose.start()
            }
            onSocialClicked:{
                musicanimclose.start()
                healthanimclose.start()
                socialanimopen.start()
                newsanimclose.start()
            }
            onNewsClicked: {
                musicanimclose.start()
                healthanimclose.start()
                socialanimclose.start()
                newsanimopen.start()
            }
        }
    }

    TextView {
        id: mainInputField
        x: 100
        y: 200
        opacity: 0

        property QtObject returnWidget;
        property QtObject runAnimation;

        onInputReady: {
            console.log("Input: " + input)
            hideableWidgets.opacity = 1
            keyboardFade.start()
        }

    }


    Image {
        id: lightSource
        x: 90
        y: 200
        source: "ConfigSettings/images/lightSource.png"
        opacity: 1.0 - configsettings.lightOpacity
    }

    PropertyAnimation {id:keyboardFade; target: mainInputField; property: "opacity"; to: (mainInputField.opacity == 0) ? 1 : 0; duration: 500}

    PropertyAnimation {id:musicanimopen; target: musicplayer; property: "opacity"; to: (musicplayer.opacity == 0) ? displayOpacity : 0; duration: 500}
    PropertyAnimation {id:healthanimopen; target: healthwidget; property: "opacity"; to: (healthwidget.opacity == 0) ? displayOpacity : 0; duration: 500 }
    PropertyAnimation {id:socialanimopen; target: socialwidget; property: "opacity"; to: (socialwidget.opacity == 0) ? displayOpacity : 0; duration: 500 }
    PropertyAnimation {id:newsanimopen; target: newswidget; property: "opacity"; to: (newswidget.opacity == 0) ? displayOpacity : 0; duration: 500 }

    PropertyAnimation {id:musicanimclose; target: musicplayer; property: "opacity"; to: 0; duration: 500}
    PropertyAnimation {id:healthanimclose; target: healthwidget; property: "opacity"; to: 0; duration: 500 }
    PropertyAnimation {id:socialanimclose; target: socialwidget; property: "opacity"; to: 0; duration: 500 }
    PropertyAnimation {id:newsanimclose; target: newswidget; property: "opacity"; to: 0; duration: 500 }
}
