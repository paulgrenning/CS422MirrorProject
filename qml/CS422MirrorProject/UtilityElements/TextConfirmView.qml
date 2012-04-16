import QtQuick 1.1
import "../UtilityElements"

Item {
    id: textConfirmView
    width: textView.width
    height: textView.height
    anchors.centerIn: parent

    property string inputLabel

    property variant validator
    property string failMessage
    property FunctionClosure inputParser: inputHandler

    property InputView activeView

    state: "inactive"
    states: [
        State { name: "inactive" },
        State { name: "textView" },
        State { name: "confirmationView" }
    ]

    signal inputConfirmed()

    onStateChanged: {
        console.log("state changed: " + state)
        if(activeView) activeView.toggleHide()
        switch(state) {
            case "textView": activeView = textView; break
            case "confirmationView": activeView = confirmationView; break
            case "inactive": activeView = null; inputConfirmed(); return
            default: break
        }
        if(activeView) activeView.toggleHide()
    }

    function start() {
        state = "textView"
    }

    FunctionClosure {
        id: inputHandler
        function parse(input) {
            return input
        }
    }

    TextView {
        id: textView
        inputLabel: parent.inputLabel
        skippable: true

        validator: parent.validator
        failMessage: parent.failMessage

        onInputReady: {
            confirmationView.service = inputParser.parse(input)
            parent.state = "confirmationView"
        }

        onSkipInput: parent.state = "inactive"
        onHideViewChanged: console.log("textView.hideView: " + hideView)
    }

    ConfirmationView {
        id: confirmationView
        onConfirmationReceived: parent.state = "inactive"
        onHideViewChanged: console.log("confirmationView.hideView: " + hideView)
    }
}
