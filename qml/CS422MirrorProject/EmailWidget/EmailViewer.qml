// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Item {

    id: anEmailView
    width: 742
    height: 357
    property string emailFrom: ""
    property string emailTime: ""
    property string emailSubject: ""
    property string emailBody: ""

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Image {
        anchors.fill: parent
        source: "../IntroFlow/images/confirmBackground.png"
    }

    StdText {
        id: from
        anchors {
            top: anEmailView.top
            topMargin: 30
            left: anEmailView.left
            leftMargin: 80
        }
        state: "orange"
        font.pointSize: 26

        text: "From: " + emailFrom
    }

    StdText {
        id: time

        anchors {
            top: anEmailView.top
            topMargin: 30
            right: anEmailView.right
            rightMargin: 60
        }
        state: "blue"

        font.pointSize: 26

        text: emailTime
    }


    StdText {
        id: subject

        anchors {
            top: from.bottom
            topMargin: 20
            left: anEmailView.left
            leftMargin: 80
        }
        state: "default"
        font.pointSize: 22

        text: "Subject: " + emailSubject
    }


    StdText {
        id: body
        width:602
        anchors {
            top: subject.bottom
            topMargin: 20
            left: anEmailView.left
            leftMargin: 80
        }
        state: "white"
        font.pointSize: 20

        wrapMode: Text.WordWrap
        text: emailBody
    }

    LabeledButton {
        anchors {
            bottom: anEmailView.bottom
            bottomMargin: 30
            right: anEmailView.right
            rightMargin: 20
        }
        width: 200
        height: 70

        defaultPath: "../IntroFlow/images/confirmButtonUP.png"
        clickedPath: "../IntroFlow/images/confirmButtonDN.png"
        label: "Close"
        textSize: 26

        onButtonClicked:  {
            emailViewer.opacity = 0
            hideableWidgets.opacity = 1
        }
    }

}
