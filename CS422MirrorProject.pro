# Add more folders to ship with the application, here
folder_01.source = qml/CS422MirrorProject
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE87FC0D6

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
CONFIG += mobility
MOBILITY += multimedia

##UNCOMMENT TO USE OPENCV
#LIBS += -L/usr/local/lib -lopencv_calib3d -lopencv_contrib -lopencv_features2d -lopencv_flann -lopencv_gpu -lopencv_imgproc -lopencv_legacy -lopencv_ml -lopencv_objdetect -lopencv_video -lopencv_highgui -lopencv_core
LIBS += -L/opt/local/lib -lopencv_calib3d -lopencv_contrib -lopencv_features2d -lopencv_flann -lopencv_gpu -lopencv_imgproc -lopencv_legacy -lopencv_ml -lopencv_objdetect -lopencv_video -lopencv_highgui -lopencv_core
#INCLUDEPATH += /usr/local/include
INCLUDEPATH += /opt/local/include
##UNCOMMENT TO USE OPENCV


# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
 ##UNCOMMENT TO USE OPENCV
 cameraobject.cpp
 ##UNCOMMENT TO USE OPENCV

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    readme.txt \
    calendar.xml

HEADERS += \
    ##UNCOMMENT TO USE OPENCV
    cameraopencv.h \
    cameraobject.h
    ##UNCOMMENT TO USE OPENCV
