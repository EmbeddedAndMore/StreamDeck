#ifndef TCPCLIENT_H
#define TCPCLIENT_H


#include <QTcpSocket>
#include <QHostAddress>
#include <QTimer>

class TcpClient: public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = 0);

    void Connect();


signals:

public slots:

    void connected();
    void disconnected();
    void bytesWritten(qint64 bytes);
    void readyRead();
    void timerUpdate();


private:
    QTcpSocket *clientSocket;
    QTimer *timer ;

};
#endif // TCPCLIENT_H
