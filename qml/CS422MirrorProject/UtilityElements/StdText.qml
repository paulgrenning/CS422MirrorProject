// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Text {
    id: stdText
    height: font.pixelSize
    font { family: "Futura" }
    style: Text.Raised
    styleColor: "#91b3a4"
    smooth: true

    state: "default"
    states: [
        State { name: "default"; PropertyChanges { target: stdText; color: "#bee7d5" }},
        State { name: "blue"; PropertyChanges { target: stdText; color: "#b9eef3" }},
        State { name: "orange"; PropertyChanges { target: stdText; color: "#ebab6c" }},
        State { name: "white"; PropertyChanges { target: stdText; color: "#eefff9" }}
    ]
}
