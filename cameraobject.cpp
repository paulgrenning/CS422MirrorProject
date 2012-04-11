#include "cameraobject.h"

//Constructor
CameraObject::CameraObject(QDeclarativeItem *parent) : QDeclarativeItem(parent)
{
    m_camera = cvCreateCameraCapture(0);
    cvSetCaptureProperty(m_camera, CV_CAP_PROP_FRAME_WIDTH, 1280);
    cvSetCaptureProperty(m_camera, CV_CAP_PROP_FRAME_HEIGHT, 960);
    //m_camera = camera;
    startTimer(100);
}

void CameraObject::timerEvent(QTimerEvent*) //convert to pixmap every 100ms and save to pixmap variable
{
    IplImage *image = cvQueryFrame(m_camera); //query frame from camera
    m_camerapixmap = toPixmap(image);         //conver it to pixmap and save it
}

QPixmap CameraObject::toPixmap(IplImage *cvimage) { //method taken from QT+OpenCv example
                                                    //http://gitorious.org/qtopencv
    int cvIndex, cvLineStart;
    cvFlip(cvimage,NULL,1);   //line added to flip the image like in a mirror
    switch (cvimage->depth) {
        case IPL_DEPTH_8U:
            switch (cvimage->nChannels) {
                case 3:
                    if ( (cvimage->width != m_image.width()) || (cvimage->height != m_image.height()) ) {
                        QImage temp(cvimage->width, cvimage->height, QImage::Format_RGB32);
                        m_image = temp;
                    }
                    cvIndex = 0; cvLineStart = 0;
                    for (int y = 0; y < cvimage->height; y++) {
                        unsigned char red,green,blue;
                        cvIndex = cvLineStart;
                        for (int x = 0; x < cvimage->width; x++) {
                            red = cvimage->imageData[cvIndex+2];
                            green = cvimage->imageData[cvIndex+1];
                            blue = cvimage->imageData[cvIndex+0];

                            m_image.setPixel(x,y,qRgb(red, green, blue));
                            cvIndex += 3;
                        }
                        cvLineStart += cvimage->widthStep;
                    }
                    break;
                default:
                    qWarning("This number of channels is not supported\n");
                    break;
            }
            break;
        default:
            qWarning("This type of IplImage is not implemented in QOpenCVWidget\n");
            break;
    }
    return QPixmap::fromImage(m_image); //return the actual pixmap of the image
}

CameraObject::~CameraObject(){
       cvReleaseCapture(&m_camera);  //release the camera capture
}

