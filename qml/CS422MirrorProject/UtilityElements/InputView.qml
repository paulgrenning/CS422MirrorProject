// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: inputView

    property bool hideView: true

    function toggleHide() {
        hideView = !hideView
    }
}
