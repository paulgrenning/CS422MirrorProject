// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {

    anchors {
        top: parent.top
        left: parent.left
    }

    TemperatureUnit {
        id: temperatureUnitSelector
        height: 60
        anchors {
           top: parent.top
           left: parent.left
        }
    }

    WeightUnit {
        id: weightUnitSelector
        height: 60
        anchors {
           top: temperatureUnitSelector.top
           topMargin: 70
           left: parent.left
        }
    }

    LengthUnit {
        anchors {
            top: weightUnitSelector.top
            topMargin: 140
            left: parent.left
        }
    }
}
