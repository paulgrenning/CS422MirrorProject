// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtWebKit 1.0

Item {
    id: article
    width: 270; height: 388

    property string articleContent: ""

    Flickable {
        id: flickable1
        x: 0; y: 0
        width: article.width; height: article.height
        flickableDirection: Flickable.HorizontalFlick
        clip: true

        WebView {
            x: 0; y: 0
            html:  article.articleContent
            preferredWidth: article.width
            preferredHeight: article.height * 2
        }
    }
}
