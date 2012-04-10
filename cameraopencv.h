#ifndef CAMERAOPENCV_H
#define CAMERAOPENCV_H

#include <QtDeclarative>
#include <QtGui>
#include <QTimer>
#include <cameraobject.h>


//create a new qml type call CameraOpenCv using QDeclarativeItem
class CameraOpenCv : public QDeclarativeItem {
  Q_OBJECT
private:
  QLabel *m_imageLabel;        //label used to place the image from the camera
  CameraObject *c_object;      //camera object be accessed through opencv and qt
  QGraphicsProxyWidget *proxy; //proxy to embed qlabel inside the declarative item

public:
    CameraOpenCv(QDeclarativeItem *parent =0) : QDeclarativeItem(parent) { //constructor
    m_imageLabel = new QLabel;            //label used to place the image from the camera
    c_object = new CameraObject(this);    //actual camera object

    proxy = new QGraphicsProxyWidget(this); //proxy needed to embed QWidget in  QML
    proxy->setWidget(m_imageLabel);         //set the widget to be embedded
    proxy->setPos(0,0);                     //set the position inside the proxy where we wanted it embedded
    startTimer(100);                        //start timer to update the camera image ever 100ms
  }
protected:
  void timerEvent(QTimerEvent*) //updates the image being displaye on m_imageLabel
  {
      m_imageLabel->setPixmap(QPixmap::fromImage(c_object->m_image)); //updates the image being displaye on m_imageLabel
      m_imageLabel->setFixedSize(QPixmap::fromImage(c_object->m_image).size()); //set the size to the same resolution
  }
};


#endif // CAMERAOPENCV_H
