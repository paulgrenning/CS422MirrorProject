import QtQuick 1.1
import "../UtilityElements"

Item {
    id: introFlow
    width: nameInput.width
    height: nameInput.height
    anchors.centerIn: parent

    property InputView activeView
    property string language: appVar.currentLanguage
    property variant labels

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
            case "inactive": activeView = null; introFlowFinished(); return
            default: break
        }
        if(activeView) activeView.toggleHide()
    }

    function start() {
        console.log(photoView.hideView + " " + emailInput.hideView)
        state = "photoView"
    }

    Component.onCompleted: {
        labels = {
            English: {
                nameLabel: "What is your name? ",
                nameFail: "you have to enter something for your name",
                emailLabel: "What is your email? ",
                emailMessage: "We'll use this to sync with your mail, and calendar, if it's available",
                emailFail: "your email must contain an '@' symbol to be valid",
                passwordLabel: "Enter your email password: ",
                passwordFail: "you have to enter something for your password"
            },
            Español: {
                nameLabel: "¿Cómo te llamas? ",
                nameFail: "tienes que entrar algo para tu nombre",
                emailLabel: "¿Cuál es tu email? ",
                emailMessage: "Usaremos etso para sincronizar con tu correo, y calendario, si está disponible",
                emailFail: "su email deba contener un '@' símbolo para ser válido",
                passwordLabel: "Escriba su contraseña de email: ",
                passwordFail: "deba escribir algo para su contraseña"
            }
        }
    }

    PhotoView {
        id: photoView

        onPhotoReady: {
            parent.state = "nameEntry"
        }
    }

    TextView {
        id: nameInput
        inputLabel: labels[language].nameLabel

        validator: /[\w._]+/
        failMessage: labels[language].nameFail

        onInputReady: {
            appVar.currentUser = input
            parent.state = "emailEntry"
        }
    }

    TextView {
        id: emailInput
        skippable: true

        inputLabel: labels[language].emailLabel
        inputMessage: labels[language].emailMessage

        validator: /[\w._]+@[\w._]+/
        failMessage: labels[language].emailFail

        onInputReady: {
            confirmEmailView.service = input.split("@")[1]
            parent.state = "emailPasswordEntry"
        }

        onSkipInput: parent.state = "inactive"
    }

    TextView {
        id: emailPasswordInput
        isPassword: true

        inputLabel: labels[language].passwordLabel
        inputMessage: labels[language].emailMessage

        validator: /[\w._]+/
        failMessage: labels[language].passwordFail

        onInputReady: parent.state = "confirmEmail"
    }

    ConfirmationView {
        id: confirmEmailView
        onConfirmationReceived: parent.state = "inactive"
    }
}
