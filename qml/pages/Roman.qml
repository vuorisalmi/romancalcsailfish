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

import "romanhelp.js" as RH

Item {
    id: roman

    property string romanValue: ""
    property int decValue: 0

    function clear() {
        romanValue = "";
        decValue = 0;
    }

    function setRoman(newStr) {
        // TODO
    }

    function setDec(newNum) {
        // TODO
        try {
            romanValue = RH.dec2roman(newNum);
            decValue = Math.floor(newNum);
        } catch (e) {
            console.log("Roman.qml cannot setDec: " + newNum);
            console.log(e.name + ": " + e.message);
            throw e;
        }

    }

    // Append (add) new character(s) at the end of the current roman number string
    function append(newStr) {
        //var startTime, endTime;
        //var d = new Date();

        var tmpValue = romanValue + newStr;
        try {
            //startTime = d.getTime();
            decValue = RH.roman2dec(tmpValue);
            //d = new Date();
            //endTime = d.getTime();
            //console.log("Roman.append: startTime: " + startTime);
            //console.log("Roman.append: endTime:   " + endTime);
            //console.log("Roman.append: roman2dec " + (endTime-startTime) + " ms");
        } catch (e) {
            console.log("Roman.append: cannot append: " + newStr);
            console.log(e.name + ": " + e.message);
            throw e;
        }
        romanValue = tmpValue;
    }

    function removeLast() {
        romanValue = romanValue.slice(0, romanValue.length - 1);
        decValue = RH.roman2dec(romanValue);
    }
}
