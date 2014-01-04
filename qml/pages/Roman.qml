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
