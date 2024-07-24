#ifndef LOGINDIALOG_H
#define LOGINDIALOG_H

#include <QDialog>

namespace Ui {
class LoginDialog;
}

class LoginDialog : public QDialog
{
    Q_OBJECT

public:
    explicit LoginDialog(QWidget *parent = nullptr);
    ~LoginDialog();
    bool axcepti();

private slots:
    void on_password_copyAvailable(bool b);



    void on_lineEdit_cursorPositionChanged(int arg1, int arg2);

    void on_pushButton_clicked();

private:
    Ui::LoginDialog *ui;
    bool m_accepted = false;
};

#endif // LOGINDIALOG_H
