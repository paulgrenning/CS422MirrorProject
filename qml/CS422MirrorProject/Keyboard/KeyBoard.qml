// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: key_board
    width: 1050
    height: 458
    opacity: 1

    property string inputLabel

    property string input: ""
    property bool shift: false
    property bool sym: false
    property bool isPassword: false
    property bool inUse: false
    property string fontType: "Futura"
    property int fontSize: 32
    property string fontColor: "#7dd9b3"

    signal inputReady(string input)

    function deleteLast(){
        key_board.input = key_board.input.substring(0, key_board.input.length-1)
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
                width: 437
                height: 35
                text: key_board.input
                font.pixelSize: 29
            }

            Cursor {
                id: cursor
                x: 0
                y: 5
            }
        }
    }

    Row {
        id: row1
        x: 0; y: 110
        width: 1001; height: 84

        Key {
            id: key1
            x: 63; y: 1
            defaultValue: "q"
            shiftValue: defaultValue.toUpperCase()
            symValue: "1"
        }

        Key {
            id: key2
            x: 124; y: 1
            defaultValue: "w"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key3
            x: 225; y: 1
            defaultValue: "e"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key4
            x: 295; y: 1
            defaultValue: "r"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key5
            x: 364; y: 1
            defaultValue: "t"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key6
            x: 433; y: 1
            defaultValue: "y"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key7
            x: 504; y: 1
            defaultValue: "u"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key8
            x: 607; y: 1
            defaultValue: "i"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key9
            x: 686; y: 1
            defaultValue: "i"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key10
            x: 764; y: 1
            defaultValue: "o"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key11
            x: 872; y: 1
            defaultValue: "p"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key32
            x: 952
            y: 1
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
        }

        Key {
            id: key13
            x: 124; y: 1
            defaultValue: "s"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key14
            x: 225; y: 1
            defaultValue: "d"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key15
            x: 295; y: 1
            defaultValue: "f"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key16
            x: 364; y: 1
            defaultValue: "g"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key17
            x: 433; y: 1
            defaultValue: "h"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key18
            x: 504; y: 1
            defaultValue: "j"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key19
            x: 607; y: 1
            defaultValue: "k"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key20
            x: 686; y: 1
            defaultValue: "l"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key21
            x: 764; y: 1
            defaultValue: "@"
            shiftValue: defaultValue.toUpperCase()
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
        }

        Key {
            id: key24
            x: 124; y: 1
            defaultValue: "x"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key25
            x: 225; y: 1
            defaultValue: "c"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key26
            x: 295; y: 1
            defaultValue: "v"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key27
            x: 364; y: 1
            defaultValue: "b"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key28
            x: 433; y: 1
            defaultValue: "n"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key29
            x: 504; y: 1
            defaultValue: "m"
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key30
            x: 607; y: 1
            defaultValue: ","
            shiftValue: defaultValue.toUpperCase()
        }

        Key {
            id: key31
            x: 686; y: 1
            defaultValue: "."
            shiftValue: defaultValue.toUpperCase()
        }
    }

    Row {
        id: row4
        x: 301
        y: 362
        width: 619
        height: 84
        anchors.horizontalCenter: parent.horizontalCenter

        Key {
            id: key22
            x: 3
            y: 2
            defaultValue: "shift"
        }

        Key {
            id: key33
            x: 107
            y: 2
            defaultValue: "sym"
        }

        Key {
            id: key34
            x: 201
            y: 2
            width: 280
            defaultValue: "space"
            defaultPath: "../Keyboard/images/keyBackgroundLarge.png"
            //clickedPath: "../Keyboard/images/keyClickedLarge.png"
        }

        Key {
            id: key35
            x: 477
            y: 2
            defaultValue: ".com"
        }

        Key {
            id: key36
            x: 559
            y: 2
            defaultValue: "done"
        }
    }
}
