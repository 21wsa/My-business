#include <iostream>
#include <conio.h> //getch()
#include <fstream>


using namespace std;

int main() {
ofstream outputFile("Data.txt", ios::app);
    if (!outputFile.is_open()) {
        cerr << "Error opening file!" << endl;
        return 1;
    }
     
    cout << "==========================================\n";
    cout << "Do you want to enter the program yes or no?\n";
    cout << "==========================================\n";

    string choice;
    cout << "--> ";
    cin >> choice;

    if (choice == "yes") {
        cout << "_________________________Create an account____________________________________\n";
        cout << "Enter an email\n";
        string email;
        cout << "--> ";
        cin >> email;
          outputFile<<"email:"<<email<<endl; 


        cout << "Enter the email again\n";
        string email1;
        cout << "--> ";
        cin >> email1;

        while (email != email1) {
            cout << "Emails do not match. Please try again\n";
            cout << "--> ";
            cin >> email1;
        }

        cout << "Enter a password\n";
        string password;
        cout << "--> ";
        char ch;
        while ((ch = _getch()) != '\r') { // '\r' هو مفتاح الانتر
            cout << '*';
            password.push_back(ch);
        }
        cout << endl;

        cout << "Enter the password again\n";
        string password1;
        outputFile<<"password:"<<password<<endl; 
        outputFile<<"========================================"<<endl; 


        cout << "--> ";
        while ((ch = _getch()) != '\r') {
            cout << '*';
            password1.push_back(ch);
        }
        cout << endl;

        while (password != password1) {
            cout << "Passwords do not match. Please try again\n";
            cout << "Enter a password\n";
            password.clear();
            cout << "--> ";
            while ((ch = _getch()) != '\r') {
                cout << '*';
                password.push_back(ch);
            }
            cout << endl;

            cout << "Enter the password again\n";
            password1.clear();
            cout << "--> ";
            while ((ch = _getch()) != '\r') {
                cout << '*';
                password1.push_back(ch);
            }
            cout << endl;
        }

        cout << "_________________________Log in____________________________________\n";
        cout << "Enter your email: \n";
        string email2;
        cout << "--> ";
        cin >> email2;

        cout << "Enter your password\n";
        string password2;
        cout << "--> ";
        while ((ch = _getch()) != '\r') {
            cout << '*';
            password2.push_back(ch);
        }
        cout << endl;

        while (email != email2 || password != password2) {
            cout << "Incorrect email or password. Please try again\n";
            cout << "Enter your email: \n";
            cin >> email2;

            cout << "Enter your password\n";
            password2.clear();
            cout << "--> ";
            while ((ch = _getch()) != '\r') {
                cout << '*';
                password2.push_back(ch);
            }
            cout << endl;
        }

        cout << "______________________Calculator______________________\n";
        cout << "Type 'calc' to use the calculator\n";
        string calc;
        cout << "--> ";
        cin >> calc;

        if (calc == "calc") {
            char Oper;
            float num1, num2;

            do {
                cout << "==========================\n";
                cout << "Enter an operator (+, -, /, *)\n";
                cout << "==========================\n";
                cout << "--> ";
                cin >> Oper;
                cout << "Enter two numbers\n";
                cin >> num1 >> num2;

                switch (Oper) {
                    case '+':
                        cout << num1 << " + " << num2 << " = " << num1 + num2 << endl;
                        break;
                    case '-':
                        cout << num1 << " - " << num2 << " = " << num1 - num2 << endl;
                        break;
                    case '/':
                        if (num2 != 0)
                            cout << num1 << " / " << num2 << " = " << num1 / num2 << endl;
                        else
                            cout << "Cannot divide by zero\n";
                        break;
                    case '*':
                        cout << num1 << " * " << num2 << " = " << num1 * num2 << endl;
                        break;
                    default:
                        cout << "Invalid operator\n";
                }

                cout << "Do you want to perform another calculation? (yes/no)\n";
                string again;
                cout << "--> ";
                cin >> again;
                if (again != "yes")
                    break;
            } while (true);
        } else {
            cout << "Invalid choice. Exiting...\n";
        }
    } else {
        cout << "Exit\n";
    }

    return 0;
}
