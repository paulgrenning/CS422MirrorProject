// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../UtilityElements"

Widget {
    id: dateWidget
    height: dateText.height
    width: dateText.width

    property string day
    property string date
    property string month
    property string year

    function getDate() {
        var today = new Date();
        day = getDayName(today.getDay(), appVar.currentLanguage)
        date = today.getDate()
        date += getSuffix()
        month = getMonthName(today.getMonth(), appVar.currentLanguage)
        year = today.getFullYear();
    }

    function getDayName(day, language) {
        var dayNames = {
            English: {
                day_names: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            },
            Spanish: {
                day_names: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']
            }
        }

        return dayNames[language].day_names[day]
    }

    function getSuffix() {
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
            Spanish: {
                month_names: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octobre', 'Noviembre', 'Deciembre']
            }
        }

        return monthNames[language].month_names[month]
    }

    Component.onCompleted: getDate();

    StdText {
        id: dateText
        font.pointSize: 28
        horizontalAlignment: Text.AlignRight
        text: day + " --- " + date + "\n" + month + ", " + year
    }
}
