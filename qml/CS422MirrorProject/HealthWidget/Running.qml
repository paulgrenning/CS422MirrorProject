// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt 4.7
import "../AppVariables"

Item {
    id: item1
    width: 520
    height: 310

    Component.onCompleted: bargraphmodel.reload()

    function getMonth(){
        var date = new Date();
        var months = ['January','February','March','April','May','June','July','August','September','October','November','December']
        return months[date.getMonth()]
    }


    Text {
        id: text1
        x: 23
        y: 25
        text: (appVar.currentLanguage == "Español") ? "carrera de hoy" : "today's run"
        font.bold: true
        font.family: "Futura"
        font.pixelSize: 25
        color: "#bfe4d5"
    }



    Text {
        id: text2
        x: 25
        y: 77
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "tiempo:" : "time:"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text3
        x: 201
        y: 77
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "distancia:" : "distance:"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        font.family: "Futura"
        font.bold: true
    }

    Text {
        id: text4
        x: 355
        y: 77
        color: "#bfe4d5"
        text: (appVar.currentLanguage == "Español") ? "calorías:" : "calories:"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        font.bold: true
        font.family: "Futura"
    }

    Text {
        x: 30
        y: 128
        width: 29
        height: 124
        color: "#bfe4d5"
        text:{
            if(appVar.currentDistanceUnit == "Km") return "10 km 9 km 8 km 7 km 6 km 5 km 4 km 3 km 2 km 1 km";
            else return "7 mi 5.5 mi 5 mi 4.3 mi 3.8 mi 3 mi 2.5 mi 2 mi 1.2 mi 0.6 mi";
        }
        horizontalAlignment: Text.AlignRight
        wrapMode: Text.WordWrap
        font.pixelSize: 10
        font.bold: true
        font.family: "Futura"
    }



    Rectangle {
        id: clipGraph
        x: 69
        y: 128
        width: 403
        height: 169
        color: "#00000000"
        clip: true
        ListView{
            id: grid
            width: 403
            height: 169
            keyNavigationWraps: true
            highlightMoveSpeed: 50000
            orientation: ListView.Horizontal
            x: 0
            y: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            flickableDirection: Flickable.HorizontalFlick
            model: bargraphmodel
            highlight: Rectangle { color: "white"; radius:3; opacity:0.2; height: 130; }
            highlightFollowsCurrentItem: true
            onCurrentIndexChanged:{
                if(currentIndex == 0){
                    decrementCurrentIndex()
                }
                console.log(bargraphmodel.get(count-1).run_time)
            }
            delegate: RunGraphDelegate{
                id:bargraphdelegate
                barImageHeight: parseFloat(run_distance)*14
                barImageY:{
                    return 140 - parseFloat(run_distance)*14
                }
                runDate: run_date
                onBarclicked: {
                    grid.currentIndex = grid.indexAt(x,y)
                }
            }

        }
    }

    XmlListModel {
        id: bargraphmodel
        source: "runplus.xml"
        //source: "http://nikeplus.nike.com/nikeplus/v1/services/widget/get_public_run_list.jsp?userID=340599345"
        query: "/plusService/runList/run"
        XmlRole { name: "run_distance"; query: "distance/string()" }
        XmlRole { name: "run_time"; query: "duration/string()" }
        XmlRole { name: "run_calories"; query: "calories/string()" }
        XmlRole { name: "run_date"; query: "startTime/string()" }
    }


    Text {
        id: text5
        x: 83
        y: 77
        width: 109
        height: 20
        color: "#eefff9"
        text:{
            var timeTotSec = parseInt(bargraphmodel.get(bargraphmodel.count-1).run_time)/1000
            var timeHrs = parseInt(timeTotSec/3600)
            var timeMin = ((timeTotSec%3600)/60).toFixed(0)
            var timeSec = ((timeTotSec%3600)%60).toFixed(0)
            var returnString = (timeHrs===0)? "":timeHrs+"hrs"
            returnString = returnString + timeMin + "min"
            var retunTimeSec = ((appVar.currentLanguage=="Español"))?timeSec+"seg": timeSec+"sec"
            returnString = returnString + retunTimeSec
            return returnString
        }
        anchors.left: text2.right
        anchors.leftMargin: 10
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 18
        font.bold: true
        font.family: "Futura"
    }

    Text {
        id: text6
        x: 261
        y: 77
        width: 83
        height: 20
        color: "#eefff9"
        text:{
            var distanceKm = parseFloat(bargraphmodel.get(bargraphmodel.count-1).run_distance)
            return  distanceKm.toFixed(1) + " km"
        }
        anchors.left: text3.right
        anchors.leftMargin: 10
        font.pixelSize: 18
        font.family: "Futura"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text7
        y: 77
        width: 80
        height: 20
        color: "#eefff9"
        text: {
            var caloriesCal = parseFloat(bargraphmodel.get(bargraphmodel.count-1).run_calories)
            return caloriesCal.toFixed(0) + " cal"
        }
        anchors.left: text4.right
        anchors.leftMargin: 10
        font.pixelSize: 18
        font.bold: true
        font.family: "Futura"
        verticalAlignment: Text.AlignVCenter
    }
}
