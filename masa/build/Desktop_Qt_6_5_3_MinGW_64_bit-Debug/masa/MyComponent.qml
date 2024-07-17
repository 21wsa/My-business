import QtQuick
import QtQuick.Controls

Window {
    title: qsTr("Hello World")

    BusyIndicator {
        id: busyIndicator
        x: -587
        y: 440
    }

    Button {
        id: button
        x: 249
        y: 294
        width: 96
        height: 38
        visible: true
        text: qsTr("Button")
    }

    TextInput {
        id: textInput
        x: 188
        y: 141
        width: 223
        height: 20
        text: qsTr("Text Input")
        font.pixelSize: 12
    }

    TextEdit {
        id: textEdit
        x: 182
        y: 26
        width: 229
        height: 20
        text: qsTr("Text Edit")
        font.pixelSize: 12
    }
}
