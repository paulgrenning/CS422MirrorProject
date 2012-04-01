// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../AppVariables"

Item {
    id:background
    property real kg:0.0

    width: 520
    height: 310

    AppVariables{
        id:appVar
    }

    Text {
        id: text1
        x: 312
        y: 17
        text: (kg).toFixed(1)+"kg"
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 45
        color: "#eefff9"

        Timer{ interval: {if(kg<60) return 3;
                         else return 50;}
               running:true;
               repeat: true;
               onTriggered:{if(kg<=63.0 && kg < 65.4) return (kg = kg + 1.0);
                       else if (kg>63.0 && kg < 65.4) return (kg = kg + 0.1);
                 }
        }
    }


    XmlListModel {
        id: bargraphmodel
        source: "http://nikeplus.nike.com/nikeplus/v1/services/widget/get_public_run_list.jsp?userID=340599345"
        query: "/plusService/runList/run"
        XmlRole { name: "bar_height"; query: "calories/string()" }
    }

    Text {
        id: text2
        x: 330
        y: 76
        color: "#bfe4d5"
        text: (kg*2.2).toFixed(1)+"lbs"
        font.pixelSize: 20
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text3
        x: 36
        y: 43
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "su peso actual" : "your current weight:"
        font.pixelSize: 25
        font.bold: true
        font.family: "Futura"
    }


    Rectangle {
        id: clipGraph
        x: 43
        y: 161
        width: 434
        height: 129
        color: "#00000000"
        z: 1
        clip: true
        GridView{
            id: grid
            x: 0
            y: 0
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

}
