import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Payment and Change Calculator"

    // Store theme, language, and currency state
    property bool darkTheme: true
    property string currentLanguage: "en" // Default language
    property string currentCurrency: "EUR" // Default currency

    // Function to set the language
    function setLanguage(lang) {
        currentLanguage = lang;
    }

    // Function to set the currency
    function setCurrency(currency) {
        currentCurrency = currency;
    }

    // Currency symbols mapping
    property var currencySymbols: {
        "EUR": "€",
        "USD": "$",
        "GBP": "£",
        "JPY": "¥",
        "EGP": "ج.م"
    }

    // Change style based on theme
    Rectangle {
        anchors.fill: parent
        color: darkTheme ? "#2b2b2b" : "#e0e0e0" // Background color based on theme

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: 350

            // Toggle between dark and light mode
            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                RadioButton {
                    text: qsTr("Dark Theme")
                    checked: darkTheme
                    onClicked: darkTheme = true
                    padding: 10
                }

                RadioButton {
                    text: qsTr("Light Theme")
                    checked: !darkTheme
                    onClicked: darkTheme = false
                    padding: 10
                }
            }

            // Toggle between English and Arabic language
            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                RadioButton {
                    text: qsTr("English")
                    checked: currentLanguage === "en"
                    onClicked: setLanguage("en")
                    padding: 10
                }

                RadioButton {
                    text: qsTr("عربي")
                    checked: currentLanguage === "ar"
                    onClicked: setLanguage("ar")
                    padding: 10
                }
            }

            // Toggle between different currencies
            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                RadioButton {
                    text: "EUR"
                    checked: currentCurrency === "EUR"
                    onClicked: setCurrency("EUR")
                    padding: 10
                }

                RadioButton {
                    text: "USD"
                    checked: currentCurrency === "USD"
                    onClicked: setCurrency("USD")
                    padding: 10
                }

                RadioButton {
                    text: "GBP"
                    checked: currentCurrency === "GBP"
                    onClicked: setCurrency("GBP")
                    padding: 10
                }

                RadioButton {
                    text: "JPY"
                    checked: currentCurrency === "JPY"
                    onClicked: setCurrency("JPY")
                    padding: 10
                }

                RadioButton {
                    text: "EGP"
                    checked: currentCurrency === "EGP"
                    onClicked: setCurrency("EGP")
                    padding: 10
                }
            }

            // Price input field
            TextField {
                id: priceField
                width: 300
                placeholderText: currentLanguage === "en" ? "Enter price" : "أدخل السعر"
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                font.pixelSize: 16
                padding: 10
                background: Rectangle {
                    color: darkTheme ? "#333333" : "#ffffff" // Background based on theme
                    border.color: darkTheme ? "#444444" : "#cccccc" // Border color based on theme
                    radius: 5
                }
                color: darkTheme ? "#ffffff" : "#000000" // Text color based on theme
            }

            // Amount paid input field
            TextField {
                id: amountPaidField
                width: 300
                placeholderText: currentLanguage === "en" ? "Enter amount paid" : "أدخل المبلغ المدفوع"
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                font.pixelSize: 16
                padding: 10
                background: Rectangle {
                    color: darkTheme ? "#333333" : "#ffffff" // Background based on theme
                    border.color: darkTheme ? "#444444" : "#cccccc" // Border color based on theme
                    radius: 5
                }
                color: darkTheme ? "#ffffff" : "#000000" // Text color based on theme
            }

            // Calculate button
            Button {
                text: currentLanguage === "en" ? "Calculate" : "احسب"
                width: 150
                height: 40
                onClicked: {
                    var price = parseFloat(priceField.text);
                    var amountPaid = parseFloat(amountPaidField.text);

                    if (isNaN(price) || isNaN(amountPaid)) {
                        resultText.text = currentLanguage === "en" ? "Please enter valid values." : "يرجى إدخال قيم صحيحة.";
                        return;
                    }

                    var change = amountPaid - price;
                    resultText.text = (currentLanguage === "en" ?
                        "Price: " + price.toFixed(2) + " " + currencySymbols[currentCurrency] + "\n" +
                        "Amount Paid: " + amountPaid.toFixed(2) + " " + currencySymbols[currentCurrency] + "\n" +
                        "Change: " + (change < 0 ? "Insufficient amount" : change.toFixed(2) + " " + currencySymbols[currentCurrency])
                        :
                        "السعر: " + price.toFixed(2) + " " + currencySymbols[currentCurrency] + "\n" +
                        "المبلغ المدفوع: " + amountPaid.toFixed(2) + " " + currencySymbols[currentCurrency] + "\n" +
                        "المبلغ الذي سيرجع: " + (change < 0 ? "نقص في المبلغ" : change.toFixed(2) + " " + currencySymbols[currentCurrency])
                    );
                }
                background: Rectangle {
                    color: darkTheme ? "#4CAF50" : "#388E3C" // Button color based on theme
                    radius: 5
                }
                font.pixelSize: 16
            }

            // Result text
            Text {
                id: resultText
                text: ""
                color: darkTheme ? "#ffffff" : "#000000" // Text color based on theme
                wrapMode: Text.Wrap
                width: 300
                font.pixelSize: 16
                padding: 10
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
