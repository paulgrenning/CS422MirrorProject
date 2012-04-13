// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    anchors.fill: parent
    width: 400
    height: 60
    id: generalTabHandler
    state: "languages"

    Image {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 50
            leftMargin: 25
        }
        height: 60
        width: 400

        id: languageSelected
        source: (appVar.currentLanguage == "Español") ? "images/languageSP.png" : "images/language.png"
        opacity: 0.0
    }
    Image {
        anchors {
            top: parent.top
            topMargin: 50
            left: parent.left
            leftMargin: 25
        }
        height: 60
        width: 400

        id: unitsSelected
        source: (appVar.currentLanguage == "Español") ? "images/unitsSP.png" : "images/units.png"
        opacity: 0.0
    }

    LanguageSettings {
        anchors {
            top: languageSelected.bottom
            topMargin: 50
            left: languageSelected.left
        }
        id: languageSettings
        opacity: 1.0
    }

    states: [
        State {
            name: "languages"
            PropertyChanges { target: languageSelected; opacity: 1.0 }
        },
        State {
            name: "units"
            PropertyChanges { target: unitsSelected; opacity: 1.0 }
        }
    ]

    PropertyAnimation {id:languageFade; target: languageSettings; property: "opacity"; to: (languageSettings.opacity == 0) ? displayOpacity : 0; duration: 500}
//    PropertyAnimation {id:languageFade; target: languageSettings; property: "opacity"; to: (languageSettings.opacity == 0) ? displayOpacity : 0; duration: 500}


    MouseArea {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 50
            leftMargin: 25
        }
        width: 200
        height: 60
        onClicked: {
            generalTabHandler.state = "languages";
            languageFade.start()
        }
    }

    MouseArea {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 50
            leftMargin: 225
        }
        width: 200
        height: 60
        onClicked: {
            generalTabHandler.state = "units";
            languageFade.start()
        }
    }
}
