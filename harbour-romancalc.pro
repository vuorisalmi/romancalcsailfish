# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-romancalc

CONFIG += sailfishapp

SOURCES += src/harbour-romancalc.cpp

OTHER_FILES += qml/harbour-romancalc.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-romancalc.spec \
    rpm/harbour-romancalc.yaml \
    harbour-romancalc.desktop \
    qml/icons/icon_M_64.png \
    qml/icons/icon_L_64.png \
    qml/icons/icon_D_64.png \
    qml/icons/icon_C_64.png \
    qml/pages/CalcButton.qml \
    qml/pages/Roman.qml \
    qml/pages/Calculator.qml \
    qml/pages/romanhelp.js \
    qml/icons/icon_X_64.png \
    qml/icons/icon_V_64.png \
    qml/icons/icon_plus_64.png \
    qml/icons/icon_multiply_64.png \
    qml/icons/icon_minus_64.png \
    qml/icons/icon_I_64.png \
    qml/icons/icon_equals_64.png \
    qml/icons/icon_divide_64.png \
    qml/icons/icon_CLR_64.png \
    qml/icons/icon_BkSp_64.png \
    TODO.txt \
    qml/pages/AboutPage.qml \
    graphics/romancalc_app_icon_86x86.svg \
    qml/pages/CoverPage.qml \
    qml/icons/cover_CLR_92.png \
    qml/icons/app_icon_128.png \
    graphics/cover_buttons.svg \
    README.txt \
    LICENSE.txt

