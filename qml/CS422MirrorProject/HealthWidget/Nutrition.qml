// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../AppVariables"

Item {
    id:background
    property int cal:0
    property int objcal:0

    width: 520
    height: 310

    Text {
        id: text1
        x: 378
        y: 47
        text: (cal)+" cal"
        anchors.right: parent.right
        anchors.rightMargin: 50
        horizontalAlignment: Text.AlignRight
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 35
        color: "#eefff9"

        Timer{ interval: {if(cal<1850) return 1;
                         else return 50;}
               running:true;
               repeat: true;
               onTriggered:{if(cal<1800) return (cal = cal + 100);
                       else if (cal>=1800 && cal< 1850) return (cal = cal + 3);
                 }
        }
    }

    Text {
        id: text3
        x: 39
        y: 57
        color: "#bfe4d5"
        text: (appVar.currentLanguage === "Español") ? "calorías consumidas ayer:" : "calories consumed yesterday:"
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
        y: 120
        color: "#eefff9"
        text: (objcal)+" cal"
        font.pixelSize: 35
        anchors.rightMargin: 50
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

                   if(objcal==1800){ running=false; animationtext6.start();animationtext7.start()}
                }

        }
    }
    Text {
        id: text4
        x: 39
        y: 130
        color: "#bfe4d5"
        text: (appVar.currentLanguage === "Español") ? "objetivo de hoy:" : "today's goal:"
        font.pixelSize: 20
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text5
        x: 39
        y: 197
        width: 263
        height: 33
        color: "#bfe4d5"
        text: (appVar.currentLanguage === "Español") ? "ejercicio recomendado:" : "recommended workout:"
        wrapMode: Text.WordWrap
        font.pixelSize: 23
        font.family: "Futura"
        font.bold: true
    }

    Text {
        id: text6
        x: 352
        y: 190
        width: 105
        height: 33
        color: "#eefff9"
        text: (appVar.currentLanguage === "Español") ? "correr":"running"
        wrapMode: Text.WordWrap
        font.pixelSize: 30
        anchors.rightMargin: 50
        font.bold: true
        font.family: "Futura"
        anchors.right: parent.right
        horizontalAlignment: Text.AlignRight
        opacity: 0
        PropertyAnimation {id: animationtext6; target: text6; property: "opacity"; from: 0; to: 1; duration: 500}
    }
    Text {
        id: text7
        x: 300
        y: 230
        width: 157
        height: 33
        color: "#eefff9"
        text: "30 min"
        wrapMode: Text.WordWrap
        font.pixelSize: 23
        anchors.rightMargin: 50
        font.bold: true
        font.family: "Futura"
        anchors.right: parent.right
        horizontalAlignment: Text.AlignRight
        opacity: 0
        PropertyAnimation {id: animationtext7; target: text7; property: "opacity"; from: 0; to: 1; duration: 500}
    }
}
