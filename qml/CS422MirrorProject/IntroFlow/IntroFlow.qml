// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
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
        State { name: "confirmEmail" }
    ]

    onStateChanged: {
        if(activeView) activeView.toggleHide()
        switch(state) {
            case "photoView": activeView = photoView; break
            case "nameEntry": activeView = nameInput; break
            case "emailEntry": activeView = emailInput; break
            case "confirmEmail": activeView = confirmEmailView; break
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

        onInputReady: {
            parent.state = "emailEntry"
        }
    }

    TextView {
        id: emailInput
        inputLabel: "What is your email? "
        inputMessage: "We'll use this to sync with your mail, and calendar, if it's available"

        validator: /[\w._]*@[\w._]*/

        onInputReady: {
            parent.state = "confirmEmail"
            confirmEmailView.service = input.split("@")[1]
        }
    }

    ConfirmationView {
        id: confirmEmailView
    }
}
