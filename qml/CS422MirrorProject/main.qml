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
import QtMultimediaKit 1.1

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

    MouseArea{
        z:-5
        anchors.fill: parent
        onClicked: {
            if(musicwidget.isVisible) musicwidget.isVisible = false
            if(healthwidget.isVisible) healthwidget.isVisible = false
            if(socialwidget.isVisible) socialwidget.isVisible = false
            if(newswidget.isVisible) newswidget.isVisible = false
            configsettings.configButtonState = "closed"
            configsettings.lightButtonState = "closed"
            configsettings.opacityButtonState = "closed"
        }
     }

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
            x: 150 - dateWidget.width / 2 // so it stays centered at default position when you change language
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
            removeAccount: 1
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
            onHelpclicked: {
                helpscreen.visible = !helpscreen.visible
                if(videoPlayer.playing) videoPlayer.stop()
            }
            onAboutclicked: {
               aboutscreen.visible = !aboutscreen.visible
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
                 y: 85
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

    TextConfirmView {
        id: mainTextConfirmView
        property real returnWidget;
        onInputConfirmed: {

            hideableWidgets.opacity = 1
            if(returnWidget == 0){
                if(mainTextConfirmView.finalInput != ""){
                    socialwidget.newName = mainTextConfirmView.finalInput
                }
            } else if(returnWidget == 1){
                if(mainTextConfirmView.finalInput != "") {
                    emailWidget.newName = mainTextConfirmView.finalInput
                }
            }
        }

    }

    EmailViewer {
        id: emailViewer
        x: 280
        y: 250
        opacity: 0
    }

    RemoveMainAccount {
        id: removeMainAccount
        x: 280
        y: 250
        opacity: 0
        onClosing: {
            configsettings.removeAccount *= removeMainAccount.removeAccount
        }
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

    Item{
        id:helpscreen
        anchors.fill: parent

        visible:false

        StdText {
            id: stdtext5
            x: 310
            y: 211
            width: 496
            height: 45
            text: {
                if (appVar.currentLanguage ==="Español") {
                    return "<p>El siguiente video le ayudará a familiarizarse con la interfase de 'THE LOOKING GLASS'</p>"
                }

                else{
                    return "<p>The following video will help you familiarize with 'THE LOOKING GLASS' interface</p>"
                }
            }
            z: 2
            font.bold: false
            font.pointSize: 20
        }

        Rectangle{
            anchors.fill: parent
            color:"#000"
            z: -1
            opacity: 0.5

            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if(helpscreen.visible){
                        videoPlayer.position = 1
                        videoPlayer.stop()

                    }
                    helpscreen.visible=!helpscreen.visible
                }
            }
        }

        Rectangle {
            id: recthelp
            x: 232
            y: 140
            width: 900
            height: 500
            color: "#525454"
            radius: 20
            z: 1
            opacity: 0.750

            StdText {
                id: helptext
                x: 53
                y: 29
                text: (appVar.currentLanguage ==="Español") ? "Ayuda" : "Help"
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
                font.bold: true
            }

            Flickable {
                id: flickable1
                interactive: false
                anchors.fill: parent

                Video{
                     id:videoPlayer
                     x: 250
                     y: 98
                     width: 400
                     height: 350
                     source: "HelpVideo.mov"
                     focus: true
                     MouseArea{
                         anchors.fill: parent
                         onClicked: {
                             if(!videoPlayer.playing)videoPlayer.play()
                             else if(videoPlayer.paused)videoPlayer.play()
                             else if(videoPlayer.playing) videoPlayer.pause()
                         }
                     }
                 }
                Image {
                    id: playvideo
                    x: 428
                    y: 248
                    source: "./MusicPlayer/images/playbutton.png"
                    visible: (!videoPlayer.playing || videoPlayer.paused) ? true : false
                }
            }
        }
    }

    Item{
        id:aboutscreen
        anchors.fill: parent

        visible:false

        Rectangle{
            anchors.fill: parent
            color:"#000"
            z: -1
            opacity: 0.5

            MouseArea{
                anchors.fill:parent
                onClicked: aboutscreen.visible=!aboutscreen.visible
            }
        }
        Rectangle {
            id: rectabout
            x: 232
            y: 140
            width: 900
            height: 500
            color: "#525454"
            radius: 20
            z: 1
            opacity: 0.750

            StdText {
                id: abouttext
                x: 53
                y: 29
                text: (appVar.currentLanguage ==="Español") ? "Acerca De" : "About"
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
                font.bold: true
            }

            Flickable {
                id: flickable3
                x: 0
                y: 0
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                interactive: false
                anchors.fill: parent

                Flickable {
                    id: flickable4
                    x: 150
                    y: 94
                    width: 600
                    height: 350
                    boundsBehavior: Flickable.DragOverBounds
                    flickableDirection: Flickable.AutoFlickDirection
                    clip: true

                    contentHeight: aboutcontent.height
                    contentWidth: aboutcontent.width

                    Item{
                        id:aboutcontent
                        height:600
                        width:600


                        StdText {
                            id: stdtext
                            x: 0
                            y: 0
                            width: 293
                            height: 89
                            text:{
                                return "<p>THE LOOKING GLASS</p>"
                                +"<p>Version 1.0</p>"
                                        }
                            font.pointSize: 28
                        }
                        StdText {
                            id: stdtext2
                            x: 0
                            y: 112
                            width: 283
                            height: 146
                            text:{
                                if (appVar.currentLanguage ==="Español") {
                                    return "<p>Diseñado e Implementado por:<ul><li> Ty Cobb</li>"
                                    +"<li> Ronald Garay</li>"
                                    +"<li> Paul Grenning</li>"
                                    +"<li> Paulo Guerra</li></ul></p>"
                                }

                                else{
                                    return "<p>Designed and Implemented by:<ul><li> Ty Cobb</li>"
                                    +"<li> Ronald Garay</li>"
                                    +"<li> Paul Grenning</li>"
                                    +"<li> Paulo Guerra</li></ul></p>"
                                }
                            }
                            font.pointSize: 20
                            font.bold: false
                        }

                        StdText {
                            id: stdtext3
                            x: 0
                            y: 272
                            width: 600
                            height: 138
                            text: {
                                    if (appVar.currentLanguage ==="Español") {
                                        return "<p>Referencia<ul><li> Ejemplo Qt+OpenCv <br> http://gitorious.org/qtopencv</li>"
                                        +"<li>Archivo de iconos de Clima para Android<br> http://fc01.deviantart.net/fs70/f/2010/270/9/1/android__weather_icons_by_bharathp666-d2zlfrd.zip</li>"
                                        +"</ul></p>"
                                    }
                                    else{
                                        return "<p>Reference<ul><li> Qt+OpenCv example<br> http://gitorious.org/qtopencv</li>"
                                        +"<li> Android Weather Icons PSD File <br> http://fc01.deviantart.net/fs70/f/2010/270/9/1/android__weather_icons_by_bharathp666-d2zlfrd.zip</li>"
                                        +"</ul></p>"
                                    }
                                }
                                wrapMode: Text.WrapAnywhere
                            font.pointSize: 20
                        }
                    }
                }
            }
        }

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
