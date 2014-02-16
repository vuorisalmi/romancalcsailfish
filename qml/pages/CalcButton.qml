import QtQuick 2.0
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0

Item {
    id: calcButton

    property string name: "menu" // name of the button, same string as in the icon file
    property string oper: ""
    property bool highlight: false
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
        color: Theme.highlightColor
        visible: false
    }

    // Calculator button that shows the corresponding icon (the normal case)
    Image {
        id: icon
        source: "../icons/icon_" + name + "_64.png"
        anchors.centerIn: parent
        visible: name !== "empty"
    }
    ColorOverlay {
        anchors.fill: icon
        source: icon
        color: highlight ? Theme.highlightColor : "transparent"
    }

    MouseArea {
        id: mouseArea
        anchors.centerIn: parent
        width: 96
        height: 96
        property int _minRelease: -8      // accept button release within mouse area +8 pixes,
        property int _maxRelease: 96 + 8  // assume square area

        onPressed: {
            highlightImage.visible = true && name !== "empty";
        }
        onReleased: {
            highlightImage.visible = false;
            if (mouse.x >= _minRelease && mouse.x < _maxRelease &&
                    mouse.y >= _minRelease && mouse.y < _maxRelease) {
                calcButton.clicked();
            }
        }
    }
}
