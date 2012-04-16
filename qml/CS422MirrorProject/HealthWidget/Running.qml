import QtQuick 1.1
import Qt 4.7
import "../AppVariables"
import "../UtilityElements"

Item {
    id: item1
    width: 520
    height: 310

    Component.onCompleted: bargraphmodel.reload()

    StdText {
        id: text1
        x: 23
        y: 25
        text: (appVar.currentLanguage === "Español") ? "carrera de hoy" : "today's run"
        font.bold: true
        font.pixelSize: 25
    }



    StdText {
        id: text2
        x: 25
        y: 77
        text: (appVar.currentLanguage ==="Español") ? "tiempo:" : "time:"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        font.bold: true
    }

    StdText {
        id: text3
        x: 201
        y: 77
        text: (appVar.currentLanguage == "Español") ? "distancia:" : "distance:"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        font.bold: true
    }

    StdText {
        id: text4
        x: 355
        y: 77
        text: (appVar.currentLanguage == "Español") ? "calorías:" : "calories:"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        font.bold: true
    }

    StdText {
        x: 30
        y: 128
        width: 29
        height: 124
        text:{
            if(appVar.currentDistanceUnit === "Km") return "10 km 9 km 8 km 7 km 6 km 5 km 4 km 3 km 2 km 1 km";
            else return "7 mi 5.5 mi 5 mi 4.3 mi 3.8 mi 3 mi 2.5 mi 2 mi 1.2 mi 0.6 mi";
        }
        horizontalAlignment: Text.AlignRight
        wrapMode: Text.WordWrap
        font.pixelSize: 10
        font.bold: true
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
                    barinfo.visible = true
                    if(timer1.running) timer1.restart()
                    else timer1.running=true
                }
            }

        }
    }

    Timer{
        id: timer1
        interval: 1500
        running:false;
        repeat: false;
        onTriggered:{
           barinfo.visible = false
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


    StdText {
        id: text5
        x: 83
        y: 77
        width: 109
        height: 20
        state: "white"
        text:{
            var timeTotSec = parseInt(bargraphmodel.get(bargraphmodel.count-1).run_time)/1000
            var timeHrs = parseInt(timeTotSec/3600)
            var timeMin = ((timeTotSec%3600)/60).toFixed(0)
            var timeSec = ((timeTotSec%3600)%60).toFixed(0)
            var returnString = (timeHrs===0)? "":timeHrs+"hrs"
            returnString = returnString + timeMin + "min"
            var retunTimeSec = ((appVar.currentLanguage==="Español"))?timeSec+"seg": timeSec+"sec"
            returnString = returnString + retunTimeSec
            return returnString
        }
        anchors.left: text2.right
        anchors.leftMargin: 10
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 18
        font.bold: true
    }

    StdText {
        id: text6
        x: 261
        y: 77
        width: 83
        height: 20
        state: "white"
        text:{
            var distanceKm = parseFloat(bargraphmodel.get(bargraphmodel.count-1).run_distance)

            if(appVar.currentDistanceUnit === "Km") return distanceKm.toFixed(1) + " km"
            else return (distanceKm*0.62).toFixed(1)+ " mi"
        }
        anchors.left: text3.right
        anchors.leftMargin: 10
        font.pixelSize: 18
        font.bold: true
        verticalAlignment: Text.AlignVCenter
    }

    StdText {
        id: text7
        y: 77
        width: 80
        height: 20
        state: "white"
        text: {
            var caloriesCal = parseFloat(bargraphmodel.get(bargraphmodel.count-1).run_calories)
            return caloriesCal.toFixed(0) + " cal"
        }
        anchors.left: text4.right
        anchors.leftMargin: 10
        font.pixelSize: 18
        font.bold: true
        verticalAlignment: Text.AlignVCenter
    }

    Item{
        id:barinfo
        x: 21
        y: 107
        width: 479
        height: 82
        visible:false

        Rectangle {
            id: rectangle1
            x: -3
            y: 0
            width: 485
            height: 56
            anchors.fill: parent
            color: "#555758"
            opacity: 0.9
            radius: 15
            anchors.bottomMargin: 0
            anchors.leftMargin: -3
            anchors.topMargin: 0
            anchors.rightMargin: -3
            z: 1
        }

        StdText {
            id: textDateDay
            x: 6
            y: 14
            z: 6
            text:{
                var today = bargraphmodel.get(grid.currentIndex).run_date
                var year = today.slice(0,4);
                var month = today.slice(5,7);
                var day = today.slice(8,10);
                var date = new Date(parseInt(year),parseInt(month),parseInt(day)-1)
                 var days = ['Saturday, ','Sunday, ','Monday, ','Tuesday, ','Wednesday, ','Thursday, ','Friday, ']
                var months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC']

                //console.log(year)
                //console.log(today)
                return days[date.getDay()]
                //textDateDayNumber.text = day
                //textDateMonth.text = months[parseInt(month-1)]
                //console.log(date.getDay())

            }

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
        }
        StdText {
            id: textDateDayNum
            y: 14
            z: 6
            text:{
                var today = bargraphmodel.get(grid.currentIndex).run_date
                var year = today.slice(0,4);
                var month = today.slice(5,7);
                var day = today.slice(8,10);
                var date = new Date(parseInt(year),parseInt(month),parseInt(day)-1)
                 var days = ['Saturday ','Sunday ','Monday ','Tuesday ','Wednesday ','Thursday ','Friday ']
                var months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC']

                //console.log(year)
                //console.log(today)
                return day
                //textDateDayNumber.text = day
                //textDateMonth.text = months[parseInt(month-1)]
                //console.log(date.getDay())

            }
            anchors.left: textDateDay.right
            anchors.leftMargin: 0

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
        }

        StdText {
            id: text8
            x: 6
            y: 43
            text: (appVar.currentLanguage === "Español") ? "tiempo:" : "time:"
            z: 4
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
        }

        StdText {
            id: text9
            x: 180
            y: 43
            text: (appVar.currentLanguage === "Español") ? "distancia:" : "distance:"
            z: 5
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
        }

        StdText {
            id: text10
            x: 335
            y: 43
            text: (appVar.currentLanguage === "Español") ? "calorías:" : "calories:"
            z: 6
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
        }
        StdText {
            id: text11
            x: 457
            y: 41
            width: 109
            height: 20
            state: "white"
            text:{
                var timeTotSec = parseInt(bargraphmodel.get(grid.currentIndex).run_time)/1000
                var timeHrs = parseInt(timeTotSec/3600)
                var timeMin = ((timeTotSec%3600)/60).toFixed(0)
                var timeSec = ((timeTotSec%3600)%60).toFixed(0)
                var returnString = (timeHrs===0)? "":timeHrs+"hrs"
                returnString = returnString + timeMin + "min"
                var retunTimeSec = ((appVar.currentLanguage==="Español"))?timeSec+"seg": timeSec+"sec"
                returnString = returnString + retunTimeSec
                return returnString
            }
            anchors.verticalCenterOffset: 0
            anchors.left: text8.right
            anchors.leftMargin: 6
            anchors.verticalCenter: text8.verticalCenter
            z: 3
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            font.bold: true
        }

        StdText {
            id: text12
            x: 667
            y: 41
            width: 83
            height: 20
            state: "white"
            text:{
                var distanceKm = parseFloat(bargraphmodel.get(grid.currentIndex).run_distance)
                if(appVar.currentDistanceUnit === "Km") return distanceKm.toFixed(1) + " km"
                else return (distanceKm*0.62).toFixed(1)+ " mi"
            }
            anchors.verticalCenterOffset: 0
            anchors.left: text9.right
            anchors.leftMargin: 6
            anchors.verticalCenter: text9.verticalCenter
            z: 1
            font.pixelSize: 18
            font.bold: true
            verticalAlignment: Text.AlignVCenter
        }

        StdText {
            id: text13
            x: 830
            y: 39
            width: 80
            height: 20
            state: "white"
            text: {
                var caloriesCal = parseFloat(bargraphmodel.get(grid.currentIndex).run_calories)
                return caloriesCal.toFixed(0) + " cal"
            }
            anchors.verticalCenterOffset: 0
            anchors.left: text10.right
            anchors.leftMargin: 6
            anchors.verticalCenter: text10.verticalCenter
            z: 2
            font.pixelSize: 18
            font.bold: true
            verticalAlignment: Text.AlignVCenter
        }
    }
}
