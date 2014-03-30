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

    property Calculator calculator

    // Page and element sizes and other constants
    property int _decHeight: Theme.fontSizeSmall  // hight of the deciman number display
    property int _keyButtonSize: 96  // hight == width
    property int _keypadPadding5Buttons: (Screen.width - (5 * _keyButtonSize)) / 6  // padding for a 5-button row/column
    property int _keypadPadding5ButtonsAndDec: (Screen.width - _decHeight - (5 * _keyButtonSize)) / 7
    property int _keypadPaddingH: page.isPortrait ? _keypadPadding5Buttons : Theme.paddingMedium  // horizontal padding
    property int _keypadPaddingV: page.isPortrait ? Theme.paddingMedium : _keypadPadding5ButtonsAndDec  // vertical padding
    //property int _keypadHeight: page.isPortrait ? ((3 * _keyButtonSize) + (4 * _keypadPaddingV)) + (_showDec && (_decHeight + _keypadPaddingV)) : page.height
    property int _keypadHeight: page.isPortrait ? ((3 * _keyButtonSize) + (4 * _keypadPaddingV)) : page.height
    property int _keypadWidth: page.isPortrait ? page.width : ((3 * _keyButtonSize) + (4 * _keypadPaddingH))

    property bool _showDec: false

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        id: flickable
        //anchors.fill: parent
        anchors.top: parent.top
        anchors.left: parent.left
        width: page.isPortrait ? page.width : (page.width - _keypadWidth)
        height: page.height

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu { 
            MenuItem {
                text: "About Roman Calculator"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: _showDec ? "Hide decimal expression" : "Show decimal expression"
                onClicked: { _showDec = !_showDec }
            }
            MenuItem {
                text: "Copy to clipboard"
                onClicked: { Clipboard.text = calculator.romanExpression; }
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        VerticalScrollDecorator { flickable: flickable }

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: flickable.width - (2 * Theme.paddingLarge)
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 0

            // Add some space to the top
            Item {
                width: parent.width
                height: Theme.paddingLarge
            }

            Label {
                id: romanLabel
                text: calculator.romanExpression
                width: parent.width
                wrapMode: TextEdit.WrapAnywhere
                horizontalAlignment: TextEdit.AlignRight
                verticalAlignment: TextEdit.AlignBottom
                color: Theme.highlightColor
                font.pixelSize: (text.length > 300) ? Theme.fontSizeMedium : Theme.fontSizeLarge
            }

            // Add lots of space to the bottom -- allow pulling the roman expression
            // high enough so that it is not covered by the keypad
            Item {
                width: parent.width
                height: _keypadHeight + Theme.paddingMedium + (_showDec && (_decHeight + _keypadPaddingV))
                visible: page.isPortrait // only goes under the keypad in portrait mode
            }
        }
    }

    // Error messages
    Rectangle {
        z: 2
        width: parent.width
        height: errorLabel.height
        anchors.top: parent.top
        anchors.left: parent.left
        color: Theme.highlightColor
        opacity: 0.8
        visible: calculator.isError
    }
    Label {
        id: errorLabel
        z: 2
        width: parent.width
        anchors.top: parent.top
        anchors.left: parent.left
        text: "Error: " + calculator.error
        color: "black"
        font.pixelSize: Theme.fontSizeSmall
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        visible: calculator.isError
    }

    // Non-pannable area with the calculator keypad
    Item {
        id: keypadbg
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: _keypadWidth
        height: _keypadHeight

        states: [
            State {
                name: "decHidden"
                when: !_showDec
                PropertyChanges { target: decLabel; opacity: 0.0 }
                PropertyChanges { target: decBackground; opacity: 0.0 }
            },
            State {
                name: "decVisible"
                when: _showDec
                PropertyChanges { target: decLabel; opacity: 1.0 }
                PropertyChanges { target: decBackground; opacity: 0.4 } // 0.4 is the same as keypad BG opacity
            }
        ]

        transitions: [
            Transition {
                from: "decHidden"
                to: "decVisible"
                SequentialAnimation {
                    PropertyAnimation { properties: "opacity"; duration: 500 }
                }
            },
            Transition {
                from: "decVisible"
                to: "decHidden"
                SequentialAnimation {
                    PropertyAnimation { properties: "opacity"; duration: 500 }
                }
            }
        ]

        // Background fill of the keypad
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.4
        }
        // Background fill of the decimal expression -- not always visible
        Rectangle {
            id: decBackground
            visible: page.isPortrait  // portrait/landscape visibility not handled by the states/transitions
            anchors.bottom: parent.top
            anchors.left: parent.left
            width: parent.width
            height: _decHeight + _keypadPaddingV
            color: "#000000"
            //opacity: 0.4
        }
        // Decimal expression label -- not always visible
        Label {
            id: decLabel
            anchors.top: (page.isLandscape) ? parent.top : decBackground.top
            anchors.right: parent.right
            anchors.topMargin: _keypadPaddingV
            anchors.rightMargin: Theme.paddingLarge
            height: _decHeight
            text: calculator.decExpression
            font.pixelSize: Theme.fontSizeSmall
            color: Theme.secondaryColor
            horizontalAlignment: Text.AlignRight
        }

        // Portrait version
        Column {
            width: keypadbg.width
            spacing: _keypadPaddingV
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: _keypadPaddingH
            anchors.topMargin: _keypadPaddingV
            visible: page.isPortrait

            Row {
                spacing: _keypadPaddingH
                CalcButton {
                    name: "multiply"
                    oper: "×"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
                CalcButton {
                    name: "divide"
                    oper: "÷"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
                CalcButton {
                    name: "plus"
                    oper: "+"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
                CalcButton {
                    name: "minus"
                    oper: "−" // not "-"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
                CalcButton {
                    name: "equals"
                    oper: "="
                    highlight: true
                    onClicked: { calculator.pressEquals(); }
                }
            }
            Row {
                spacing: _keypadPaddingH
                CalcButton {
                    name: "L"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "C"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "D"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "M"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "BkSp"
                    highlight: true
                    onClicked: { calculator.pressBackspace(); }
                }
            }
            Row {
                spacing: _keypadPaddingH
                CalcButton {
                    name: "I"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "V"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "X"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "empty"
                }
                CalcButton {
                    name: "CLR"
                    highlight: true
                    onClicked: { calculator.pressClear(); }
                }
            }
        } // Column, portrait version

        // Landscape version
        Column {
            width: keypadbg.width
            spacing: _keypadPaddingV
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: _keypadPaddingH
            anchors.topMargin: _keypadPaddingV
            visible: page.isLandscape

            Item {
                width: parent.width
                height: _decHeight
            }

            Row {
                spacing: _keypadPaddingH
                CalcButton {
                    name: "CLR"
                    highlight: true
                    onClicked: { calculator.pressClear(); }
                }
                CalcButton {
                    name: "BkSp"
                    highlight: true
                    onClicked: { calculator.pressBackspace(); }
                }
                CalcButton {
                    name: "equals"
                    oper: "="
                    highlight: true
                    onClicked: { calculator.pressEquals(); }
                }
            }
            Row {
                spacing: _keypadPaddingH

                CalcButton {
                    name: "D"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "M"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "multiply"
                    oper: "×"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
            }
            Row {
                spacing: _keypadPaddingH
                CalcButton {
                    name: "L"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "C"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "divide"
                    oper: "÷"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
            }
            Row {
                spacing: _keypadPaddingH
                CalcButton {
                    name: "V"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "X"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "plus"
                    oper: "+"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
            }
            Row {
                spacing: _keypadPaddingH
                CalcButton {
                    name: "I"
                    onClicked: { calculator.pressRoman(name); }
                }
                CalcButton {
                    name: "empty"
                }
                CalcButton {
                    name: "minus"
                    oper: "−" // not "-"
                    highlight: true
                    onClicked: { calculator.pressOper(oper); }
                }
            }
        } // Column, landscape version

    }
}


