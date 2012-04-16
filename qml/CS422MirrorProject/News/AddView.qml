// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Item {
    id: addStream
    width: 270; height: 420

    property string selectedCat: ""

    function addToXML(fUrl, fName, fThumb){
        var xmlhttp = new XMLHttpRequest()
        xmlhtpp.open("GET","userfeeds.xml",false);
        xmlhttp.send();
        var xmlData = xmlhttp.responseXML;

        var newItem = xmlData.createElement("item");
        var nameNode = xmlData.createElement("name");
        var nameText =xmlData.createTextNode(fName);
        nameNode.appendChild(nameText)

        var urlNode = xmlData.createElement("xmlUrl");
        var urlText = xmlData.createTextNode("");
        urlNode.appendChild(urlText);

        var murlNode = xmlData.createElement("mediaUrl");
        var murlText = xmlData.createTextNode(fUrl);
        murlNode.appendChild(murlText);

        var logoNode = xmlData.createElement("logo");
        var logoText = xmlData.dcreateTextNode(fThumb);
        logoNode.appendChild(logoText);

        newItem.appendChild(nameNode);
        newItem.appendChild(urlNode);
        newItem.appendChild(murlNode);
        newItem.appendChild(logoNode);
        xmlData.appendChild(newItem);
    }

    CategoryModel {
        id: categories
    }

    FeedListModel {
        id: feeds
        modelSource: "./xml/rssfeeds.xml"
        modelQuery: "/feeds/category[@name='" +  selectedCat + "']/item"
    }

    Component {
        id: categoriesLD
        StdText {
            id: text1
            width: 270; height: 64
            text: name
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20

            Image {
                id: divider
                x: 0; y: 54
                width: text1.width; height: 16
                source: "./images/divider.png"
            }

            MouseArea {
                id: catclick
                anchors.fill: parent
                onPressed: {
                    click_image.opacity = 1
                }
                onReleased: {
                    click_image.opacity = 0
                }
                onClicked: {
                    addStream.state = "Feeds"
                    selectedCat = text1.text
                }
            }

            BorderImage {
                id: click_image
                width: 270; height: 54
                anchors.bottomMargin: 10
                anchors.fill: parent
                source: "./images/newsItemBackground.png"
                opacity: 0
            }
        }
    }

    Component {
        id: feedsLD
        ListItem {
            text: name
            icon: thumb

            onSelected: {
                if(text === "Other.."){
                    news.state = "base state"
                    mainInputField.inputLabel = "Enter RSS Feed Url: "
                    keyboardFade.start()
                    hideableWidgets.opacity = 0
                }
                else{
                    //ddStream.addToXML(name, thumb, url)
                    news.state = "base state"
                }
            }
        }
    }

    ListView {
        id: feedsLV
        boundsBehavior: Flickable.StopAtBounds
        anchors.fill: parent
        clip: true
        model: feeds
        delegate: feedsLD
        opacity: 0
    }

    ListView {
        id: categoriesLV
        boundsBehavior: Flickable.StopAtBounds
        anchors.fill: parent
        clip: true
        model: categories
        delegate: categoriesLD
        opacity: 1

    }

    states: [
        State {
            name: "Feeds"
            PropertyChanges {
                target: feedsLV
                opacity: 1
            }
            PropertyChanges {
                target: categoriesLV
                opacity: 0
            }
        }
    ]

}
