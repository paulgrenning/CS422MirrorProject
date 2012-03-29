import QtQuick 1.0
import Qt 4.7
//import QtMultimediaKit 1.1

Item {
    id:healthwidget
    property alias barstate: healthwidget.state

    width:554
    height:375

    state: "fitness"

    MouseArea {
         anchors.fill: parent
         drag.target: healthwidget
         drag.axis: Drag.XandYAxis
         drag.minimumX: 0
         drag.maximumX: rootElement.width - healthwidget.width
         drag.minimumY: 0
         drag.maximumY: rootElement.height - parent.height
    }

    Image {
        id: background
        anchors.fill: parent
        source: "images/fitnessTabBackground.png"

        MouseArea {
            id: fitnessTabMouseArea
            x: 29
            y: 16
            width: 129
            height: 30
            onClicked: {bargraphmodel.reload();healthwidget.state = "fitness"; }
        }

        MouseArea {
            id: weightTabMouseArea
            x: 158
            y: 16
            width: 121
            height: 30
            onClicked: healthwidget.state = "weight"
        }

        MouseArea {
            id: nutritionTabMouseArea
            x: 279
            y: 16
            width: 121
            height: 30
            onClicked: healthwidget.state = "nutrition"
        }

        MouseArea {
            id: sleepTabMouseArea
            x: 400
            y: 16
            width: 126
            height: 30
            onClicked: healthwidget.state = "sleep"
        }
    }

    XmlListModel {
        id: bargraphmodel
        source: "http://nikeplus.nike.com/nikeplus/v1/services/widget/get_public_run_list.jsp?userID=340599345"
        query: "/plusService/runList/run"
        XmlRole { name: "bar_height"; query: "calories/string()" }
    }

    Rectangle {
        id: clipGraph
        x: 53
        y: 88
        width: 434
        height: 199
        color: "#00000000"
        z: 1
        clip: true
        Behavior on opacity{ NumberAnimation{duration: 2000}}

        GridView{
            id: grid
            x: -6
            y: 19
            width: 50*bargraphmodel.count
            height: 180
            cellHeight: 180
            flickableDirection: Flickable.HorizontalFlick
            interactive: true
            cellWidth: 25
            model: bargraphmodel
            delegate: BarGraphDelegate{
            }
        }
    }
    states: [
        State {
            name: "fitness"
            PropertyChanges {
                target: background
                source: "images/fitnessTabBackground.png"
            }
        },
        State {
            name: "weight"
            PropertyChanges {
                target: background
                source: "images/weightTabBackground.png"
            }

            PropertyChanges {
                target: clipGraph
                opacity: 0
            }
        },
        State {
            name: "nutrition"
            PropertyChanges {
                target: background
                source: "images/nutritionTabBackground.png"
            }

            PropertyChanges {
                target: clipGraph
                opacity: 0
            }
        },
        State {
            name: "sleep"
            PropertyChanges {
                target: background
                source: "images/sleepTabBackground.png"
            }

            PropertyChanges {
                target: clipGraph
                opacity: 0
            }
        }
    ]

}

