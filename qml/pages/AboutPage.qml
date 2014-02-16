import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.Portrait + Orientation.Landscape + Orientation.LandscapeInverted

    SilicaFlickable {
        id: flickable
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator { flickable: flickable }

        Column {
            id: column

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - (2 * Theme.paddingLarge)
            spacing: Theme.paddingLarge

            PageHeader {
                title: "Roman Calculator"
            }
            Label {
                text: "Version 0.1"
                wrapMode: TextEdit.WordWrap
                width: parent.width
                //color: Theme.secondaryHighlightColor
            }
            Label {
                text: "By Jussi Vuorisalmi, <a href=\"mailto:jussi.vuorisalmi@iki.fi?subject=About%20Roman%20Calculator\">jussi.vuorisalmi@iki.fi</a>"
                //color: Theme.secondaryHighlightColor
                wrapMode: TextEdit.WordWrap
                width: parent.width
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
            PageHeader {
                title: "Abour Roman Numbers"
            }
            Label {
                text: page.__romanExplanation
                wrapMode: TextEdit.WordWrap
                width: parent.width
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
        }

    }

    property string __romanExplanation: "<p>Roman numbers have quite a few limitations. \
Therefore, some choises had to be made for the calculator.</p>\
<p><font color='#70bbff'><b>Limitations and errors</b></font></p>\
<ul><li>Roman numbers cannot be negative: e.g., <font color='#70bbff'><i>X - L</i></font> results an error.\
<li>Roman numbers only support integers: the calculator only takes the integer part of an equation as a result. \
<li>Roman numbers do not have a zero: here, a relaxed approach has been chosen and a zero value is shown as <i>empty</i>.\
<li>The numbers become easily very long: <font color='#70bbff'><i>M × M</i></font> already results \
one thousand <font color='#70bbff'><i>M</i></font> characters. \
The maximum size of the number that the calculator shows is <font color='#70bbff'><i>X × M × M (=10000000)</i></font>. \
That's already 10000 <font color='#70bbff'><i>M</i></font>s to pan up and down.\
</ul>\
<p>If you feel this seriously limits your calculations, you probably should not be using the Roman numbers \
in the first place.</p>\
<p><font color='#70bbff'><b>Parsing the numbers</b></font></p>\
<p>Usually, the Roman numbers are shown so that larger digits are printed before (on the left of) the smaller ones. \
E.g., all the <font color='#70bbff'><i>M</i></font>s come first, followed by the possible \
<font color='#70bbff'><i>D</i></font>s and so on.</p>\
<p>The Roman Calculator allows you to enter digits in a more relaxed order. You can always normalize \
the number that you just entered with the <font color='#70bbff'>=</font> button.</p>\
<p>Some examples of parsing the numbers:</p>\
<ul><li>You can enter <font color='#70bbff'><i>70</i></font> as <font color='#70bbff'><i>XXXXXXX</i></font> \
and get a normalized form <font color='#70bbff'><i>LXX</i></font> by hitting <font color='#70bbff'>=</font>.\
<li>Often, the digits can be entered in any order, e.g. <font color='#70bbff'><i>CVCV = VCVC = CCVV</i></font> \
i.e. <font color='#70bbff'>210</font>.\
<li>However, with subtractive digits this is not always the case, e.g. \
<font color='#70bbff'><i>XCXC ≠ CXCX</i></font>. In this case the numbers are parsed as \
<font color='#70bbff'><i>XC XC = 180</i></font> and <font color='#70bbff'>C XC X = 200</font>.\
<li>Subtractive digits (e.g. <font color='#70bbff'><i>I</i></font> in <font color='#70bbff'><i>IV = 4</i></font>) \
are applied in first possible (left-most) position. \
E.g. <font color='#70bbff'><i>IXC</i></font> is intepreted as <font color='#70bbff'><i>IX C (=109)</i></font> \
and <b>not</b> as <font color='#70bbff'><i>I XC (=91)</i></font>.\
</ul>\
<p>If interested, see <a href=\"http://en.wikipedia.org/wiki/Roman_numerals\">the Wikipedia article about the Roman numerals</a>.</p>\
"
}
