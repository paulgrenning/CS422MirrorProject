import Qt 4.7
Item {
    id: widgetBarItem
    width:615
    height:120
    state: "open"
    signal musicClicked();
    signal healthClicked();
    signal socialClicked();

    clip: true

    BorderImage {
        id: widget_locker
        x: 44
        y: 1
        height: 119
        border { left: 50; top: 50; right: 50; bottom: 50}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "images/widget_locker_background.png"

        Image {
            id: arrowImage
            y: 8
            width: 43
            height: 105
            anchors.left: parent.left
            anchors.leftMargin: -45
            anchors.verticalCenter: parent.verticalCenter
            source: "images/arrow_closed.png"
            MouseArea {
                id: arrowWidget
                z: 1
                anchors.fill: parent
                onClicked:{
                    if(widgetBarItem.state ===  "open") widgetBarItem.state = "closed"
                    else widgetBarItem.state = "open"
                }
            }

            MouseArea {
                id: dragWidgetBarMouseArea
                x: 0
                y: -7
                width: 214
                height: 120
                drag.target: widgetBarItem
                drag.axis: Drag.XandYAxis
                drag.minimumX: 0
                drag.maximumX: rootElement.width - widgetbar.width
                drag.minimumY: 0
                drag.maximumY: rootElement.height - parent.height
        }
        }
    }


//    Image {
//        id: widget_locker
//        state: "open"
//        source: "images/widget_locker_background.png"
//        x: 47
//        y: 3
//        anchors.verticalCenterOffset: 0
//        anchors.verticalCenter: parent.verticalCenter
//        opacity: 1
//    }

    Image {
        id: healthIcon
        x: 217
        y: 20
        width: 75
        height: 80
        source: (appVar.currentLanguage == "Español") ? "images/healthIconSP.png" : "images/healthIcon.png"

        MouseArea {
            id: healthMouseArea
            anchors.fill: parent
            onClicked: healthClicked();
        }
    }

    Image {
        id: newsIcon
        x: 292
        y: 20
        width: 75
        height: 80
        MouseArea {
            id: newsMouseArea
            anchors.fill: parent
        }
        source:  (appVar.currentLanguage == "Español") ? "images/newsIconSP.png" : "images/newsIcon.png"
    }

    Image {
        id: emailIcon
        x: 442
        y: 20
        width: 75
        height: 80
        MouseArea {
            id: emailMouseArea
            anchors.fill: parent
        }
        source: (appVar.currentLanguage == "Español") ? "images/emailIconSP.png" : "images/emailIcon.png"
    }

    Image {
        id: socialIcon
        x: 367
        y: 20
        width: 75
        height: 80
        source: (appVar.currentLanguage == "Español") ? "images/socialIconSP.png" : "images/socialIconSP.png"

        MouseArea {
            id: socialMouseArea
            anchors.fill: parent
            onClicked: socialClicked();
        }
    }

    Image {
        id: musicIcon
        x: 517
        y: 20
        width: 75
        height: 80
        source: (appVar.currentLanguage == "Español") ? "images/musicIconSP.png" : "images/musicIcon.png"

        MouseArea {
            id: musicMouseArea
            anchors.fill: parent
            onClicked: musicClicked();
        }
    }

    Image {
        id: widgetTextImage
        x: 61
        y: 37
        width: 142
        height: 47
        source: "images/text_widgets.png"
    }
    states: [
        State {
            name: "closed"
            PropertyChanges {
                target: arrowImage
                source: "images/arrow_closed.png"
            }

            PropertyChanges {
                target: widget_locker
                x: 437
                y: 1
                width: 183
            }

            PropertyChanges {
                target: healthIcon
                x: 608
                y: 20
                opacity: 0
            }

            PropertyChanges {
                target: newsIcon
                x: 683
                y: 20
                opacity: 0
            }

            PropertyChanges {
                target: emailIcon
                x: 833
                y: 20
                opacity: 0
            }

            PropertyChanges {
                target: socialIcon
                x: 758
                y: 20
                opacity: 0
            }

            PropertyChanges {
                target: musicIcon
                x: 908
                y: 20
                opacity: 0
            }

            PropertyChanges {
                target: widgetTextImage
                x: 452
                y: 37
            }

            PropertyChanges {
                target: dragWidgetBarMouseArea
                y: -7
                anchors.topMargin: -7
                anchors.rightMargin: -573
                anchors.bottomMargin: -7
                anchors.leftMargin: 402
            }
        },
        State {
            name: "open"
            PropertyChanges {
                target: arrowImage
                source: "images/arrow_open.png"
            }
        }

    ]
    transitions: [
        Transition{
            from: "open"; to: "closed"
            NumberAnimation { target: arrowImage; properties: "source"; easing.type: Easing.Linear; duration: 1}
                NumberAnimation { targets: [widget_locker, widgetTextImage]; properties: "width, x"; easing.type: Easing.InCubic; duration: 800}
            NumberAnimation { targets: [healthIcon,musicIcon,socialIcon,emailIcon,newsIcon]; properties: "opacity,x"; easing.type: Easing.InCubic; duration: 800}



        },
        Transition{
            from: "closed"; to: "open"
            NumberAnimation { target: arrowImage; properties: "source"; easing.type: Easing.Linear; duration: 1}
            NumberAnimation { targets: [widget_locker, widgetTextImage]; properties: "width, x"; easing.type: Easing.InCubic; duration: 800}
            NumberAnimation { targets: [healthIcon,musicIcon,socialIcon,emailIcon,newsIcon]; properties: "opacity,x"; easing.type: Easing.InCubic; duration: 800}
        }
    ]
}
