// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../AppVariables"

Item {
    id: key_board
    width: 1050
    height: 458
    opacity: inUse ? 1 : 0

    property string inputLabel

    property string input: ""
    property bool shift: false
    property bool sym: false
    property bool isPassword: false
    property bool inUse: true
    property string fontType: "Futura"
    property int fontSize: 32
    property string fontColor: "#7dd9b3"

    signal inputReady(string input)

    function deleteLast(){
        key_board.input = key_board.input.substring(0, key_board.input.length-1)
    }

    function keyPressed(value){
        if(value == "sym"){
            key_board.sym = !key_board.sym;
            key_board.shift = false;
        }
        else if(value == "shift"){
            key_board.shift = !key_board.shift;
        }
        else if(value == "del"){
            key_board.deleteLast();
        }
        else if(value == "done"){
            key_board.inUse = false
        }
        else if(key_board.isPassword == true){
            key_board.input = key_board.input + "*";

            key_board.shift = false;
        }
        else{
            if(value == "space")
                key_board.input = key_board.input + " ";
            else
                key_board.input = key_board.input + value;

            key_board.shift = false;
        }
    }


    Row {
        id: inputField
        y: 25
        width: inputFieldLabel.width + inputBG.width + spacing
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5

        Text {
            id: inputFieldLabel
            height: 49
            text: key_board.inputLabel
            font.pixelSize: 29
        }

        Rectangle {
            id: inputBG
            width: 455
            height: 49
            color: "#eeeeee"

            Text {
                id: inputTxt
                x: 5
                y: 7
                width: 432
                height: 35
                text: key_board.input
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 29
            }

            Cursor {
                id: cursor
                x: 0; y: 5
            }
        }
    }

    Row {
        id: row1
        x: 41; y: 110
        width: 969; height: 84

        Key {
            id: key1
            x: 63; y: 1
            defaultValue: "q"
            shiftValue: defaultValue.toUpperCase()
            symValue: "1"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key2
            x: 124; y: 1
            defaultValue: "w"
            shiftValue: defaultValue.toUpperCase()
            symValue: "2"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key3
            x: 225; y: 1
            defaultValue: "e"
            shiftValue: defaultValue.toUpperCase()
            symValue: "3"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key4
            x: 295; y: 1
            defaultValue: "r"
            shiftValue: defaultValue.toUpperCase()
            symValue: "4"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key5
            x: 364; y: 1
            defaultValue: "t"
            shiftValue: defaultValue.toUpperCase()
            symValue: "5"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key6
            x: 433; y: 1
            defaultValue: "y"
            shiftValue: defaultValue.toUpperCase()
            symValue: "6"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key7
            x: 504; y: 1
            defaultValue: "u"
            shiftValue: defaultValue.toUpperCase()
            symValue: "7"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key8
            x: 607; y: 1
            defaultValue: "i"
            shiftValue: defaultValue.toUpperCase()
            symValue: "8"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key10
            x: 764; y: 1
            defaultValue: "o"
            shiftValue: defaultValue.toUpperCase()
            symValue: "8"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key11
            x: 872; y: 1
            defaultValue: "p"
            shiftValue: defaultValue.toUpperCase()
            symValue: "9"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key32
            x: 952
            y: 1
            width: 128
            clickedPath: "../Keyboard/images/keyClickedMedium.png"
            defaultPath: "../Keyboard/images/keyBackgroundMedium.png"
            defaultValue: "del"
        }
    }

    Row {
        id: row2
        x: 80
        y: 194
        width: 841
        height: 84
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0
        Key {
            id: key12
            x: 63; y: 1
            defaultValue: "a"
            shiftValue: defaultValue.toUpperCase()
            symValue: "!"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key13
            x: 124; y: 1
            defaultValue: "s"
            shiftValue: defaultValue.toUpperCase()
            symValue: "#"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key14
            x: 225; y: 1
            defaultValue: "d"
            shiftValue: defaultValue.toUpperCase()
            symValue: "$"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key15
            x: 295; y: 1
            defaultValue: "f"
            shiftValue: defaultValue.toUpperCase()
            symValue: "%"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key16
            x: 364; y: 1
            defaultValue: "g"
            shiftValue: defaultValue.toUpperCase()
            symValue: "^"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key17
            x: 433; y: 1
            defaultValue: "h"
            shiftValue: defaultValue.toUpperCase()
            symValue: "&"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key18
            x: 504; y: 1
            defaultValue: "j"
            shiftValue: defaultValue.toUpperCase()
            symValue: "*"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key19
            x: 607; y: 1
            defaultValue: "k"
            shiftValue: defaultValue.toUpperCase()
            symValue: "("
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key20
            x: 686; y: 1
            defaultValue: "l"
            shiftValue: defaultValue.toUpperCase()
            symValue: ")"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key21
            x: 764; y: 1
            defaultValue: "@"
        }
    }

    Row {
        id: row3
        x: 123
        y: 278
        width: 756
        height: 84
        anchors.horizontalCenter: parent.horizontalCenter
        Key {
            id: key23
            x: 63; y: 1
            defaultValue: "z"
            shiftValue: defaultValue.toUpperCase()
            symValue: "-"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key24
            x: 124; y: 1
            defaultValue: "x"
            shiftValue: defaultValue.toUpperCase()
            symValue: "_"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key25
            x: 225; y: 1
            defaultValue: "c"
            shiftValue: defaultValue.toUpperCase()
            symValue: "="
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key26
            x: 295; y: 1
            defaultValue: "v"
            shiftValue: defaultValue.toUpperCase()
            symValue: "+"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key27
            x: 364; y: 1
            defaultValue: "b"
            shiftValue: defaultValue.toUpperCase()
            symValue: ";"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key28
            x: 433; y: 1
            defaultValue: "n"
            shiftValue: defaultValue.toUpperCase()
            symValue: ":"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key29
            x: 504; y: 1
            defaultValue: "m"
            shiftValue: defaultValue.toUpperCase()
            symValue: "?"
            shiftPressed: key_board.shift
            symPressed: key_board.sym
        }

        Key {
            id: key30
            x: 607; y: 1
            defaultValue: ","
        }

        Key {
            id: key31
            x: 686; y: 1
            defaultValue: "."
        }
    }

    Row {
        id: row4
        x: 301
        y: 362
        width: 747
        height: 84
        anchors.horizontalCenter: parent.horizontalCenter

        Key {
            id: key22
            x: 3
            y: 2
            width: 120
            defaultValue: "shift"
            defaultPath: "../Keyboard/images/keyBackgroundMedium.png"
            clickedPath: "../Keyboard/images/keyClickedMedium.png"
        }

        Key {
            id: key33
            x: 107
            y: 2
            width: 120
            defaultValue: "sym"
            defaultPath: "../Keyboard/images/keyBackgroundMedium.png"
            clickedPath: "../Keyboard/images/keyClickedMedium.png"
        }

        Key {
            id: key34
            x: 201
            y: 2
            width: 270
            defaultValue: "space"
            defaultPath: "../Keyboard/images/keyBackgroundLarge.png"
            clickedPath: "../Keyboard/images/keyClickedLarge.png"
        }

        Key {
            id: key35
            x: 477
            y: 2
            width: 120
            defaultValue: ".com"
            defaultPath: "../Keyboard/images/keyBackgroundMedium.png"
            clickedPath: "../Keyboard/images/keyClickedMedium.png"
        }

        Key {
            id: key36
            x: 559
            y: 2
            width: 120
            defaultValue: "done"
            defaultPath: "../Keyboard/images/keyBackgroundMedium.png"
            clickedPath: "../Keyboard/images/keyClickedMedium.png"
        }
    }
}
