import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: social
    width:310
    height:496
    isVisible: false
    bgImgPath:"../SocialWidget/images/twitterTab.png"
    property string newName: socialAccountList.newName
    property real removeAccount: socialAccountList.removeAccount
    state: "viewFeed"
    PlusButton {
        x: 218
        y: 4
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: 218
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
//                keyboardFade.start()
//                mainInputField.inputLabel = "Add Account Name: "
//                mainInputField.returnWidget = social


                mainTextConfirmView.inputLabel = "What's the account name? "
                mainTextConfirmView.validator = /[\w._]+/
                mainTextConfirmView.failMessage = "you have to enter something for your account name"
                mainTextConfirmView.inputParser = inputParser

                mainTextConfirmView.start()
                hideableWidgets.opacity = 0
            }

            // define functions in this format to change manipulation of input that will appear as the 'service' in the ConfirmationView
            FunctionClosure {
                id: inputParser
                function parse(input) {
                    return input
                }
            }
        }
    }

    Image {
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: -40
            topMargin: 50
        }
        opacity: 1
        id: viewFeedSelected
        source: (appVar.currentLanguage == "Español") ? "images/viewFeedSP.png" : "images/viewFeed.png"
    }

    Image {
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: -40
            topMargin: 50
        }
        opacity: 0
        id: viewAccountsSelected
        source: (appVar.currentLanguage == "Español") ? "images/accountsSP.png" : "images/accounts.png"
    }

    MouseArea {
        anchors{
            top: parent.top
            left: parent.left
            topMargin: 50
        }
        width: 200
        height: 60
        onClicked: social.state = "viewFeed"
    }

    MouseArea {
        anchors{
            top: parent.top
            left: parent.left
            topMargin: 50
            leftMargin: 160
        }
        width: 200
        height: 60
        onClicked: social.state = "accounts"
    }

    states: [
        State {
            name: "viewFeed"
            PropertyChanges { target: viewAccountsSelected; opacity: 0.0 }
            PropertyChanges { target: viewFeedSelected; opacity: 1.0 }
            PropertyChanges { target: socialAccountList; opacity: 0.0 }
            PropertyChanges { target: allSocialFeed; opacity: 1.0 }
        },
        State {
            name: "accounts"
            PropertyChanges { target: viewAccountsSelected; opacity: 1.0 }
            PropertyChanges { target: viewFeedSelected; opacity: 0.0 }
            PropertyChanges { target: socialAccountList; opacity: 1.0 }
            PropertyChanges { target: allSocialFeed; opacity: 0.0 }
        }
    ]

    onNewNameChanged: {
        socialAccountList.newName = social.newName
    }

    onRemoveAccountChanged: {
        socialAccountList.removeAccount = social.removeAccount
    }

    AccountsList {
        id: socialAccountList
        opacity: 0
        width: 300
        height: 350
        clip: true
        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
        anchors {
            top: parent.top
            topMargin: 110
            left: parent.left
            leftMargin: 10
        }
    }

    Item {
        id: allSocialFeed
        width: 300
        height: 350
        clip: true
        anchors {
            top: parent.top
            topMargin: 110
            left: parent.left
            leftMargin: 10
        }

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        ListView {
            id: tweetView
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            model : allTweets
            delegate: Item {
                 width:parent.width
                 height: Math.max(timeText.height + tweetText.paintedHeight + 20, twitterAccountImage.height + 20)

                 StdText {
                     id: timeText
                     anchors {
                         left: twitterAccountImage.right
                         leftMargin: 5
                         top: twitterAccountImage.top
                         topMargin: -5
                     }

                     state: "orange"
                     font.pointSize: 10
                     wrapMode: Text.WordWrap

                     text: postTime
                 }

                 StdText {
                     id: tweetText
                     anchors {
                         left: twitterAccountImage.right
                         leftMargin: 5
                         top: timeText.bottom
                         topMargin: 2
                     }

                     anchors.horizontalCenter: parent.horizontalCenter

                     font.pointSize: 14
                     wrapMode: Text.WordWrap

                     text: statusText
                 }

                 Image {
                     id: twitterAccountImage
                     anchors {
                         left: parent.left
                         leftMargin: 15
                         top: parent.top
                         topMargin: 10
                     }
                     source: userImage
                 }
                 Image {
                     anchors {
                         top: parent.bottom
                         topMargin: -10
                         left: parent.left
                         leftMargin: 10
                     }

                     source: "images/divider.png"
                 }
            }
        }

        XmlListModel {
            id: allTweets

            source: "xmlFiles/socialFeed.xml"
            query: "/socialFeeds/item"
            XmlRole { name: "statusText"; query: "name/string()" }
            XmlRole { name: "postTime"; query: "time/string()" }
            XmlRole { name: "userImage"; query: "image/string()" }
        }

    }

}
