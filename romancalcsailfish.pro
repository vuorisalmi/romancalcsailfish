# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = romancalcsailfish

CONFIG += sailfishapp

SOURCES += src/romancalcsailfish.cpp

OTHER_FILES += qml/romancalcsailfish.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/romancalcsailfish.spec \
    rpm/romancalcsailfish.yaml \
    romancalcsailfish.desktop \
    ../sftestapp/qml/pages/icon_M_64.png \
    ../sftestapp/qml/pages/icon_L_64.png \
    ../sftestapp/qml/pages/icon_D_64.png \
    qml/icons/icon_M_64.png \
    qml/icons/icon_L_64.png \
    qml/icons/icon_D_64.png \
    qml/icons/icon_C_64.png \
    qml/icon_menu_64.png \
    qml/pages/CalcButton.qml

