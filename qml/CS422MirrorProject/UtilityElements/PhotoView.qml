// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

InputView {
    id: photoView
    width: elements.width
    height: elements.height
    anchors.centerIn: parent

    onHideViewChanged: elements.hideElements = hideView

    signal photoReady()

    Column {
        id: elements
        width: photoFrame.width
        height: photoFrame.height + photoButton.height + spacing
        spacing: 5
        anchors.centerIn: parent

        property bool hideElements: true

        Image {
            id: photoFrame
            width: 496
            height: 628
            anchors.horizontalCenter: parent.horizontalCenter

            fillMode: Image.PreserveAspectFit
            smooth: true
            source: "../IntroFlow/images/photoFrameBG.png"

            opacity: (parent.hideElements) ? 0 : 100
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
        }

        Button {
            id: photoButton
            width: 123
            height: 104
            anchors.horizontalCenter: parent.horizontalCenter
            defaultPath: "../IntroFlow/images/photoButtonUP.png"

            opacity: (parent.hideElements) ? 0 : 100
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }

            onButtonClicked: parent.parent.photoReady()
        }
    }

}
