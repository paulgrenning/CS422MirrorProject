// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    width: 310; height: 502

    Image {
        id: image1
        anchors.fill: parent
        source: (appVar.currentLanguage === "Español") ? "images/newsWidgetBackgroundSP.png" : "images/newsWidgetBackground.png"
    }

    FeedView {
        id: feedview1
        x: 22; y: 53
        width: 267
        height: 426
        feedName: "Yahoo Sports"
        feedUrl: "http://rss.news.yahoo.com/rss/sports"
    }
}
