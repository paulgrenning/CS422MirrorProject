import QtQuick 1.1
import "../UtilityElements"

Item {
    anchors.fill:parent;
    anchors {
        top: parent.top
        left: parent.left
        bottomMargin: 60
    }

    clip: true;
    ListView {
        id: languageList
        clip: true
        x: 0
        y: 0
        currentIndex: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 50
        anchors.topMargin: 70
        anchors.fill: parent
        highlight: Rectangle { color: "white"; opacity:0.3; radius:10 }
        highlightFollowsCurrentItem: true
        model : allLanguages


        delegate: Item {
            signal languageClicked();
             width:parent.width
             height: 50

             MouseArea {
                 anchors.fill: parent
                 onClicked: languageClicked()
             }

             onLanguageClicked: {
                 languageList.currentIndex = languageList.indexAt(x,y)
                 if(languageList.currentIndex == 0){
                     appVar.currentLanguage = "English";
                 } else if(languageList.currentIndex == 1){
                     appVar.currentLanguage = "Español";
                 }
             }

             StdText {
                 width: parent.width
                 id: aLanguage
                 anchors {
                     left: parent.left
                     leftMargin: 15
                     top: parent.top
                     topMargin: 12
                 }

                 anchors.horizontalCenter: parent.horizontalCenter

                 font.pointSize: 24

                 text: language
             }
             Image {
                 anchors {
                     top: aLanguage.bottom
                     left: aLanguage.left
                     leftMargin: -15
                     topMargin: 12
                 }

                 source: "images/longDivider.png"
             }
        }
    }
    XmlListModel {
        id: allLanguages
        source: "xmlInfo/languages.xml"

        query: "/languageList/language"


        XmlRole { name: "language"; query: "name/string()" }
    }
}
