import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Roman Calculator"
            }
            Label {
                text: "Version 0.1"
                color: Theme.secondaryHighlightColor
            }
            Label {
                text: "By Jussi Vuorisalmi, <a href=\"mailto:jussi.vuorisalmi@iki.fi?subject=About%20Roman%20Calculator\">jussi.vuorisalmi@iki.fi</a>"
                color: Theme.secondaryHighlightColor
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }

        }

    }
}
