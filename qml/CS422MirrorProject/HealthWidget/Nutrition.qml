// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../AppVariables"

Item {
    id:background
    property int cal:0
    property int objcal:0

    width: 520
    height: 310

    AppVariables{
        id:appVar
    }

    Text {
        id: text1
        x: 378
        y: 28
        text: (cal)+" cal"
        anchors.right: parent.right
        anchors.rightMargin: 63
        horizontalAlignment: Text.AlignRight
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 35
        color: "#eefff9"

        Timer{ interval: {if(cal<1850) return 1;
                         else return 50;}
               running:true;
               repeat: true;
               onTriggered:{if(cal<=1840) return (cal = cal + 50);
                       else if (cal>1845 && cal< 1850) return (cal = cal + 1);
                 }
        }
    }

    Text {
        id: text3
        x: 39
        y: 38
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "calorías consumidas ayer:" : "calories consumed yesterday:"
        wrapMode: Text.WordWrap
        font.pixelSize: 20
        font.bold: true
        font.family: "Futura"
    }

    XmlListModel {
        id: bargraphmodel
        source: "http://nikeplus.nike.com/nikeplus/v1/services/widget/get_public_run_list.jsp?userID=340599345"
        query: "/plusService/runList/run"
        XmlRole { name: "bar_height"; query: "calories/string()" }
    }

    Text {
        id: text2
        x: 378
        y: 92
        color: "#eefff9"
        text: (objcal)+" cal"
        font.pixelSize: 35
        anchors.rightMargin: 63
        font.bold: true
        font.family: "Futura"
        anchors.right: parent.right
        horizontalAlignment: Text.AlignRight
        Timer{ interval: {if(objcal<1800) return 1;
                         else return 50;}
               running:true;
               repeat: true;
               onTriggered:{if(objcal<=1790) return (objcal = objcal + 50);
                       else if (objcal>1790 && objcal< 1800) return (objcal = objcal + 1);
                 }
        }
    }

    Text {
        id: text4
        x: 39
        y: 102
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "objetivo de hoy:" : "today's goal:"
        font.pixelSize: 20
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text5
        x: 17
        y: 186
        width: 276
        height: 33
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "ejercicio recomendado para hoy:" : "recommended workout for today:"
        wrapMode: Text.WordWrap
        font.pixelSize: 25
        font.family: "Futura"
        font.bold: true
    }

}
