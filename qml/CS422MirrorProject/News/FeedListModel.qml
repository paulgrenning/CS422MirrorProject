// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

XmlListModel {
    id: fmodel

    property string modelSource:""
    property string modelQuery: ""

    source: modelSource
    query: modelQuery

    XmlRole { name: "name"; query: "name/string()" }
    XmlRole { name: "url"; query: "xmlUrl/string()" }
    XmlRole { name: "murl"; query: "mediaUrl/string()" }
    XmlRole { name: "thumb"; query: "logo/string()" }
}
