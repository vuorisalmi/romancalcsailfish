/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
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

    Calculator {
        id: calculator
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "Show Page 2"
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "UI Template"
            }

            Label {
                id: romanLabel
                text: calculator.romanExpression
                // TODO: ...
                width: 500
                wrapMode: TextEdit.WrapAnywhere
                horizontalAlignment: TextEdit.AlignRight
                verticalAlignment: TextEdit.AlignBottom
            }



            Row {
                spacing: 10
                //CalcButton {
                //    name: "menu"
                //    onClicked: (calcMenu.status === DialogStatus.Closed) ? calcMenu.open() : calcMenu.close() }
                //NoButton {
                //}
                CalcButton {
                    name: "CLR"
                    onClicked: { calculator.pressClear(); }
                }
                CalcButton {
                    name: "BkSp"
                    onClicked: { calculator.pressBackspace(); }
                }
            }
            Row {
                spacing: 10
                CalcButton {
                    name: "plus"
                    oper: "+"
                    onClicked: { calculator.pressOper(oper); }
                }
                CalcButton {
                    name: "minus"
                    oper: "−" // not "-"
                    onClicked: { calculator.pressOper(oper); }
                }
                CalcButton {
                    name: "multiply"
                    oper: "×"
                    onClicked: { calculator.pressOper(oper); }
                }
                CalcButton {
                    name: "divide"
                    oper: "÷"
                    onClicked: { calculator.pressOper(oper); }
                }
            }
            Row {
                spacing: 10
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
            }
            Row {
                spacing: 10
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
                    name: "equals"
                    oper: "="
                    onClicked: { calculator.pressEquals(); }
                }
            }

        }
    }
}


