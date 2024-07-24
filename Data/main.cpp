#include "mainwindow.h"
#include "logindialog.h"

#include <QApplication>
#include <QDialog>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    LoginDialog loopadmin3;
    loopadmin3.exec();
    if(loopadmin3.axcepti()) {
        MainWindow w;
        w.show();
        return a.exec();
    } else {
        return 0;
    }
}

