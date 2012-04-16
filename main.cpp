#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "cameraopencv.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    qmlRegisterType<CameraOpenCv>("opencvqml", 1, 0, "CameraOpenCv");
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/CS422MirrorProject/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
