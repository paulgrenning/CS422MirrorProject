// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: container

    width: 270
    height: 420

    FeedListModel {
        id: listModel
    }

    Component {
        id: listDelegate
        ListItem {
            text: name
            icon: thumb
            onSelected:  {news.currentFeed = url; news.state = "newsfeed"; news.currentFeedMedia = murl}
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
