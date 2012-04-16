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
import "./Keyboard"
import "./EmailWidget"
//import opencvqml 1.0

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

//        MouseArea{
//            z:-5
//            anchors.fill: parent
//            onClicked: {
//                if(musicwidget.isVisible) musicwidget.isVisible = false
//                if(healthwidget.isVisible) healthwidget.isVisible = false
//                if(socialwidget.isVisible) socialwidget.isVisible = false
//                if(newswidget.isVisible) newswidget.isVisible = false
//                configsettings.configButtonState = "closed"
//                configsettings.lightButtonState = "closed"
//                configsettings.opacityButtonState = "closed"
//            }
//        }



//    CameraOpenCv{
//        id:cambackground
//        x:0
//        y:0
//        z:-2
//    }

    // create object to hold all important variables for the application
    AppVariables {
        id: appVar
    }


    // set the appVar to false if you don't want to see the intro flow

    IntroFlow {
        id: introFlow
        onIntroFlowFinished: hideableWidgets.opacity = 1
    }



    Item {
        id: topWidgets

//        Behavior on opacity {
//            NumberAnimation { duration: 200 }
//        }

        DateWidget {
            id: dateWidget
            x: 40
            y: 2
            isVisible: true
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

//        Behavior on opacity {
//            NumberAnimation { duration: 200 }
//        }

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
//                if(musicwidget.opacity == 0) musicwidget.opacity = 0;
//                else {musicwidget.opacity = displayOpacity;}
                topWidgets.opacity = displayOpacity
                nonConfigWidgets.opacity = displayOpacity
                //console.log(displayOpacity)
            }
        }

        Item {
            id: nonConfigWidgets
           // Behavior on opacity {
           //     NumberAnimation { duration: 200 }
           // }

            CalendarWidget {
                 id: calendarWidget
                 x: 4
                 y: dateWidget.height + dateWidget.y + 20
                 isVisible: true
            }

            MusicPlayer{
                id: musicwidget
                x: rootElement.width - musicwidget.width
                y: rootElement.height - musicwidget.height - widgetbar.height
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

            EmailWidget {
                id: emailWidget
                x: rootElement.width - emailWidget.width
                y: rootElement.height - emailWidget.height - widgetbar.height
                width: 310
                height: 496
                opacity: 0
            }

        News {
            id: newswidget
            x: rootElement.width - newswidget.width
            y: rootElement.height - newswidget.height - widgetbar.height
            opacity:0
        }

        WidgetBar {
            id: widgetbar
            x: rootElement.width - widgetbar.width
            y: rootElement.height - widgetbar.height
            width: 615
            height: 120
            onMusicClicked: {
                if(musicwidget.isVisible) {
                    musicwidget.isVisible=false
                }
                else{
                    musicwidget.isVisible=true
                }
                healthwidget.isVisible = false
                socialwidget.isVisible = false
                newswidget.isVisible = false
                emailWidget.isVisible = false
            }
            onHealthClicked:{
                healthwidget.barstate = healthwidget.laststate
                if(healthwidget.isVisible) {
                    healthwidget.isVisible=false
                }
                else{
                    healthwidget.isVisible=true
                }
                musicwidget.isVisible = false
                socialwidget.isVisible = false
                newswidget.isVisible = false
                emailWidget.isVisible = false
            }
            onSocialClicked:{

                if(socialwidget.isVisible) {
                    socialwidget.isVisible=false
                }
                else{
                   socialwidget.isVisible=true
                }
                musicwidget.isVisible = false
                healthwidget.isVisible = false
                newswidget.isVisible = false
                emailWidget.isVisible = false
            }
            onNewsClicked: {

                if(newswidget.isVisible) {
                    newswidget.isVisible=false
                }
                else{
                    newswidget.isVisible=true
                }
                musicwidget.isVisible = false
                socialwidget.isVisible = false
                healthwidget.isVisible = false
                emailWidget.isVisible = false
            }
            onEmailClicked: {

                if(emailWidget.isVisible) {
                    emailWidget.isVisible=false
                }
                else{
                    emailWidget.isVisible=true

                }
                musicwidget.isVisible = false
                socialwidget.isVisible = false
                healthwidget.isVisible = false
                newswidget.isVisible = false
                console.log(displayOpacity)
                console.log(emailWidget.opacity)
            }
          }
       }
    }

    TextView {
        id: mainInputField
        x: 100
        y: 200
        opacity: 0

        property real returnWidget;

        onInputReady: {
            if(returnWidget == 0){
                socialwidget.newName = input
            } else if(returnWidget == 1){
                emailWidget.newName = input
            }
            hideableWidgets.opacity = 1
            keyboardFade.start()
        }

    }

    EmailViewer {
        id: emailViewer
        x: 280
        y: 250
        opacity: 0
    }

    RemoveEmailAccount {
        id: removeEmailAccount
        x: 280
        y: 250
        opacity: 0
        onClosing: {
            emailWidget.removeAccount *= removeEmailAccount.removeAccount
        }
    }

    RemoveAccountNotice {
        id: removeSocialAccount
        x: 280
        y: 250
        opacity: 0
        onClosing: {
            socialwidget.removeAccount *= removeSocialAccount.removeAccount
        }
    }

    BorderImage {
        id: lightSourceBorder
        source: "ConfigSettings/images/lightSourceBorderImage.png"
        anchors.fill: parent
        border.left: 50; border.top: 40
        border.right: 50; border.bottom: 40
        opacity: 1.0 - configsettings.lightOpacity

    }

    PropertyAnimation {id:keyboardFade; target: mainInputField; property: "opacity"; to: (mainInputField.opacity == 0) ? 1 : 0; duration: 500}

//    PropertyAnimation {id:healthanimopen; target: healthwidget; property: "opacity"; to: (healthwidget.opacity == 0) ? displayOpacity : 0; duration: 500 }
//    PropertyAnimation {id:socialanimopen; target: socialwidget; property: "opacity"; to: (socialwidget.opacity == 0) ? displayOpacity : 0; duration: 500 }
//    PropertyAnimation {id:newsanimopen; target: newswidget; property: "opacity"; to: (newswidget.opacity == 0) ? displayOpacity : 0; duration: 500 }

//    PropertyAnimation {id:musicanimclose; target: musicwidget; property: "opacity"; to: 0; duration: 500}
//    PropertyAnimation {id:healthanimclose; target: healthwidget; property: "opacity"; to: 0; duration: 500 }
//    PropertyAnimation {id:socialanimclose; target: socialwidget; property: "opacity"; to: 0; duration: 500 }
//    PropertyAnimation {id:newsanimclose; target: newswidget; property: "opacity"; to: 0; duration: 500 }
}
