import QtQuick 1.0

Item {
    id: container

    property string feedURL: ""
    property string feedMURL: ""

    width: 270; height: 388

    ActiveFeedModel {
        id: listModel
        defUrl: container.feedURL
        medUrl: container.feedMURL
    }

    Component {
        id: listDelegate

        ListItem {
            text: title
            icon: thumb
            onSelected: {news.currentArticleUrl = content; news.state = "article";}
        }
    }

    ListView {
        id: list
        anchors.fill: parent
        clip: true
        model: listModel
        delegate: listDelegate
    }
}
