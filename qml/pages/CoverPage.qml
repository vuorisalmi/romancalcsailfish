import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

    property Calculator calculator

    TextInput {
        id: invisibleTextInput
        visible: false // exists only for copying to the clipboard
        text: calculator.romanExpression
    }

    Column {
        visible: calculator.romanExpression.length === 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge
        width: parent.width - 2 * Theme.paddingLarge

        Item {
            width: parent.width
            height: appIcon.height
            Image {
                id: appIcon
                source: "../icons/app_icon_128.png"
                width: 128
                height: 128
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Label {
            text: "Roman Calculator"
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.top: parent.top
            width: parent.width //- 2 * Theme.paddingLarge
            horizontalAlignment: Text.AlignHCenter
            wrapMode: TextEdit.WordWrap
        }
    }

    Label {
        id: label
        visible: calculator.romanExpression.length > 0

        anchors.centerIn: parent
        anchors.margins: Theme.paddingLarge
        text: calculator.romanExpression
        wrapMode: TextEdit.WrapAnywhere
        width: parent.width - 2 * Theme.paddingLarge
        height: parent.height - 2 * Theme.paddingLarge
        //elide: Text.ElideRight
        horizontalAlignment: Text.AlignLeft
        truncationMode: TruncationMode.Fade  // does not work, why?
        color: Theme.highlightColor
    }

    CoverActionList {
        id: coverAction

        // TODO: make a bigger icon
        CoverAction {
            iconSource: "../icons/cover_CLR_92.png"
            onTriggered: { calculator.pressClear(); }
        }

        CoverAction {
            iconSource: "image://theme/icon-l-clipboard"
            onTriggered: { invisibleTextInput.selectAll(); invisibleTextInput.copy(); }
        }
    }
}

