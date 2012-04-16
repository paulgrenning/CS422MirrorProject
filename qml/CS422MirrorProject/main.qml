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

    Item {
        id: topWidgets

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        DateWidget {
            id: dateWidget
            x: 40
            y: 2
        }

        Clock {
            id: clockWidget
            x: rootElement.width / 2 - clockWidget.width / 2
            y: -7
        }

        WeatherWidget {
            id: weatherwidget
            x: rootElement.width - weatherwidget.width - 5
            y: 4
        }

    }

    Item {
        id: hideableWidgets

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        ConfigSettings {
            id: configsettings
            x: 4
            y: rootElement.height - configsettings.height - 5
            width: 461
            height: 300
            onGeneralOpacityChanged: {
//                weatherwidget.opacity = displayOpacity
//                clockWidget.opacity = displayOpacity
//                widgetbar.opacity = displayOpacity
//                if(healthwidget.opacity == 0) healthwidget.opacity = 0;
//                else {healthwidget.opacity = displayOpacity;}
//                if(socialwidget.opacity == 0) socialwidget.opacity = 0;
//                else {socialwidget.opacity = displayOpacity;}
//                if(musicplayer.opacity == 0) musicplayer.opacity = 0;
//                else {musicplayer.opacity = displayOpacity;}
                topWidgets.opacity = displayOpacity
                nonConfigWidgets.opacity = displayOpacity
            }
        }

        Item {
            id: nonConfigWidgets

            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }

            CalendarWidget {
                 id: calendarWidget
                 x: 4
                 y: dateWidget.height + dateWidget.y + 20
            }

            MusicPlayer{
                id: musicplayer
                x: rootElement.width - musicplayer.width
                y: rootElement.height - musicplayer.height - widgetbar.height
                width: 310
                height: 496
                opacity: 0
            }

            HealthWidget{
                id: healthwidget
                x: rootElement.width - healthwidget.width
                y: rootElement.height - healthwidget.height - widgetbar.height
                width: 554
                height: 375
                opacity: 0
            }

            SocialWidget{
                id: socialwidget
                x: rootElement.width - socialwidget.width
                y: rootElement.height - socialwidget.height - widgetbar.height
                width: 310
                height: 496
                opacity: 0
            }

            News {
                id: newswidget
                x: rootElement.width - newswidget.width
                y: rootElement.height - newswidget.height - widgetbar.height
                opacity: 0
            }

            WidgetBar {
                id: widgetbar
                x: rootElement.width - widgetbar.width
                y: rootElement.height - widgetbar.height
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
