#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "data.cpp"
#include <iostream>
#include <fstream>
#include "data.h"

// Definitions for functions or classes

// Definitions for functions or classes



MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ofstream outputFile("Data.txt", std::ios::app);
    if (!outputFile.is_open()) {
        std::cerr << "Error opening file!" << endl;
        return ;
    }
}

MainWindow::~MainWindow()
{

    delete ui;


}

void MainWindow::on_FirstName_cursorPositionChanged(int arg1, int arg2)
{

}

