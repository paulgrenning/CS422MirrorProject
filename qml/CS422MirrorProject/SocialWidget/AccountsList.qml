// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Item {
    id: socialAccountNames
    width: 300
    height: 410
    clip: true

    property string newName: ""
    property real removeAccount: 1

    anchors {
        top: parent.top
        topMargin: 60
        left: parent.left
        leftMargin: 10
    }

    onNewNameChanged: {
        allNames.append({ name: socialAccountNames.newName })
    }

    onRemoveAccountChanged: {
        allNames.remove(listOfAccounts.currentIndex)
    }

    ListModel {
        id: allNames

    }


    ListView {
        id: listOfAccounts
        x: 0
        y: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        model: allNames
        currentIndex: 0
        highlight: Rectangle { color: "white"; opacity:0.3; radius:10 }
        highlightFollowsCurrentItem: true
        delegate: Item {
             id: accountNameDelegate
             width:parent.width - 14
             height: 50
             signal accountNameClicked()
             onAccountNameClicked: {
                 listOfAccounts.currentIndex = listOfAccounts.indexAt(x,y);
                 hideableWidgets.opacity = 0
                 removeSocialAccount.accountName = accountName.text
                 removeSocialAccount.opacity = 1
             }
             MouseArea {
                 anchors.fill: parent
                 onClicked: accountNameClicked()
             }

             StdText {
                 id: accountName
                 anchors {
                     left: accountNameDelegate.left
                     leftMargin: 30
                     topMargin: 6
                     top: accountNameDelegate.top
                 }

                 state: "blue"
                 font.pointSize: 26
                 wrapMode: Text.WordWrap

                 text: name
             }

             Image {
                 anchors {
                     top: accountNameDelegate.bottom
                     left: accountNameDelegate.left
                     topMargin: -6
                     leftMargin: 10
                 }

                 source: "images/divider.png"
             }
        }
    }
}
