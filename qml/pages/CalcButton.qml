import QtQuick 2.0

Item {
    id: calcButton

    property string name: "menu" // name of the button, same string as in the icon file
    property string oper: ""
    signal clicked

    // TODO
    width: 96
    height: 96

    // TODO: replace with something better
    Rectangle {
        id: highlightImage
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "#ffaa00"
        visible: false
    }

    // Calculator button that shows the corresponding icon (the normal case)
    Image {
        source: "../icons/icon_" + name + "_64.png"
        anchors.centerIn: parent
    }


    MouseArea {
        id: mouseArea
        anchors.centerIn: parent
        width: 96
        height: 96

        onPressed: {
            highlightImage.visible = true;
        }
        onReleased: {
            highlightImage.visible = false;
            calcButton.clicked();
        }
    }
}
