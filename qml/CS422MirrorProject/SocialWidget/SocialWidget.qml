// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: social
    width:310
    height:496


    MouseArea {
         anchors.fill: parent
         drag.target: social
         drag.axis: Drag.XandYAxis
         drag.minimumX: 0
         drag.maximumX: rootElement.width - parent.width
         drag.minimumY: 0
         drag.maximumY: rootElement.height - parent.height
    }

    Image {
        id: musicbackground
        anchors.fill: parent
        source: "images/twitterTab.png"
    }

    PlusButton {
        x: 218
        y: 4
        anchors {
            top: parent.top
            left: parent.left
            leftMargin: 218
            topMargin: 4
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                fadeInKeyboard.start()
                mainInputField.inputLabel = "Add Account Name: "
                mainInputField.returnWidget = social
                mainInputField.runAnimation = socialanimopen
                socialanimclose.start()
            }
        }
    }

    PropertyAnimation {id:fadeInKeyboard; target: mainInputField; property: "opacity"; to: (musicplayer.opacity == 0) ? 1 : 0; duration: 500}

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
                 height: Math.max(tweetText.height + 20, twitterAccountImage.height + 20)


                 Text {
                     id: tweetText
                     anchors {
                         left: twitterAccountImage.right
                         leftMargin: 5
                         top: twitterAccountImage.top
                         topMargin: -5
                     }

                     anchors.horizontalCenter: parent.horizontalCenter

                     color: "#7dd9b3"
                     font.pointSize: 14
                     font.family: "Futura"
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
            source: "http://twitter.com/statuses/user_timeline/paul_grenning.atom"
            namespaceDeclarations: "declare default element namespace 'http://www.w3.org/2005/Atom'; " +
                                   "declare namespace twitter=\"http://api.twitter.com/\";";

            query: "/feed/entry"

            XmlRole { name: "statusText"; query: "content/string()" }
    //        XmlRole { name: "timestamp"; query: "published/string()" }
    //        XmlRole { name: "source"; query: "twitter:source/string()" }
    //        XmlRole { name: "name"; query: "author/name/string()" }
            XmlRole { name: "userImage"; query: "link[@rel = 'image']/@href/string()" }
        }

    }

}
