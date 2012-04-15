import QtQuick 1.1

Item {
    id: inputView
    opacity: (hideView) ? 0 : 1

    property bool hideView: true

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    function toggleHide() {
        hideView = !hideView
    }
}
