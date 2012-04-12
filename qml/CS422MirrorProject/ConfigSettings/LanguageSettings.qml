// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    anchors.fill:parent;
    anchors {
        top: parent.top
        left: parent.left
        bottomMargin: 60
    }

    clip: true;
    height: 200
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
             width:parent.width - 80
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

             Text {
                 width: parent.width
                 id: aLanguage
                 anchors {
                     left: parent.left
                     leftMargin: 5
                     top: parent.top
                     topMargin: 10
                 }

                 anchors.horizontalCenter: parent.horizontalCenter

                 color: "#7dd9b3"
                 font.pointSize: 24
                 font.family: "Futura"

                 text: language
             }
             Image {
                 anchors {
                     top: aLanguage.bottom
                     left: aLanguage.left
                     leftMargin: -5
                     topMargin: 2
                 }

                 source: "../SocialWidget/images/divider.png"
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
