// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Item {
    id: removeNotice
    width: 742
    height: 357
    property string accountName: ""
    property real removeAccount: 1
    signal closing()
    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Image {
        anchors.fill: parent
        source: "../IntroFlow/images/confirmBackground.png"
    }

    StdText {
        id: notice
        width: parent.width - 80
        anchors {
            top: anEmailView.top
            topMargin: 30
            left: anEmailView.left
            leftMargin: 80
        }
        state: "orange"
        font.pointSize: 40

        wrapMode: Text.WordWrap
        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: TextInput.AlignHCenter
        text: "Are you sure you want to remove the account:"
    }

    StdText {
        width: parent.width
        anchors {
            top: notice.top
            topMargin: 130
            left: anEmailView.left
            leftMargin: 80
        }
        state: "blue"
        font.pointSize: 40

        wrapMode: Text.WordWrap
        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: TextInput.AlignHCenter
        text: accountName
    }

    LabeledButton {
        id: yesButton
        anchors {
            bottom: parent.bottom
            bottomMargin: 30
            left: parent.left
            leftMargin: 200
        }

        width: 147
        height: 102

        defaultPath: "../IntroFlow/images/confirmButtonUP.png"
        clickedPath: "../IntroFlow/images/confirmButtonDN.png"
        label: "yes"
        onButtonClicked: {
            removeNotice.removeAccount = -1
            removeNotice.closing()
            hideableWidgets.opacity = 1
            removeSocialAccount.opacity = 0
        }
    }

    LabeledButton {
        id: noButton
        anchors {
            bottom: parent.bottom
            bottomMargin: 30
            right: parent.right
            rightMargin: 200
        }
        width: 147
        height: 102

        defaultPath: "../IntroFlow/images/confirmButtonUP.png"
        clickedPath: "../IntroFlow/images/confirmButtonDN.png"
        label: "no"

        onButtonClicked: {
            removeNotice.removeAccount = 1
            removeNotice.closing()
            hideableWidgets.opacity = 1
            removeSocialAccount.opacity = 0
        }
    }
}
