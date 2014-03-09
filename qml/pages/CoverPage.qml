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

