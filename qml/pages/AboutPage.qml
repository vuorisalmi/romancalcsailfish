/*
  Copyright (c) 2013-2014, Jussi Vuorisalmi <jussi.vuorisalmi@iki.fi>
  All rights reserved.

  This file is part of the romancalcsailfish (harbour-romancalc) package.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
      * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
      * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.
      * Neither the name of the <organization> nor the
        names of its contributors may be used to endorse or promote products
        derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

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
                text: "Version 1.0.0"
                color: Theme.highlightColor
                wrapMode: TextEdit.WordWrap
                width: parent.width
            }
            Label {
                text: "By Jussi Vuorisalmi, <a href=\"mailto:jussi.vuorisalmi@iki.fi?subject=About%20Roman%20Calculator\">jussi.vuorisalmi@iki.fi</a>"
                color: Theme.highlightColor
                linkColor: "#ffffff"
                wrapMode: TextEdit.WordWrap
                width: parent.width
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
            Label {
                text: __aboutExplanation
                color: Theme.highlightColor
                wrapMode: TextEdit.WordWrap
                width: parent.width
            }
            Label {
                text: __srcExplanation
                color: Theme.highlightColor
                linkColor: "#ffffff"
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
                color: Theme.highlightColor
                linkColor: "#ffffff"
                wrapMode: TextEdit.WordWrap
                width: parent.width
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
        }

    }

    property string __aboutExplanation: "The Roman Calculator is my personal application porting \
test/example for different platforms. It was originally written in Python/Qt for the Nokia Maemo platform \
and later re-written on QML/JavaScript for MeeGo/N9. That was easily ported to SailfishOS."

    property string __srcExplanation: "Source code available in \
<a href=\"https://github.com/vuorisalmi/romancalcsailfish\">https://github.com/vuorisalmi/romancalcsailfish</a> \
under the terms of BSD license."

    property string __romanExplanation: "Roman numbers have quite a few limitations. \
Therefore, some choises had to be made for the calculator.\
<p><h3>Limitations and errors</h3>\
<ul><li>Roman numbers cannot be negative: e.g., <font color='#ffffff'><i>X - L</i></font> results an error.\
<li>Roman numbers only support integers: the calculator only takes the integer part of an equation as a result. \
<li>Roman numbers do not have a zero: here, a relaxed approach has been chosen and a zero value is shown as <i>empty</i>.\
<li>The numbers become easily very long: <font color='#ffffff'><i>M × M</i></font> already results \
one thousand <font color='#ffffff'><i>M</i></font> characters. \
The maximum size of the number that the calculator shows is <font color='#ffffff'><i>X × M × M (=10000000)</i></font>. \
That's already 10000 <font color='#ffffff'><i>M</i></font>s to pan up and down.\
</ul>\
<p>If you feel this seriously limits your calculations, you probably should not be using the Roman numbers \
in the first place.\
<p><h3>Parsing the numbers</h3>\
<p>Usually, the Roman numbers are shown so that larger digits are printed before (on the left of) the smaller ones. \
E.g., all the <font color='#ffffff'><i>M</i></font>s come first, followed by the possible \
<font color='#ffffff'><i>D</i></font>s and so on.</p>\
<p>The Roman Calculator allows you to enter digits in a more relaxed order. You can always normalize \
the number that you just entered with the <font color='#ffffff'>=</font> button.</p>\
<p>Some examples of parsing the numbers:</p>\
<ul><li>You can enter <font color='#ffffff'><i>70</i></font> as <font color='#ffffff'><i>XXXXXXX</i></font> \
and get a normalized form <font color='#ffffff'><i>LXX</i></font> by hitting <font color='#ffffff'>=</font>.\
<li>Often, the digits can be entered in any order, e.g. <font color='#ffffff'><i>CVCV = VCVC = CCVV</i></font> \
i.e. <font color='#ffffff'>210</font>.\
<li>However, with subtractive digits this is not always the case, e.g. \
<font color='#ffffff'><i>XCXC ≠ CXCX</i></font>. In this case the numbers are parsed as \
<font color='#ffffff'><i>XC XC = 180</i></font> and <font color='#ffffff'>C XC X = 200</font>.\
<li>Subtractive digits (e.g. <font color='#ffffff'><i>I</i></font> in <font color='#ffffff'><i>IV = 4</i></font>) \
are applied in first possible (left-most) position. \
E.g. <font color='#ffffff'><i>IXC</i></font> is intepreted as <font color='#ffffff'><i>IX C (=109)</i></font> \
and <b>not</b> as <font color='#ffffff'><i>I XC (=91)</i></font>.\
</ul>\
<p>If interested, see <a href=\"http://en.wikipedia.org/wiki/Roman_numerals\">the Wikipedia article about the Roman numerals</a>.</p>\
"
}
