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

Item {
    id: calculator

    property string romanExpression: roman1 + ((oper === "") ? "" : (" " + oper + ((dec2 === 0) ? "": (" " + roman2))))
    property string decExpression: dec1 + ((oper === "") ? "" : (" " + oper + ((dec2 === 0) ? "" : (" " + dec2))))
    property alias roman1: value1.romanValue
    property alias roman2: value2.romanValue
    property alias dec1: value1.decValue
    property alias dec2: value2.decValue
    property string oper: ""
    property bool isError: (error !== "")
    property string error: ""
    property string fullError: ""
    property int maxRoman: 10000000
    property string _maxRomanString: "M×M×X"

    Roman {
        id: value1
    }
    Roman {
        id: value2
    }

    function pressRoman(romanStr) {
        clearError();
        try {
            if (oper === "") {
                value1.append(romanStr);
            } else {
                value2.append(romanStr);
            }
        }
        catch (e) {
            setError(e);
        }
    }

    function pressOper(oper) {
        clearError();
        if (dec1 !== 0 && dec2 === 0) {
            calculator.oper = oper;
        } else if (dec1 !== 0 && dec2 !== 0) {
            try {
                evaluate();
                if (dec1 !== 0) {
                    calculator.oper = oper;
                }
            } catch (e) {
                setError(e);
            }
        }
        // else: if both are zero, do nothing
    }

    function pressEquals() {
        try {
            clearError();
            evaluate();
        } catch (e) {
            setError(e);
        }
    }

    function pressBackspace() {
        clearError();
        if (dec1 !== 0 && oper === "" && dec2 === 0) {
            value1.removeLast();
        } else if (dec1 !== 0 && oper !== "" && dec2 === 0) {
            oper = "";
        } else if (dec2 !== 0) {
            value2.removeLast();
        }
    }

    function pressClear() {
        value1.clear();
        value2.clear();
        oper = "";
        clearError();
    }

    function setError(e) {
        fullError = e.name + ": " + e.message;
        error = e.message;
    }

    function clearError() {
        error = "";
    }

    function evaluate() {
        var result;

        if (dec1 === 0 && dec2 === 0) {
            result = 0;
        } else if (dec2 === 0) {
            result = dec1;
        } else {
            if (oper === "+") {
                result = dec1 + dec2;
            } else if (oper === "-" || oper === "−") {
                result = dec1 - dec2;
            } else if (oper === "*" || oper === "×") {
                result = dec1 * dec2;
            } else if (oper === "/" || oper === "÷") {
                result = dec1 / dec2;
            } else {
                result = 0;
            }
        }

        if (result > maxRoman) {
            throw {
                name: "ValueError",
                message: "Too large number, max is " + _maxRomanString + " (" + maxRoman + ")"
            };
        } else {
            value1.setDec(result);
            value2.clear();
            oper = "";
        }
    }
}
