// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

XmlListModel {
    id: fmodel

    source: "./xml/rssfeeds.xml"
    query: "/feeds/category"

    XmlRole { name: "name"; query: "@name/string()" }
}
