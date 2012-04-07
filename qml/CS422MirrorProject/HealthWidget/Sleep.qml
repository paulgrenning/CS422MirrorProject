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
        id: text3
        x: 39
        y: 58
        width: 231
        height: 33
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "tiempo de sueño ayer:" : "last night sleep time:"
        verticalAlignment: Text.AlignVCenter
        clip: false
        font.pixelSize: 25
        font.bold: true
        font.family: "Futura"
    }


    Text {
        id: text4
        x: 39
        y: 191
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "sueño ligero:" : "light sleep:"
        font.pixelSize: 25
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text5
        x: 39
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
        x: 39
        y: 242
        width: 186
        height: 33
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "sueño profundo:" : "deep sleep:"
        wrapMode: Text.NoWrap
        font.pixelSize: 25
        font.bold: true
        font.family: "Futura"
    }


    XmlListModel {
        id: sleeptimemodel
        source: "sleepinfo.xml"
        query: "/sleepinfo/lastnightsleep"
        XmlRole { name: "rem_minutes"; query: "rem/string()" }
        XmlRole { name: "deep_minutes"; query: "deep/string()" }
        XmlRole { name: "light_minutes"; query: "light/string()" }
    }


    ListView {
        x: 225
        y: 36
         width: 270; height: 250
         anchors.left: text6.right
         anchors.leftMargin: 0
         clip: false
         model: sleeptimemodel
         delegate: SleepInfoDelegate{}

     }
}
