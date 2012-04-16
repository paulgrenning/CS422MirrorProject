// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtWebKit 1.0

Item {
    id: article
    width: 270; height: 420

    property string articleContent: ""

    WebView {
        html: article.articleContent
        preferredHeight: article.height
        preferredWidth: article.width
    }
}
