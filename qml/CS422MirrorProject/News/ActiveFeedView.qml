import QtQuick 1.0

Item {
    id: container

    property string feedURL: ""
    property string feedMURL: ""

    width: 270
    height: 420

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
            //onClicked: ""
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