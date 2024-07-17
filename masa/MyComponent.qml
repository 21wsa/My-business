import QtQuick
import QtQuick.Controls

Window {
    visible: true
    title: qsTr("Hello World")

    BusyIndicator {
        id: busyIndicator

    }

    Button {
        id: button

        width: 96
        height: 38
        visible: true
        text: qsTr("Button")
    }

    TextInput {
        id: textInput

        width: 223
        height: 20
        text: qsTr("Text Input")
        font.pixelSize: 13
    }

    TextEdit {
        id: textEdit

        width: 229
        height: 20
        text: qsTr("Text Edit")
        font.pixelSize: 12
    }
}

/*##^##
Designer {
    D{i:0;annotation:"1 //;;//  //;;//  //;;// <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html> //;;// 1720623416";customId:""}
}
##^##*/
