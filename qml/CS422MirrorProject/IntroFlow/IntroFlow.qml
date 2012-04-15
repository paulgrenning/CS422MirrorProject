import QtQuick 1.1
import "../UtilityElements"

Item {
    id: introFlow
    width: nameInput.width
    height: nameInput.height
    anchors.centerIn: parent

    property InputView activeView

    state: "inactive"
    states: [
        State { name: "inactive" },
        State { name: "photoView" },
        State { name: "nameEntry" },
        State { name: "emailEntry" },
        State { name: "emailPasswordEntry" },
        State { name: "confirmEmail" }
    ]

    signal introFlowFinished()

    onStateChanged: {
        if(activeView) activeView.toggleHide()
        switch(state) {
            case "photoView": activeView = photoView; break
            case "nameEntry": activeView = nameInput; break
            case "emailEntry": activeView = emailInput; break
            case "emailPasswordEntry": activeView = emailPasswordInput; break
            case "confirmEmail": activeView = confirmEmailView; break
            case "inactive": introFlowFinished(); return
            default: break
        }
        if(activeView) activeView.toggleHide()
    }

    function start() {
        state = "photoView"
    }

    PhotoView {
        id: photoView

        onPhotoReady: {
            parent.state = "nameEntry"
        }
    }

    TextView {
        id: nameInput
        inputLabel: "What is your name? "

        validator: /[\w._]+/
        failMessage: "you have to enter something for your name"

        onInputReady: {
            appVar.currentUser = input
            parent.state = "emailEntry"
        }
    }

    TextView {
        id: emailInput
        skippable: true

        inputLabel: "What is your email? "
        inputMessage: "We'll use this to sync with your mail, and calendar, if it's available"

        validator: /[\w._]+@[\w._]+/
        failMessage: "your email must contain an '@' symbol to be valid"

        onInputReady: {
            confirmEmailView.service = input.split("@")[1]
            parent.state = "emailPasswordEntry"
        }

        onSkipInput: parent.state = "inactive"
    }

    TextView {
        id: emailPasswordInput
        isPassword: true

        inputLabel: "Enter your email password: "
        inputMessage: "We'll use this to sync with your mail, and calendar, if it's available"

        validator: /[\w._]+/
        failMessage: "you have to enter something for your password"

        onInputReady: parent.state = "confirmEmail"
    }

    ConfirmationView {
        id: confirmEmailView
        onConfirmationReceived: parent.state = "inactive"
    }
}
