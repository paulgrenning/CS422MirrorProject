// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../AppVariables"

Item {
    id:background
    property int hrs: 9
    property int deep:0
    property int rem:0
    property int light:0

    width: 520
    height: 310

    AppVariables{
        id:appVar
    }

    Text {
        id: text1
        x: 366
        y: 35
        text: (hrs)+" hrs"
        anchors.right: parent.right
        anchors.rightMargin: 50
        horizontalAlignment: Text.AlignRight
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 46
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
        x: 61
        y: 48
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "tiempo de sueño última noche:" : "last night sleep time:"
        wrapMode: Text.WordWrap
        font.pixelSize: 25
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
        id: text4
        x: 61
        y: 189
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "sueño ligero:" : "light sleep:"
        font.pixelSize: 25
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text5
        x: 61
        y: 139
        width: 276
        height: 33
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "sueño REM:" : "REM sleep:"
        wrapMode: Text.WordWrap
        font.pixelSize: 25
        font.family: "Futura"
        font.bold: true
    }

    Text {
        id: text6
        x: 61
        y: 243
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "sueño profundo:" : "deep sleep:"
        font.pixelSize: 25
        font.bold: true
        font.family: "Futura"
    }


}
