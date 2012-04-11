import QtQuick 1.0

FocusScope {
    id: view
    width: 267
    height: 426

    property string fontName: "Futura"
    property int fontSize: 12
    property color fontColor: "#7dd9b3"

    /*property string itemTitle: ""
    property string itemDescription: ""
    property string itemUrl: ""
    property string itemImageUrl: ""*/

    property string feedName: ""
    property string feedUrl: ""


    FeedModel {
        id: listModel
        feedUrl: view.feedUrl
    }

    Component {
        id: listDelegate

        ListItem {
            text: title
            width: view.width
            height: 64
        }
    }

    ListView {
        id: list
        boundsBehavior: Flickable.StopAtBounds
        clip: true
        model: listModel
        delegate: listDelegate
    }
}
