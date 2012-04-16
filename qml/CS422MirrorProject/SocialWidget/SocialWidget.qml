import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: social
    width:310
    height:496
    isVisible: false
    bgImgPath:"../SocialWidget/images/twitterTab.png"

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

    Item {
        width: 300
        height: 410
        clip: true
        anchors {
            top: parent.top
            topMargin: 60
            left: parent.left
            leftMargin: 10
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

                     state: "white"
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
//            source: "http://twitter.com/statuses/user_timeline/paul_grenning.atom"
//            namespaceDeclarations: "declare default element namespace 'http://www.w3.org/2005/Atom'; " +
//                                   "declare namespace twitter=\"http://api.twitter.com/\";";

//            query: "/feed/entry"
            source: "xmlFiles/socialFeed.xml"
            query: "/socialFeeds/item"
            XmlRole { name: "statusText"; query: "name/string()" }
            XmlRole { name: "postTime"; query: "time/string()" }
            XmlRole { name: "userImage"; query: "image/string()" }
        }

    }

}
