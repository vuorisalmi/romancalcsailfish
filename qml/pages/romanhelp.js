.pragma library

var ROMAN_VALUES = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}

var ROMAN_SYMBOLS = {
    1:    "I",
    5:    "V",
    10:   "X",
    50:   "L",
    100:  "C",
    500:  "D",
    1000: "M",
}

var ROMAN_VALUE_LIST = [1000, 500, 100, 50, 10, 5, 1];

// The front-end function of the roman2dec conversion ("phase 1").
// Input string can be upper, lower or mixed-case.
function roman2dec(romanStr) {
    // Optimization: parse first all the leading "M"s before doing the rest of the conversion
    // in the recursive phase 2 function. There might be _thousands_ of "M"s as a result of
    // e.g. a "M * M" calculation. The long roman strings are the only one that need
    // optimization, and the long ones (almost) always are just long sequences of "M"s.
    var mPatt = /^(M*)(.*)$/;
    var upperRoman = romanStr.toUpperCase();;
    var rc;
    var mValue;

    rc = mPatt.exec(upperRoman);
    mValue = (rc[1]) ? 1000 * rc[1].length : 0;
    //console.log("roman2dec: found Ms: " + mValue);

    return mValue + roman2decPhase2(rc[2]);
}

// The generic (non-optimized) roman2dec conversion, called by the front-end function above.
// Converts any roman string to a decimal number in a recursive execution.
// The input string needs to be in upper case.
function roman2decPhase2(upperRoman) {
    // Covert one character at a time, or a subtractive symbol and a second character
    // if there is such a combinarion in the beginning of the string.
    var romanPatt = /^([IXC])?([IVXLCDM])(.*)$/;
    //var upperRoman = romanStr;
    var rc;
    var decNumber, subtractive;

    if (upperRoman) {
        //upperRoman = romanStr.toUpperCase();
        rc = romanPatt.exec(upperRoman);
        if (rc === null) {
            throw {
                name: "ValueError",
                message: romanStr + " is not a roman number"
            };
        }

        subtractive = (rc[1]) ? ROMAN_VALUES[rc[1]] : 0;
        decNumber = ROMAN_VALUES[rc[2]];
        if (subtractive >= decNumber) {
            // Both symbols/numbers matched, but the first cannot be used as a subtractive symbol
            // in this case. Use only the first symbol now.
            rc[3] = rc[2] + rc[3];
            decNumber = subtractive;
            subtractive = 0;
        }
        //console.log("roman2dec: " + (decNumber - subtractive) + " " + romanStr);
        return decNumber - subtractive + roman2decPhase2(rc[3]);

    } else {
        //console.log("roman2dec: nothing to convert");
        return 0;
    }
}

// Return the roman number string representing the given decimal value.
// Raises ValueError exception in case of invalid (negative) decimal value.
// If given zero, returns an empty string.
// Only the integer part of the input value is taken into account.
function dec2roman(decValue) {
    var i, j, modVal, count, decRemainder, nextModVal, nextCount, nextRemainder;
    var romanStr = "", prevSymbol = "";

    if (decValue < 0) {
        throw {
            name: "ValueError",
            message: "Negative value cannot be presented as a roman number"
        };
    } else if (decValue === 0) {
        return "";
    } else {
        // TODO
        decRemainder = decValue;
        for (i = 0; i < ROMAN_VALUE_LIST.length; i += 1) {
            //...
            modVal = ROMAN_VALUE_LIST[i];
            count = Math.floor(decRemainder / modVal);
            decRemainder = decRemainder - (count * modVal);

            // check also the next value, for "4"s and "9"s.
            if (! isRomanSubtractive(modVal)) {
                // only need to do this if now calculating for 5xx = "V", "L" or "D"
                nextModVal = ROMAN_VALUE_LIST[i+1];
                nextCount = Math.floor(decRemainder / nextModVal);
                nextRemainder = decRemainder - (nextCount * nextModVal);
            } else {
                nextCount = 0;
                nextRemainder = 0;
            }

            //console.log("dec2roman: " + ROMAN_SYMBOLS[modVal] + " " + count + " " + decRemainder);

            if (count === 1 && nextCount === 4 && prevSymbol !== "") {
                // 9xx
                romanStr = romanStr + ROMAN_SYMBOLS[nextModVal] + prevSymbol;
                decRemainder = nextRemainder;
                //console.log("    case 9xx: " + ROMAN_SYMBOLS[nextModVal] + prevSymbol + " " + nextRemainder);
            } else if (count === 4 && prevSymbol !== "") {
                // 4xx
                romanStr = romanStr + ROMAN_SYMBOLS[modVal] + prevSymbol;
                //console.log("    case 4xx: " + ROMAN_SYMBOLS[modVal] + prevSymbol);
            } else {
                // The regular repeating symbol case, e.g. "XXX"
                for (j = 0; j < count; j += 1) {
                    romanStr = romanStr + ROMAN_SYMBOLS[modVal];
                }
            }
            prevSymbol = ROMAN_SYMBOLS[modVal];
        }
        return romanStr;
    }
}

function isRomanSubtractive(num) {
    return (num === 1 || num === 10 || num === 100);
    // TODO: add support for checking roman symbols as well (needed?)
}
