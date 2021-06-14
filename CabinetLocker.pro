# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo
QT += serialport svg qml quick


target.path = $$[QT_INSTALL_EXAMPLES]/kb
# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = za.co.greenfield.zemtech.co.za
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "9013056AADAD7D776F91E474C4DBDC4A909BC6B7B0EED1B3E6F21E8DE5785B24CD8D8F518D24112F82F774EE332A6C8BFA1F10AB0E359E0451BC1F5A226C8A72CE305057F4DBB2260F67F55F94119D84417915A69978D882FF673C472C2E5D27E36F1D65AE877EA3C674501CCDCB32B912D314AD5DFA69C01DAA9EBBF687B153ABE362A72C2DD2F3D35CCED314EBABC1C7CBCF0044390EFB7CCCB9003F5E8B36A1E43BD0915BF808A875B2B848B66369F52E6833BB0C2B0CF4CBB1B1CF0FFA7E9363B6EEDFEF287AEB001E163B22EC9847186845508C39CC7EF5983E6709780DD44793322FF3C5A4943EB0BA5936F86E5ECD5207F23828EFE73070D86ED074CF36FFB216ABAC67B56234BDB2344A1B28D57380D25B9EDEF9A1C75EFC19DF14574B816A1363F9B6B097F4806E7BA1D0C457800D9E3050007607E7C5757E1F80C9"

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += #    resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    channel.cpp \
    relay.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

HEADERS += \
    channel.h \
    relay.h

DISTFILES += \
    ../../Downloads/images.jpg \
    qml/MainPage.qml \
    qml/PasswordPage.qml \
    qml/Retrievepage.qml \
    qml/Components.qml \
    qml/model/DataModel.qml \
    qml/model/Logic.qml \
    qml/pages/AdminPage.qml \
    qml/pages/AdminVerifyPage.qml \
    qml/pages/OccupiedDetailPage.qml \
    qml/pages/OutOfOrder.qml \
    qml/pages/PrescriptionDetailPage.qml \
    qml/pages/PrescriptionPage.qml \
    qml/pages/Test.qml \
    qml/pages/AppSettings.qml


