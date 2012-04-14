// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Text {
    id: stdText
    color: (useBlue) ? "#b9eef3" : "#bee7d5"
    font { family: "Futura" }
    style: Text.Raised
    styleColor: "#91b3a4"

    property bool useBlue: false
}
