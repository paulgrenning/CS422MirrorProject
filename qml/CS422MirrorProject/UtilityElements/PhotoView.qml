// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

InputView {
    id: photoView
    width: elements.width
    height: elements.height
    anchors.horizontalCenter: parent.horizontalCenter
    y: -100

    signal photoReady()

    Column {
        id: elements
        width: photoFrame.width
        height: photoFrame.height + photoButton.height + spacing
        spacing: 5
        anchors.centerIn: parent

        Image {
            id: photoFrame
            width: 496
            height: 628
            anchors.horizontalCenter: parent.horizontalCenter

            fillMode: Image.PreserveAspectFit
            smooth: true
            source: "../IntroFlow/images/photoFrameBG.png"
        }

        Button {
            id: photoButton
            width: 123
            height: 104
            anchors.horizontalCenter: parent.horizontalCenter
            defaultPath: "../IntroFlow/images/photoButtonUP.png"
            clickedPath: "../IntroFlow/images/photoButtonDN.png"

            onButtonClicked: parent.parent.photoReady()
        }
    }

}
