import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import Qt.labs.settings
ApplicationWindow {
    Image {
                  source: "ajsrp50x422.jpg"

                  anchors.fill: parent


              }







    visible: true
    width: 800
    height: 600
    title: qsTr("Vocabulary Learning App")



// Settings to store theme preference
Settings {
    id: settings
    property int theme: Material.Dark
}

// Apply the saved theme
Material.theme: settings.theme
Material.accent: Material.Purple

Drawer {
    id: drawer
    width: 0.66 * window.width
    height: window.height

    ColumnLayout {
        spacing: 10
        anchors.fill: parent
        anchors.margins: 20

        RadioButton {
            text: qsTr("Light Theme")
            checked: settings.theme === Material.Light
            onClicked: {
                settings.theme = Material.Light
                Material.theme = Material.Light
            }
        }

        RadioButton {
            text: qsTr("Dark Theme")
            checked: settings.theme === Material.Dark
            onClicked: {
                settings.theme = Material.Dark
                Material.theme = Material.Dark
            }
        }

    }
}


    property int currentLesson: 0
    property var lessons: [
        { "word": "apple", "translation": "تفاحة" },
        { "word": "banana", "translation": "موز" },
        { "word": "orange", "translation": "برتقال" },
        { "word": "computer", "translation": "حاسوب" },
        { "word": "programming", "translation": "برمجة" },
        { "word": "sensor", "translation": "حساس"  },
        { "word": "component", "translation": "مكون" },
        { "word": "material", "translation": "مادة" },
        { "word": "design", "translation": "تصميم" },
        { "word": "development", "translation": "تطوير" },
        { "word": "innovation", "translation": "ابتكار" },
        { "word": "technology", "translation": "تقنية" },
        { "word": "electronics", "translation": "إلكترونيات" },
        { "word": "software", "translation": "برمجيات" },
        { "word": "devices", "translation": "أجهزة" },
        { "word": "networks", "translation": "شبكات" },
        { "word": "communications", "translation": "اتصالات" },
        { "word": "internet", "translation": "إنترنت" },
        { "word": "website", "translation": "موقع" },
        { "word": "application", "translation": "تطبيق" },
        { "word": "device", "translation": "جهاز" },
        { "word": "network", "translation": "شبكة" },
        { "word": "wire", "translation": "سلك" },
        { "word": "wireless", "translation": "لاسلكي" },
        { "word": "friend", "translation": "صديق" },
        { "word": "school", "translation": "مدرسة" },
        { "word": "candle", "translation": "شمعة" },
        { "word": "table", "translation": "طاولة" },
        { "word": "chair", "translation": "كرسي" },
        { "word": "clock", "translation": "ساعة" },
        { "word": "umbrella", "translation": "شمسية" },
        { "word": "bag", "translation": "حقيبة" },
        { "word": "socks", "translation": "جوارب" },
        { "word": "shirt", "translation": "قميص" },
        { "word": "pants", "translation": "بنطلون" },
        { "word": "dress", "translation": "فستان" },
        { "word": "shoe", "translation": "حذاء" },
        { "word": "pen", "translation": "قلم" },
        { "word": "notebook", "translation": "دفتر" },
        { "word": "pencil", "translation": "قلم رصاص" },
        { "word": "eraser", "translation": "ممحاة" },
        { "word": "scissors", "translation": "مقص" },
        { "word": "ball", "translation": "كرة" },
        { "word": "toy", "translation": "لعبة" },
        { "word": "pizza", "translation": "بيتزا" },
        { "word": "milk", "translation": "حليب" },
        { "word": "bread", "translation": "خبز" },
        { "word": "cheese", "translation": "جبن" },
        { "word": "fruit", "translation": "فاكهة" },
        { "word": "vegetables", "translation": "خضار" },
        { "word": "meat", "translation": "لحم" },
        { "word": "chicken", "translation": "دجاج" },
        { "word": "fish", "translation": "سمك" },
        { "word": "candy", "translation": "حلوى" },
        { "word": "fork", "translation": "شوكة" },
        { "word": "spoon", "translation": "ملعقة" },
        { "word": "knife", "translation": "سكين" },
        { "word": "plate", "translation": "طبق" },
        { "word": "cup", "translation": "كوب" },
        { "word": "bathroom", "translation": "حمام" },
        { "word": "bedroom", "translation": "غرفة نوم" },
        { "word": "kitchen", "translation": "مطبخ" },
        { "word": "living room", "translation": "صالة" },
        { "word": "garden", "translation": "حديقة" },
        { "word": "sea", "translation": "بحر" },
        { "word": "mountain", "translation": "جبل" },
        { "word": "valley", "translation": "وادي" },
        { "word": "river", "translation": "نهر" },
        { "word": "lake", "translation": "بحيرة" },
        { "word": "island", "translation": "جزيرة" },
        { "word": "sky", "translation": "سماء" },
        { "word": "star", "translation": "نجم" },
        { "word": "moon", "translation": "قمر" },
        { "word": "planet", "translation": "كوكب" },
        { "word": "space", "translation": "فضاء" },
        { "word": "computer", "translation": "حاسوب" },
        { "word": "screen", "translation": "شاشة" },
        { "word": "keyboard", "translation": "لوحة مفاتيح" },
        { "word": "mouse", "translation": "فأرة" },
        { "word": "camera", "translation": "كاميرا" },
        { "word": "phone", "translation": "هاتف" },
        { "word": "network", "translation": "شبكة" },
        { "word": "program", "translation": "برنامج" },
        { "word": "file", "translation": "ملف" },
        { "word": "picture", "translation": "صورة" },
        { "word": "movie", "translation": "فيلم" },
        { "word": "song", "translation": "أغنية" },
        { "word": "book", "translation": "كتاب" },
        { "word": "story", "translation": "قصة" },
        { "word": "magazine", "translation": "مجلة" },
        { "word": "newspaper", "translation": "جريدة" },
        { "word": "television", "translation": "تلفاز" },
        { "word": "radio", "translation": "راديو" },
        { "word": "theater", "translation": "مسرح" },
        { "word": "museum", "translation": "متحف" },
        { "word": "school", "translation": "مدرسة" },
        { "word": "university", "translation": "جامعة" },
        { "word": "zoo", "translation": "حديقة حيوان" },
        { "word": "airport", "translation": "مطار" },
        { "word": "station", "translation": "محطة" },
        { "word": "bus", "translation": "حافلة" },
        { "word": "car", "translation": "سيارة" },
        { "word": "train", "translation": "قطار" },
        { "word": "plane", "translation": "طائرة" },
        { "word": "ship", "translation": "سفينة" },
        { "word": "bicycle", "translation": "دراجة" },
        { "word": "edge", "translation": "حافة" },
        { "word": "angle", "translation": "زاوية" },
        { "word": "surface", "translation": "سطح" },
        { "word": "point", "translation": "نقطة" },
        { "word": "line", "translation": "خط" },
        { "word": "circle", "translation": "دائرة" },
        { "word": "square", "translation": "مربع" },
        { "word": "rectangle", "translation": "مستطيل" },
        { "word": "triangle", "translation": "مثلث" },
        { "word": "cone", "translation": "مخروط" },
        { "word": "sphere", "translation": "كرة" },
        { "word": "cube", "translation": "مكعب" },
        { "word": "cylinder", "translation": "أسطوانة" },
        { "word": "pyramid", "translation": "هرم" },
        { "word": "box", "translation": "صندوق" },
        { "word": "round", "translation": "دائري" },
        { "word": "length", "translation": "طول" },
        { "word": "width", "translation": "عرض" }
    ]

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            id: lessonText
            text: qsTr("Word: %1").arg(lessons[currentLesson].word)
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: translationInput
            placeholderText: qsTr("Enter translation in Arabic")
            font.pixelSize: 20
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: qsTr("Check")
            onClicked: {
                if (translationInput.text === lessons[currentLesson].translation) {
                    messageLabel.text = qsTr("Correct!")
                } else {
                    messageLabel.text = qsTr("Try again.")
                }
            }
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: qsTr("Next")
            onClicked: {
                translationInput.text = ""
                messageLabel.text = ""
                currentLesson = (currentLesson + 1) % lessons.length
            }
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            id: messageLabel
            text: ""
            font.pixelSize: 20
            color: "red"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        // Additional text to display English word and Arabic translation
        Text {
            text: "Lesson " + (currentLesson + 1) + " of " + lessons.length
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: qsTr("Word in English: %1").arg(lessons[currentLesson].word)
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
        }

    }
}
