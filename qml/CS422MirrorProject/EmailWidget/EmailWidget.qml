// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: email
    width:310
    height:496
    isVisible: false
    bgImgPath:"../EmailWidget/images/emailTab.png"

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
                keyboardFade.start()
                mainInputField.inputLabel = "Add Email Account: "
                hideableWidgets.opacity = 0
            }
        }
    }

    Item {
        width: 290
        height: 410
        clip: true
        anchors {
            top: parent.top
            topMargin: 60
            left: parent.left
            leftMargin: 10
        }

        ListView {
            id: emailView
            x: 0
            y: 0
            currentIndex: -1
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            highlight: Rectangle { color: "white"; opacity:0.3; radius:10 }
            highlightFollowsCurrentItem: true
            model : allEmails
            delegate: Item {
                 id: anItem
                 width:parent.width
                 height: emailSubject.height + fromText.height + 20
                 property string bodyText: emailBody

                 signal emailClicked()
                 MouseArea {
                     anchors.fill: parent
                     onClicked: emailClicked()
                 }

                 onEmailClicked: {
                     emailView.currentIndex = emailView.indexAt(x,y)
                     emailViewer.opacity = 1
                     emailViewer.emailFrom = from
                     emailViewer.emailTime = postTime
                     emailViewer.emailSubject = subject
                     emailViewer.emailBody = emailBody
                     hideableWidgets.opacity = 0
                 }

                 Text {
                     id: fromText
                     anchors {
                         left: anItem.left
                         leftMargin: 16
                         top: anItem.top
                         topMargin: 6
                     }

                     color: "#7dd9b3"
                     font.pointSize: 14
                     font.family: "Futura"
                     wrapMode: Text.WordWrap

                     text: "From: " + from
                 }

                 Text {
                     id: timeText
                     anchors {
                         right: anItem.right
                         rightMargin: 20
                         top: anItem.top
                         topMargin: 6
                     }

                     color: "#7dd9b3"
                     font.pointSize: 10
                     font.family: "Futura"
                     wrapMode: Text.WordWrap

                     text: postTime
                 }

                 Text {
                     id: emailSubject
                     anchors {
                         left: anItem.left
                         leftMargin: 16
                         top: fromText.bottom
                         topMargin: 10
                     }

                     anchors.horizontalCenter: parent.horizontalCenter

                     color: "#7dd9b3"
                     font.pointSize: 14
                     font.family: "Futura"
                     wrapMode: Text.WordWrap

                     text: "Subject: " + subject

                 }

                 Image {
                     anchors {
                         top: parent.bottom
                         topMargin: -5
                         left: parent.left
                         leftMargin: 10
                     }

                     source: "images/divider.png"
                 }
            }
        }

        XmlListModel {
            id: allEmails
//            source: "http://twitter.com/statuses/user_timeline/paul_grenning.atom"
//            namespaceDeclarations: "declare default element namespace 'http://www.w3.org/2005/Atom'; " +
//                                   "declare namespace twitter=\"http://api.twitter.com/\";";

//            query: "/feed/entry"
            source: "xmlFiles/emailFeed.xml"
            query: "/emailFeeds/item"
            XmlRole { name: "subject"; query: "subject/string()" }
            XmlRole { name: "postTime"; query: "time/string()" }
            XmlRole { name: "from"; query: "from/string()" }
            XmlRole { name: "emailBody"; query: "body/string()" }
        }

    }

}
