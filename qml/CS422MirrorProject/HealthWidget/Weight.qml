// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    width: 520
    height: 310

    Text {
        id: text1
        x: 186
        y: 129
        text: qsTr("Weight")
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 40
        color: "#bfe4d5"
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

    XmlListModel {
        id: bargraphmodel
        source: "http://nikeplus.nike.com/nikeplus/v1/services/widget/get_public_run_list.jsp?userID=340599345"
        query: "/plusService/runList/run"
        XmlRole { name: "bar_height"; query: "calories/string()" }
    }
}
