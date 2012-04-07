/*************************************************************************
* AppStates.qml
* CS422 Project 1 - Vending Machine App
*
* by Paulo Guerra / pguerra2
*
*************************************************************************/

import QtQuick 1.1

// this file contains a Qt Object holding all information to be reused among items
// created for the complete application
// this information includes the current product charateristics
// common colors used among the complete application
// current currency
// current langauge
// current xml file being used as database
// an array of ingredients that the user would like to avoid
// an boolean variables to keep track of the state of the application
// idea of implementing this object in the application came from the
// QMl Diner Example Application http://projects.developer.nokia.com/QMLRestaurantApp/wiki

QtObject {
    property string currentLanguage:"English"
    property string currentDegreeSystem:"Celsius"
    property string currentDistanceUnit: "K"
    property string currentWeightUnit:"K"


}
