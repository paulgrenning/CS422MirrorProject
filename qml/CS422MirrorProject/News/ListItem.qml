// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: list_item

    property string fontType: "Futura"
    property int fontSize: 12
    property string fontColor: "#7dd9b3"
    property string text: ""
    property string icon: ""

    width: 310
    height: 64
    clip: true

    /*Image {
        id: iconId
        source: icon
    }*/

    Text {
        id: itemText
        x: 17
        y: 26
        font {
            family: list_item.fontName
            pointSize: list_item.fontSize
        }
        color: list_item.fontColor
        text: list_item.text
        wrapMode: Text.WordWrap
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea {
        id: mouseArea
        width: 310
        height: 53
        anchors.bottomMargin: 12
        anchors.fill: parent
        onPressed:{
            push_shadow.opacity = .5;
        }
        onReleased:{
            push_shadow.opacity = 0;
        }
    }

    Image {
        id: image1
        x: 0
        y: 47
        width: 310
        height: 25
        fillMode: Image.PreserveAspectFit
        source: "images/divider.png"
    }

    Rectangle {
        id: push_shadow
        color: "#000000"
        opacity: 0
        anchors.fill: parent
    }


}
