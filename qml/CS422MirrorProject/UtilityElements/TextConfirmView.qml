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
    property string finalInput
    property InputView activeView

    state: "inactive"
    states: [
        State { name: "inactive" },
        State { name: "textView" },
        State { name: "confirmationView" }
    ]

    signal inputConfirmed()

    onStateChanged: {
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
            textConfirmView.finalInput = input
            parent.state = "confirmationView"
        }

        onSkipInput: parent.state = "inactive"
    }

    ConfirmationView {
        id: confirmationView
        onConfirmationReceived: {
            if(!confirmed){
                textConfirmView.finalInput = ""
            }
            parent.state = "inactive"
        }
    }
}
