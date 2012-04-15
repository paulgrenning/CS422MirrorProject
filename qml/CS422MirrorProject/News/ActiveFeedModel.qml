import QtQuick 1.0

XmlListModel {
    id: amodel

    property string defUrl: ""
    property string medUrl: ""

    source: defUrl
    namespaceDeclarations: "declare namespace media = '" + medUrl +"'; declare
    namespace default = '" + defUrl + "';"
    query: "/rss/channel/item"

    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "url"; query: "link/string()" }
    XmlRole { name: "content"; query: "media:text/string()" }
    XmlRole { name: "thumb"; query: "media:content/@url/string()"}
}
