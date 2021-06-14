#include "relay.h"
#include<QtSerialPort/QSerialPortInfo>
#include<QDebug>
#include <QObject>
Relay::Relay(QObject *parent) : QObject(parent)
{



     openHex = new QByteArray[25];
     *(openHex+0) = QByteArray::fromHex("8A 01 00 11 9A");
     *(openHex+1)= QByteArray::fromHex("8A 01 01 11 9B");
     *(openHex+2)=QByteArray::fromHex("8A 01 02 11 98");
     *(openHex+3)=QByteArray::fromHex("8A 01 03 11 99");
     *(openHex+4) =QByteArray::fromHex("8A 01 04 11 9E");
     *(openHex+5)= QByteArray::fromHex("8A 01 05 11 9F");
     *(openHex+6) =QByteArray::fromHex("8A 01 06 11 9C");
     *(openHex+7)=QByteArray::fromHex("8A 01 07 11 9D");
     *(openHex+8) =QByteArray::fromHex("8A 01 08 11 92");

     *(openHex+9) =QByteArray::fromHex("8A 01 09 11 93");

     *(openHex+10)=QByteArray::fromHex("8A 01 0A 11 90");

     *(openHex+11) =QByteArray::fromHex("8A 01 0B 11 91");

     *(openHex+12) =QByteArray::fromHex("8A 01 0C 11 96");

     *(openHex+13) =QByteArray::fromHex("8A 01 0D 11 97");

     *(openHex+14) =QByteArray::fromHex("8A 01 0E 11 94");
     *(openHex+15) =QByteArray::fromHex("8A 01 0F 11 95");

     *(openHex+16) =QByteArray::fromHex("8A 01 10 11 8A");

     *(openHex+17) =QByteArray::fromHex("8A 01 11 11 8B");

     *(openHex+18) =QByteArray::fromHex("8A 01 12 11 88");

     *(openHex+19) =QByteArray::fromHex("8A 01 13 11 89");

     *(openHex+20) =QByteArray::fromHex("8A 01 14 11 8E");

     *(openHex+21) =QByteArray::fromHex("8A 01 15 11 8F");

    *(openHex+22) =QByteArray::fromHex("8A 01 16 11 8C");

     *(openHex+23) =QByteArray::fromHex("8A 01 17 11 8D");

     *(openHex+24) =QByteArray::fromHex("8A 01 18 11 82");



     for (int i =0;i<25;i++) {


     channel[i].setHex(openHex[i]);
     channel[i].setNumber(i);


 }
}

void Relay::openAllChannels()
{  
     QByteArray myHexArray = QByteArray::fromHex("8A 01 00 11 9A");

     qDebug()<<"Opening all chanells";
     port->write(myHexArray);
     
}

void Relay::openChannel(int a)
{
 port->write(channel[a].getHex());
qDebug()<<channel[a].getHex();
qDebug()<<"Cabinet number: "<<channel[a].getNumber()<<" is opened";
qDebug()<<"Data from the serial port  :"<<port->readAll();

}

QStringList Relay::availablePorts()

{   QStringList list ;
    for(int i = 0;i <info->availablePorts().size();i++)
    {
    QList<QSerialPortInfo> object = info->availablePorts();
    list.append(object[i].portName());}

    return list;

}

void Relay::setPort(QString a)
{


 port = new QSerialPort;
 port->setBaudRate(QSerialPort::Baud9600);
 info = new QSerialPortInfo;
 port->setDataBits(QSerialPort::Data8);
 port->setFlowControl(QSerialPort::NoFlowControl);
 port->setParity(QSerialPort::NoParity);
 port->setStopBits(QSerialPort::OneStop);
 port->setPortName(a);
 port->open(QSerialPort::ReadWrite);
  port->setParent(this);
 qDebug()<<port->portName();
}

QString Relay::getPort()
{
   return port->portName();
}

void Relay::printSerialData(QByteArray a)
{
 qDebug()<<QString::fromStdString(a.toStdString());
}

