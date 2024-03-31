#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <regex>
using namespace std;

bool isValidEmail(const string &email) {
    regex emailPattern(R"([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})");
    return regex_match(email, emailPattern);
}

void inputData(ofstream &outputFile) {
    string firstName, lastName, email, country, gender;
    int age, phoneNumber;

    cout << "Please enter First Name:";
    cin>>firstName;
    outputFile << "First Name: " << firstName << endl;

    cout << "Please enter Last Name:";
   cin >> lastName;
    outputFile << "Last Name: " << lastName << endl;

    cout << "Please enter Age: ";
    cin >> age;
    outputFile << "Age: " << age << endl;

    do {
        cout << "Please enter a valid email address: ";
        cin >> email;
    } while (!isValidEmail(email));
    outputFile << "Email: " << email << endl;

    cout << "Please enter your Phone Number: ";
    cin >> phoneNumber;
    outputFile << "Phone Number: " << phoneNumber << endl;

    cout << "Please enter the Country you live in: ";
     cin >> country;
    outputFile << "Country: " << country << endl;

    cout << "What is your gender (Male/Female)? ";
    cin >> gender;
    outputFile << "Gender: " << gender << endl;

    time_t now = time(0);
    tm *ltm = localtime(&now);
    outputFile << "Time: " << ltm->tm_hour << ":" << ltm->tm_min << ":" << ltm->tm_sec << " / Day: " << ltm->tm_mday << " / Month: " << ltm->tm_mon + 1 << " / Year: " << ltm->tm_year + 1900 << endl;

    outputFile << "================================================================" << endl;
}

int main() {
    string adminPassword = "loopadmin3"; 
    string inputPassword;

    cout << "Enter admin password: ";
    cin >> inputPassword;

    if (inputPassword != adminPassword) {
        cout << "Incorrect password. Access denied." << endl;
        return 1;
    }

    ofstream outputFile("Data.txt", ios::app);
    if (!outputFile.is_open()) {
        cerr << "Error opening file!" << endl;
        return 1;
    }

    inputData(outputFile);

    string firstName1;
    while (true) {
        string input;
        cout << "Would you like to enter data for another person? (yes/no): ";
        cin >> input;
        if (input != "yes")
            break;
        inputData(outputFile);
    }

    outputFile.close();
    return 0;
}


