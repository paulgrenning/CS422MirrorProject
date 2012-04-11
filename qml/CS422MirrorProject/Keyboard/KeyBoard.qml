// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: key_board
    width: 1001
    height: 458

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

    opacity: (inUse) ? 100 : 0
    Behavior on opacity {
        NumberAnimation { duration: 200 }
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
        }
    }

    Image {
        id: keyboardBG
        x: 0
        y: 100
        width: 1001
        height: 358
        source: "images/keyboard.png"

        MouseArea {
            id: ma_z
            x: 90
            y: 183
            width: 73
            height: 73


            Text {
                id: text_z
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("z")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_z.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: ma_u
            x: 530
            y: 8
            width: 73
            height: 73

            Text {
                id: text_u
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("u")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_u.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: ma_j
            x: 572
            y: 97
            width: 73
            height: 73


            Text {
                id: text_j
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("j")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_q.text;
                key_board.shift = false;
            }
        }

        MouseArea {
            id: ma_m
            x: 602
            y: 183
            width: 73
            height: 73


            Text {
                id: text_m
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("m")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_m.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: ma_i
            x: 617
            y: 8
            width: 73
            height: 73


            Text {
                id: text_i
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("i")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_i.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: ma_k
            x: 659
            y: 97
            width: 73
            height: 73


            Text {
                id: text_k
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("k")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_k.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: mouse_area24
            x: 689
            y: 183
            width: 73
            height: 73

            Text {
                id: text_com
                x: 27
                y: 15
                width: 20
                height: 44
                color: key_board.fontColor
                text: ","
                font.pixelSize: key_board.fontSize
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 0
                font.family: key_board.fontType
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            id: ma_o
            x: 702
            y: 8
            width: 73
            height: 73

            Text {
                id: text_o
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("o")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_o.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: ma_l
            x: 744
            y: 97
            width: 73
            height: 73

            Text {
                id: text_l
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("l")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_l.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: mouse_area27
            x: 774
            y: 183
            width: 73
            height: 73

            Text {
                id: text_per
                x: 32
                y: 9
                width: 20
                height: 44
                color: key_board.fontColor
                text: "."
                anchors.verticalCenterOffset: -6
                anchors.horizontalCenterOffset: 5
                font.pixelSize: key_board.fontSize
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.family: key_board.fontType
            }
        }

        MouseArea {
            id: ma_p
            x: 788
            y: 8
            width: 73
            height: 73

            Text {
                id: text_p
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("p")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.input = key_board.input + text_p.text;
                key_board.shift = false;
                key_board.doShift();
            }
        }

        MouseArea {
            id: mouse_area29
            x: 830
            y: 97
            width: 73
            height: 73

            Text {
                id: text_at
                x: 27
                y: 15
                width: 20
                height: 44
                color: key_board.fontColor
                text: "@"
                font.pixelSize: key_board.fontSize
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 0
                font.family: key_board.fontType
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            id: ma_del
            x: 875
            y: 8
            width: 118
            height: 73


            Text {
                id: text_del
                x: 27; y: 15
                width: 20
                height: 44
                text: qsTr("del")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.deleteLast();
            }
        }

        MouseArea {
            id: ma_done
            x: 702
            y: 277
            width: 135
            height: 73


            Text {
                id: text_done
                x: 27; y: 15
                width: 82
                height: 44
                text: qsTr("done")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                //appVar.userInput = input;
                key_board.shift = false;
                key_board.doShift();

                inputReady(key_board.input);

                key_board.sym = false;
                key_board.input = "";
                // key_board.inUse = false
            }
        }

        MouseArea {
            id: ma_sym
            x: 278
            y: 277
            width: 117
            height: 73


            Text {
                id: text_sym
                x: 27; y: 15
                width: 56
                height: 44
                text: qsTr("sym")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.shift = false;
                key_board.sym = !sym;
                key_board.doShift();
                key_board.doSymbol();
            }
        }

        MouseArea {
            id: ma_shift
            x: 144
            y: 277
            width: 117
            height: 73


            Text {
                id: text_shift
                x: 27; y: 15
                width: 64
                height: 44
                text: qsTr("shift")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font{
                    pixelSize: key_board.fontSize
                    family: key_board.fontType
                }
                color: key_board.fontColor
            }

            onClicked: {
                key_board.sym = false;
                key_board.shift = true;
                key_board.doSymbol();
                key_board.doShift();
            }
        }
    }

    MouseArea {
        id: ma_q
        x: 6
        y: 106
        width: 73
        height: 73

        Text {
            id: text_q
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("q")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_q.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_a
        x: 51
        y: 195
        width: 73
        height: 73


        Text {
            id: text_a
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("a")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_a.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_w
        x: 94
        y: 106
        width: 73
        height: 73

        Text {
            id: text_w
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("w")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_w.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_s
        x: 139
        y: 195
        width: 73
        height: 73


        Text {
            id: text_s
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("s")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_s.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_x
        x: 176
        y: 281
        width: 73
        height: 73


        Text {
            id: text_x
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("x")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_x.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_e
        x: 183
        y: 106
        width: 73
        height: 73

        Text {
            id: text_e
            x: 27; y: 15
            width: 20
            height: 44
            text:  qsTr("e")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_e.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_d
        x: 228
        y: 195
        width: 73
        height: 73


        Text {
            id: text_d
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("d")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_d.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_c
        x: 265
        y: 281
        width: 73
        height: 73

        Text {
            id: text_c
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("c")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_c.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_r
        x: 270
        y: 106
        width: 73
        height: 73

        Text {
            id: text_r
            x: 27; y: 15
            width: 20
            height: 44
            text:  qsTr("r")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_r.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_f
        x: 310
        y: 195
        width: 73
        height: 73

        Text {
            id: text_f
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("f")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_f.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_v
        x: 347
        y: 281
        width: 73
        height: 73

        Text {
            id: text_v
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("v")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_v.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_t
        x: 356
        y: 106
        width: 73
        height: 73

        Text {
            id: text_t
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("t")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_t.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_g
        x: 398
        y: 195
        width: 73
        height: 73

        Text {
            id: text_g
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("g")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_g.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_b
        x: 428
        y: 281
        width: 73
        height: 73

        Text {
            id: text_b
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("b")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_b.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_y
        x: 443
        y: 106
        width: 73
        height: 73

        Text {
            id: text_y
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("y")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_y.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_h
        x: 485
        y: 195
        width: 73
        height: 73

        Text {
            id: text_h
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("h")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_h.text;
            shift = false;
        }
    }

    MouseArea {
        id: ma_n
        x: 515
        y: 281
        width: 73
        height: 73


        Text {
            id: text_n
            x: 27; y: 15
            width: 20
            height: 44
            text: qsTr("n")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + text_n.text;
            key_board.shift = false;
            key_board.doShift();
        }
    }

    MouseArea {
        id: ma_space
        x: 409
        y: 376
        width: 281
        height: 73


        Text {
            id: text_space
            x: 27; y: 15
            width: 84
            height: 44
            text:qsTr("space")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font{
                pixelSize: key_board.fontSize
                family: key_board.fontType
            }
            color: key_board.fontColor
        }

        onClicked: {
            key_board.input = key_board.input + " ";
        }
    }

    function doSymbol(){
        if(key_board.sym == true){
            text_q.text = "1";
            text_w.text = "2";
            text_e.text = "3";
            text_r.text = "4";
            text_t.text = "5";
            text_y.text = "6";
            text_u.text = "7";
            text_i.text = "8";
            text_o.text = "9";
            text_p.text = "0";
            text_a.text = "_";
            text_s.text = "-";
            text_d.text = "+";
            text_f.text = "=";
            text_g.text = "!";
            text_h.text = "#";
            text_j.text = "$";
            text_k.text = "%";
            text_l.text = "^";
            text_z.text = "&";
            text_x.text = "*";
            text_c.text = "(";
            text_v.text = ")";
            text_b.text = "?";
            text_n.text = ":";
            text_m.text = ";";
        }
        else if(key_board.sym == false){
            text_q.text = "q";
            text_w.text = "w";
            text_e.text = "e";
            text_r.text = "r";
            text_t.text = "t";
            text_y.text = "y";
            text_u.text = "u";
            text_i.text = "i";
            text_o.text = "o";
            text_p.text = "p";
            text_a.text = "a";
            text_s.text = "s";
            text_d.text = "d";
            text_f.text = "f";
            text_g.text = "g";
            text_h.text = "h";
            text_j.text = "j";
            text_k.text = "k";
            text_l.text = "l";
            text_z.text = "z";
            text_x.text = "x";
            text_c.text = "c";
            text_v.text = "v";
            text_b.text = "b";
            text_n.text = "n";
            text_m.text = "m";
        }
    }

    function doShift(){
        if(key_board.shift == true && key_board.sym == false){
            text_q.text = "Q";
            text_w.text = "W";
            text_e.text = "E";
            text_r.text = "R";
            text_t.text = "T";
            text_y.text = "Y";
            text_u.text = "U";
            text_i.text = "I";
            text_o.text = "O";
            text_p.text = "P";
            text_a.text = "A";
            text_s.text = "S";
            text_d.text = "D";
            text_f.text = "F";
            text_g.text = "G";
            text_h.text = "H";
            text_j.text = "J";
            text_k.text = "K";
            text_l.text = "L";
            text_z.text = "Z";
            text_x.text = "X";
            text_c.text = "C";
            text_v.text = "V";
            text_b.text = "B";
            text_n.text = "N";
            text_m.text = "M";
        }
        else if(key_board.shift == false){
            text_q.text = "q";
            text_w.text = "w";
            text_e.text = "e";
            text_r.text = "r";
            text_t.text = "t";
            text_y.text = "y";
            text_u.text = "u";
            text_i.text = "i";
            text_o.text = "o";
            text_p.text = "p";
            text_a.text = "a";
            text_s.text = "s";
            text_d.text = "d";
            text_f.text = "f";
            text_g.text = "g";
            text_h.text = "h";
            text_j.text = "j";
            text_k.text = "k";
            text_l.text = "l";
            text_z.text = "z";
            text_x.text = "x";
            text_c.text = "c";
            text_v.text = "v";
            text_b.text = "b";
            text_n.text = "n";
            text_m.text = "m";
        }
    }
}
