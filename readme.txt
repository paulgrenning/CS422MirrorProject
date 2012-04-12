*************************************************************************
* README.TXT - This readme file serves as documentation for CS422
*	       Project 2 - Interactive Mirror app
*
*              by
*              Ty Cobb
*              Ronald Garay
*              Paul Grenning   
*              Paulo Guerra
*
*              Class: CS 422, Spring 2012
*              Due Date: Monday April 16, 2011
************************************************************************

QT SDK VERSION USED:
- Qt Creator 2.4.0 for MAC OSX Version 10.7.3


PREVIOUS REQUIREMENTS:

To run the app you first need to install QtSDK+QMLViewer, Qt Mobility 1.2
and OpenCV libraries in your computer.

INSTALLING QTSDK+QMLVIEWER

To install QtSDK+QMLViewer in your computer please follow the following steps:

1. Open a web browser and go to http://qt.nokia.com/downloads
2. Download the latest Qt SDK for your operating system.
   You can choose between the Online installer or the Offline installer.
3. Once downloaded run the installer. Choose the default installation.
   Remember the folder where Qt SDK will be installed. This will install Qt Creator and additional Qt SDK tools.
4. Once installed, go to the Qt SDK installation directory and
   open Qt Creator to verify that everything was installed succesfully.

INSTALLING QT-MOBILITY-1.2

qt-mobility-1.2 is a package of additional libraries that provide Qt mobile
applications with multimedia support.
Unfortunately the same libraries are not available for desktop
applications with the standard QtSDK installer.
Nevertheless it is possible to provide such support by compiling and
building qt-mobility-1.2 from source for your platform.

Installation instructions vary depending on platform.
To detailed platform specific instructions please visit: http://doc.qt.nokia.com/qtmobility/installation.html

The following are general installation instructions for compiling and building qt-mobility in MacOSX version 10.7.3

1. Open a web browser and go to http://qt.nokia.com/products/qt-addons/mobility/
2. Download the compressed source packages. You can choose between the tar.gz or zip format.
3. Once downloaded, uncompressed the file to a suitable folder where you would like to place the library.
   This will be your target dir: $YOUR_TARGET_DIR
4. Open QtCreator (previously installed) and go to QtCreator > Preferences > Build & Run > QtVersions.
   Write down the path for Desktop Qt 4.8.0 for GCC (Qt SDK). This will be your path to qmake: $YOUR_PATH_TO_QMAKE
5. Open a terminal window a type in the following commands:
   cd /usr/bin
   sudo rm qmake
   sudo ln -s $YOUR_PATH_TO_QMAKE qmake
   This will place the qmake corresponding to the Qt Desktop Environment in your system path.
6. Now, still in the terminal, go to the folder where the qt-mobility libraries were placed:
   cd $YOUR_TARGET_DIR
   Run the following commands to configure and install the libraries:
   ./configure -modules multimedia
   make
   sudo make install
7.The previous steps will place the libraries at $YOUR_TARGET_DIR/lib.
This path needs to be exported in order to be available for Qt/QML applications.
To export the library path run the following commands:
   LD_LIBRARY_PATH=$YOUR_TARGET_DIR/lib:$LD_LIBRARY_PATH
   export LD_LIBRARY_PATH

INSTALLING OPENCV 2.3.1

The following are the steps needed to get OpenCV library working on MacOSX Lion.
Instructions for other platforms can be found at http://opencv.willowgarage.com/wiki/InstallGuide

1. Install CMake. CMake is essential to build OpenCV. Get CMake MacOSX dmg from the following link: http://www.cmake.org/cmake/resources/software.html
   This comes with a GUI installer, making the installation process easy.
   At the end of the CMake installation it will ask whether or not to put
   CMake into /usr/bin and into PATH environment variable, select Yes and finish the installation.
   Go to Launch Pad > Utilities > Terminal to open a terminal window.
   Enter the followin command to confirm that CMake was successfully installed.
    cmake -version
   It should output the CMake version installed.

2.Install OpenCV. Go to http://opencv.willowgarage.com/wiki/and download the latest version of OpenCV for Unix.
   Open a terminal window and change the directory to the place where
   you downloaded the OpenCV distribution compressed file. e.g. cd ~/Downloads
   Execute the following commands in order to install OpenCV:
    tar xvf OpenCV-2.3.1a.tar.bz2
    cd OpenCV-2.3.1
    mkdir build
    cd build
    cmake -G "Unix Makefiles" -D WITH_QT=ON -D WITH_QT_OPENGL=ON ..

   Note that in the previous command the -D flags are neeeded for opencv to run with Qt.
   If you don't plan to use Qt you can just use the commmand without flags (i.e. cmake -G "Unix Makefiles")

    make
    sudo make install

   If everything works the commands should build OpenCV into the /usr/local/ directory
   Finally, be sure to modify your project file in Qt so it can reference the OpenCV libraries installed.The following image show an example of the main lines that need to be added to your project file so it can access the OpenCV libraries:

   Now that all the required dependencies for our app have been installed,
   proceed to the Download section in order to download and run the application.


HOW TO RUN THE PROGRAM:

- Instructions for downloading and running this application are available at
http://pauloguerraf.com/cs422/pro2/download.html

- Basic steps include:
1. Take note on the directory where the application is located.
2. Open Qt Creator.
3. In Qt Creator go to the top menu bar and choose Tools > External > Qt Quick > Preview(qmlviewer)
   This will open the QMLViewer application.
4. Finally, in QMLViewer go to File > Open .
   Browse to the application folder and open the main.qml file.

This will start running the app. Now you can interact with it and test it.
For more details on how to use the application visit: http://pauloguerraf.com/cs422/pro1/features.html


CURRENT STATUS:


REFERENCE:
