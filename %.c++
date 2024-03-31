#include <iostream>
using namespace std;

int main() {
    double inPutData;
    double percentage;

    cout << "Enter a value: ";
    cin >> inPutData;

    cout << "Enter the percentage you want to calculate: ";
    cin >> percentage;

    double output = inPutData * (percentage / 100.0);
    cout << percentage << "%: " << output << endl;
   
    string input;
    //Here the calculation process is repeated or repeated so that the program can be used more than once 
    while (true) {
        cout << "Do you want to repeat the calculation?  (yes/no): ";
        cin >> input;
        if (input != "yes")
            break;
        
        //Prompt for input data for another person here
        cout << "Enter a value : ";
        cin >> inPutData;

        cout << "Enter the percentage you want to calculate: ";
        cin >> percentage;

        output = inPutData * (percentage / 100.0);
        cout << percentage << "%: " << output << endl;
    }
    return 0;
}
