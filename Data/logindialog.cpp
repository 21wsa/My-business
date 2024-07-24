#include "logindialog.h"
#include "ui_logindialog.h"

LoginDialog::LoginDialog(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::LoginDialog)
{
    ui->setupUi(this);
}

LoginDialog::~LoginDialog()
{

    delete ui;
}

void LoginDialog::on_password_copyAvailable(bool b)
{

}

bool LoginDialog::axcepti() {
    return m_accepted;
}










void LoginDialog::on_lineEdit_cursorPositionChanged(int arg1, int arg2)
{


}


void LoginDialog::on_pushButton_clicked()
{
    QString given = ui->lineEdit->text();
    if(given=="loopadmin10")
    {
        m_accepted = true;
    } else {
        ui->label_2->setText("The password is incorrect");
        return;
    }

    this->close();
}

