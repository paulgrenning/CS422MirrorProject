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
        id: wifiList
        clip: true
        x: 0
        y: 0
        currentIndex: 0
        property real previousIndex: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 50
        anchors.topMargin: 70
        anchors.fill: parent
        highlight: Rectangle { color: "white"; opacity:0.3; radius:10 }
        highlightFollowsCurrentItem: true
        model : allWifi


        delegate: Item {
             signal wifiChanged();
             width:parent.width
             height: 50

             MouseArea {
                 anchors.fill: parent
                 onClicked: wifiChanged()
             }

             onWifiChanged: {
                 wifiList.currentIndex = wifiList.indexAt(x,y)
                 if(wifiList.currentIndex != wifiList.previousIndex){
                     wifiList.previousIndex = wifiList.currentIndex
                     mainInputField.inputLabel = "Enter Wifi Password: "
                     keyboardFade.start()
                     hideableWidgets.opacity = 0
                 }
             }

             StdText {
                 width: parent.width
                 id: aWifi
                 anchors {
                     left: parent.left
                     leftMargin: 15
                     top: parent.top
                     topMargin: 12
                 }

                 anchors.horizontalCenter: parent.horizontalCenter
                 font.pointSize: 24

                 text: name
             }
             Image {
                 width: 50
                 anchors {
                     left: aWifi.right
                     top: aWifi.top
                     topMargin: -10
                     leftMargin: -60
                 }
                 source: imageSource
             }

             Image {
                 anchors {
                     top: aWifi.bottom
                     left: aWifi.left
                     leftMargin: -15
                     topMargin: 12
                 }

                 source: "images/longDivider.png"
             }
        }
    }
    XmlListModel {
        id: allWifi
        source: "xmlInfo/wifi.xml"

        query: "/wifiList/wifi"


        XmlRole { name: "name"; query: "name/string()" }
        XmlRole { name: "imageSource"; query: "image/string()" }
    }
}
