// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: barGraphDelegate

    width:50
    height:170


    function getTodaysText(){
        var today = run_date
        var year = today.slice(0,4);
        var month = today.slice(5,7);
        var day = today.slice(8,10);
        var date = new Date(parseInt(year),parseInt(month),parseInt(day))
        var days = ['S','M','T','W','T','F','S']

        console.log(year)
        console.log(month)
        console.log(day)
        text1.text = days[date.getDay()];
        text2.text = day
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
        height: parseFloat(run_distance)*11
        anchors.horizontalCenter: parent.horizontalCenter
        y: 140 - parseFloat(run_distance)*11
        border { left: 15; top: 15; right: 15; bottom: 15}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "images/graphBarBorderImage.png"
        PropertyAnimation {id: animation; target: barimage; property: "scale"; from: 0; to: 1; duration: 1000}

    }
    Text {
        Component.onCompleted: animationtext.start()
        id: text1
        x: -29
        y: 129
        color: "#bfe4d5"
        text: run_date
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Futura"
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        opacity:1
        PropertyAnimation {id: animationtext; target: text1; property: "opacity"; from: 0; to: 1; duration: 200}
    }

    Text {
        Component.onCompleted: animationtext2.start()
        id: text2
        x: 14
        y: 156
        width: 23
        height: 14
        color: "#bfe4d5"
        text: qsTr("text")
        font.pixelSize: 12
         PropertyAnimation {id: animationtext2; target: text2; property: "opacity"; from: 0; to: 1; duration: 200}
    }
}
