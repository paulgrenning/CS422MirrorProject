// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import "../UtilityElements"
import QtQuick 1.1

Widget{
    id: news
    width: 310; height: 496

    property string currentFeed: ""
    property string currentFeedMedia: ""
    isVisible: false
    property string currentArticleUrl: ""

    bgImgPath:  (appVar.currentLanguage == "Español") ? "../News/images/newsWidgetBackgroundSP.png" : "../News/images/newsWidgetBackground.png"

    MouseArea {
        id: mouse_area1
        x: 222; y: 0
        width: 40; height: 40
        onPressed: news.state = "add"
    }

    FeedListView{
        id: feedlist
        x: 19; y: 52
        opacity: 1
    }

    ActiveFeedView {
        id: feedview
        x: 19; y: 52
        clip: true
        feedURL: news.currentFeed
        feedMURL: news.currentFeedMedia
        opacity: 0
    }

    Article {
        id: article
        x: 19; y: 52
        clip: true
        opacity: 0
        articleContent: news.currentArticleUrl
    }

    Button {
        id: back
        x: 209; y: 440
        width: 80; height: 40
        //clickedPath: ""
        defaultPath:  (appVar.currentLanguage == "Español") ?  "../News/images/newsBack80x40SP.png" : "../News/images/newsBack80x40.png"
        onButtonClicked: {
            if(news.state === "newsfeed")
                news.state = "base sate"
            else if(news.state === "article")
                news.state = "newsfeed"
        }
        opacity: 0
    }



    states: [
        State {
            name: "base state"

            PropertyChanges {
                target: feedlist
                opacity: 1
            }
            PropertyChanges {
                target: feedview
                opacity: 0
            }
            PropertyChanges {
                target: article
                opacity: 0
            }
            PropertyChanges {
                target: back
                opacity: 0
            }
        },
        State {
            name: "newsfeed"

            PropertyChanges {
                target: feedview
                opacity: 1
            }
            PropertyChanges {
                target: feedlist
                opacity: 0
            }
            PropertyChanges {
                target: article
                opacity: 0
            }
            PropertyChanges {
                target: back
                opacity: 1
            }
        },
        State {
            name: "article"

            PropertyChanges {
                target: feedlist
                opacity: 0
            }
            PropertyChanges {
                target: feedview
                opacity: 0
            }
            PropertyChanges {
                target: article
                opacity: 1
            }
            PropertyChanges {
                target: back
                opacity: 1
            }
        },
        State {
            name: "add"

        }
    ]
}
