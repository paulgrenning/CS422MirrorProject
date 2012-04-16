import QtQuick 1.1
import "../UtilityElements"
import "../AppVariables"

Item {
    anchors.fill: parent
    width: 400
    height: 60
    id: accountsTabHandler
    state: "runSetup"
    property string newUserName: appVar.currentUser
    property real removeAccount: 1

    Image {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 50
            leftMargin: 25
        }
        height: 60
        width: 400

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appVar.renderIntroFlow = true;
                handleNewUser();
            }
        }

        id: runSetupButton
        source: (appVar.currentLanguage == "Español") ? "images/runSetupSP.png" : "images/runSetup.png"
        opacity: 1.0
    }

    onRemoveAccountChanged: {
        mainAccountNames.remove(listOfMainAccounts.currentIndex)
        if(mainAccountNames.count == 0){
            appVar.currentUser = ""
        } else {
            appVar.currentUser = listOfMainAccounts.currentIndex.accountName.text
        }
    }

    StdText {
        anchors {
            top: runSetupButton.bottom
            left: runSetupButton.left
            leftMargin: 20
        }
        state: "orange"
        height: 60
        width: 400
        font.pointSize: 24
        text: (appVar.currentLanguage == "Español") ? "Quite Cuentas" : "Remove Accounts"
    }

    onNewUserNameChanged: {
        if(accountsTabHandler.newUserName != ""){
            mainAccountNames.append({ name: accountsTabHandler.newUserName} )
        }
    }

    ListModel {
        id: mainAccountNames

    }
    Item {
        width: 390
        height: 300
        clip: true
        anchors {
            left: parent.left
            leftMargin: 30
            top: parent.top
            topMargin: 150
        }

        ListView {
            id: listOfMainAccounts
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            model: mainAccountNames
            currentIndex: 0
            highlight: Rectangle { color: "white"; opacity:0.3; radius:10 }
            highlightFollowsCurrentItem: true
            delegate: Item {
                 id: accountNameDelegate
                 width:parent.width - 14
                 height: 50
                 signal accountNameClicked()
                 onAccountNameClicked: {
                     listOfMainAccounts.currentIndex = listOfMainAccounts.indexAt(x,y);
                     hideableWidgets.opacity = 0
                     removeMainAccount.accountName = accountName.text
                     removeMainAccount.opacity = 1
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

                     source: "images/longDivider.png"
                 }
            }
        }
    }
}
