#include "tcpclient.h"
#include<QDebug>

TcpClient::TcpClient(QObject *parent) :
    QObject(parent)
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(timerUpdate()));
    timer->start(1100);

    clientSocket = new QTcpSocket(this);
    connect(clientSocket, SIGNAL(connected()), this, SLOT(connected()));
    connect(clientSocket, SIGNAL(disconnected()), this, SLOT(disconnected()));
    connect(clientSocket, SIGNAL(readyRead()), this, SLOT(readyRead()));
    connect(clientSocket, SIGNAL(bytesWritten(qint64)), this, SLOT(bytesWritten(qint64)));

}

void TcpClient::Connect()
{

        clientSocket->connectToHost(QHostAddress::LocalHost, 8685);
        clientSocket->waitForConnected(1000);
}




void TcpClient::connected()
{
    qDebug() << "Connected!";
    timer->stop();
    clientSocket->write("HEAD / HTTP/1.0\r\n\r\n\r\n\r\n");
}

void TcpClient::disconnected()
{
    qDebug() << "Disconnected!";
}

void TcpClient::bytesWritten(qint64 bytes)
{
    qDebug() << "We wrote: " << bytes;
}

void TcpClient::readyRead()
{
    qDebug() << "Reading...";
    qDebug() << clientSocket->readAll();
}

void TcpClient::timerUpdate()
{
    qDebug() << "try connect...";
    this->Connect();
}
