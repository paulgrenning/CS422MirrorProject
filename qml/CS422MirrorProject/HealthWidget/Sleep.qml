import QtQuick 1.1
import "../AppVariables"
import "../UtilityElements"

Item {
    id:background
    property int hrs: 9
    property int deep:0
    property int rem:0
    property int light:0

    width: 520
    height: 310

    StdText {
        id: text3
        x: 39
        y: 58
        width: 231
        height: 33
        text: (appVar.currentLanguage == "Español") ? "tiempo de sueño ayer:" : "last night sleep time:"
        verticalAlignment: Text.AlignVCenter
        clip: false
        font.pixelSize: 25
        font.bold: true
    }


    StdText {
        id: text4
        x: 39
        y: 191
        text: (appVar.currentLanguage == "Español") ? "sueño ligero:" : "light sleep:"
        font.pixelSize: 25
        font.bold: true
    }

    StdText {
        id: text5
        x: 39
        y: 139
        width: 276
        height: 33
        text: (appVar.currentLanguage == "Español") ? "sueño REM:" : "REM sleep:"
        wrapMode: Text.WordWrap
        font.pixelSize: 25
        font.bold: true
    }

    StdText {
        id: text6
        x: 39
        y: 242
        width: 186
        height: 33
        text: (appVar.currentLanguage == "Español") ? "sueño profundo:" : "deep sleep:"
        wrapMode: Text.NoWrap
        font.pixelSize: 25
        font.bold: true
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
