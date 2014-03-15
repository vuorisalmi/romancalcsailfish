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
        visible: name !== "empty" && !highlight
    }
    // Icon shown in highlight color
    RGBIcon {
        id: rgbIcon
        color: (highlight && !highlightImage.visible) ? Theme.highlightColor : "white"
        source: "../icons/icon_" + name + "_?_64.png"
        anchors.centerIn: parent
        visible: highlight
        width: 64; height: 64
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
