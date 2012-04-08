// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: barGraphDelegate
    signal barclicked()
    property alias barImageHeight: barimage.height
    property alias barImageY: barimage.y
    property variant runDate

    width:50
    height:180

    function getTodaysText(){
        var today = runDate
        var year = today.slice(0,4);
        var month = today.slice(5,7);
        var day = today.slice(8,10);
        var date = new Date(parseInt(year),parseInt(month),parseInt(day))
        var days = ['S','M','T','W','T','F','S']
        var months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC']

        //console.log(year)
        //console.log(day)
        //text1.text = days[date.getDay()];
        text2.text = day
        text3.text = months[parseInt(month-1)]
        //console.log(date.getDay())
    }

    Component.onCompleted: getTodaysText()

    BorderImage {
        id:barimage
        Component.onCompleted: {animation.start();}
        transformOrigin: Item.Bottom
        scale: 0
        x: 0
        width: 30
        anchors.horizontalCenter: parent.horizontalCenter
        border { left: 15; top: 15; right: 15; bottom: 15}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "images/graphBarBorderImage.png"
        PropertyAnimation {id: animation; target: barimage; property: "scale"; from: 0; to: 1; duration: 1000}
    }

    Text {
        Component.onCompleted: animationtext2.start()
        id: text2
        x: 14
        y: 143
        width: 23
        height: 14
        color: "#bfe4d5"
        text: qsTr("text")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 12
        PropertyAnimation {id: animationtext2; target: text2; property: "opacity"; from: 0; to: 1; duration: 200}
    }
    Text {
        Component.onCompleted: animationtext3.start()
        id: text3
        x: 14
        y: 159
        width: 23
        height: 14
        color: "#bfe4d5"
        text: qsTr("text")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 12
        PropertyAnimation { id: animationtext3; target: text3; property: "opacity"; to: 1; from: 0; duration: 200 }
    }

    MouseArea {
        id: mouse_area1
        x: 0
        y: 0
        width: 50
        height: 180
        onClicked: barclicked()
    }
}
