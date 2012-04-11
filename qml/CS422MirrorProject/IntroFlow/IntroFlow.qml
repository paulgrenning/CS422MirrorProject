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
        State { name: "emailEntry" }
    ]

    onStateChanged: {
        if(activeView) activeView.toggleHide()
        switch(state) {
            case "photoView": activeView = photoView; break
            case "nameEntry": activeView = nameInput; break
            case "emailEntry": activeView = emailInput; break
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
            console.log("GOT 'PHOTO'")
            parent.state = "nameEntry"
        }
    }

    TextView {
        id: nameInput
        inputLabel: "What is your name: "

        onInputReady: {
            console.log("GOT NAME: " + input)
            parent.state = "emailEntry"
        }
    }

    TextView {
        id: emailInput
        inputLabel: "Enter your email: "

        onInputReady: {
            console.log("GOT EMAIL: " + input)
        }
    }
}
