// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Item {
    id: introFlow
    width: nameInput.width
    height: nameInput.height
    anchors.centerIn: parent

    property InputView activeView: NULL

    state: "inactive"
    states: [
        State { name: "inactive" },
        State { name: "nameEntry" }
    ]

    onStateChanged: {
        if(activeView) activeView.visible = false;
        switch(state) {
            case "nameEntry":
                activeView = nameInput;
                break;
            default:
                break;
        }
        if(activeView) activeView.render();
    }

    function start() {
        state = "nameEntry"
    }

    InputView {
        id: nameInput
        inputLabel: "Enter your name: "
    }
}
