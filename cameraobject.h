#ifndef CAMERAOBJECT_H
#define CAMERAOBJECT_H

#include <QtDeclarative>
#include <QPixmap>
#include <QVBoxLayout>
#include <QDebug>
#include <QPushButton>
#include <opencv/cv.h>
#include <opencv/highgui.h>

class CameraObject : public QDeclarativeItem
{
    Q_OBJECT
public:
    CameraObject(QDeclarativeItem *parent=0); //constructor
    QPixmap toPixmap(IplImage *);   //method to transform the image received from the camera into a Pixmap
    ~CameraObject();            //destructor
    QPixmap m_camerapixmap;    //camera pixmap image
    QImage m_image;            //camera image

private:
    CvCapture *m_camera;  //opencvcameraobject

protected:
    void timerEvent(QTimerEvent*);
};

#endif // CAMERAOBJECT_H
