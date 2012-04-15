// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: dateWidget
    height: textCol.height
    width: textCol.width

    property string currentLanguage: appVar.currentLanguage
    onCurrentLanguageChanged: getDate()

    property string day
    property string date
    property string month
    property string year

    function getDate() {
        var today = new Date();
        day = getDayName(today.getDay(), currentLanguage)
        date = today.getDate()
        date += getSuffix()
        month = getMonthName(today.getMonth(), currentLanguage)
        year = today.getFullYear();
    }

    function getDayName(day, language) {
        var dayNames = {
            English: {
                day_names: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            },
            Español: {
                day_names: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']
            }
        }

        return dayNames[language].day_names[day]
    }

    function getSuffix() {
        if(currentLanguage == "Español") return "º"

        var ones = date % 10
        var tens = (date - ones) / 10

        if(tens === 1) return 'th'
        switch(ones) {
            case 1: return 'st'
            case 2: return 'nd'
            case 3: return 'rd'
            default: return 'th'
        }
    }

    function getMonthName(month, language) {
        var monthNames = {
            English: {
                month_names: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
            },
            Español: {
                month_names: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octobre', 'Noviembre', 'Deciembre']
            }
        }

        return monthNames[language].month_names[month]
    }

    Component.onCompleted: getDate();

    Column {
        id: textCol
        height: dateText.height + mnthYearText.height + spacing
        width: (dateText.width > mnthYearText.width) ? dateText.width : mnthYearText.width
        spacing: 2

        StdText {
            id: dateText
            font.pointSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            state: "blue"
            text: day + " --- " + date
        }

        StdText {
            id: mnthYearText
            font.pointSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            state: "blue"
            text: month + ", " + year
        }
    }
}
