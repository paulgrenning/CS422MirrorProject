// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

InputView {
    id: inputView
    width: confirmationBackground.width
    height: confirmationBackground.height

    Image {
        id: confirmationBackground
        width: 742
        height: 357
        anchors.fill: parent

        fillMode: Image.PreserveAspectFit
        smooth: true
        source: "../IntroFlow/images/confirmBackground.png"

        opacity: (parent.hideElements) ? 0 : 100
        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }

}
