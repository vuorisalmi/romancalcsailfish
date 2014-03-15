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
    qml/icons/icon_I_64.png \
    TODO.txt \
    qml/pages/AboutPage.qml \
    graphics/romancalc_app_icon_86x86.svg \
    qml/pages/CoverPage.qml \
    qml/icons/cover_CLR_92.png \
    qml/icons/app_icon_128.png \
    graphics/cover_buttons.svg \
    README.txt \
    LICENSE.txt \
    qml/icons/icon_BkSp_white_64.png \
    qml/icons/icon_CLR_white_64.png \
    qml/icons/icon_equals_white_64.png \
    qml/pages/RGBIcon.qml \
    qml/icons/icon_divide_white_64.png \
    qml/icons/icon_minus_white_64.png \
    qml/icons/icon_multiply_white_64.png \
    qml/icons/icon_plus_white_64.png \
    qml/icons/icon_BkSp_red+green_64.png \
    qml/icons/icon_BkSp_red+blue_64.png \
    qml/icons/icon_BkSp_red_64.png \
    qml/icons/icon_BkSp_green+blue_64.png \
    qml/icons/icon_BkSp_green_64.png \
    qml/icons/icon_BkSp_blue_64.png \
    qml/icons/icon_BkSp_black_64.png \
    qml/icons/icon_CLR_red+green_64.png \
    qml/icons/icon_CLR_red+blue_64.png \
    qml/icons/icon_CLR_red_64.png \
    qml/icons/icon_CLR_green+blue_64.png \
    qml/icons/icon_CLR_green_64.png \
    qml/icons/icon_CLR_blue_64.png \
    qml/icons/icon_CLR_black_64.png \
    qml/icons/icon_divide_red+green_64.png \
    qml/icons/icon_divide_red+blue_64.png \
    qml/icons/icon_divide_red_64.png \
    qml/icons/icon_divide_green+blue_64.png \
    qml/icons/icon_divide_green_64.png \
    qml/icons/icon_divide_blue_64.png \
    qml/icons/icon_divide_black_64.png \
    qml/icons/icon_equals_red+green_64.png \
    qml/icons/icon_equals_red+blue_64.png \
    qml/icons/icon_equals_red_64.png \
    qml/icons/icon_equals_green+blue_64.png \
    qml/icons/icon_equals_green_64.png \
    qml/icons/icon_equals_blue_64.png \
    qml/icons/icon_equals_black_64.png \
    qml/icons/icon_minus_red+green_64.png \
    qml/icons/icon_minus_red+blue_64.png \
    qml/icons/icon_minus_red_64.png \
    qml/icons/icon_minus_green+blue_64.png \
    qml/icons/icon_minus_green_64.png \
    qml/icons/icon_minus_blue_64.png \
    qml/icons/icon_minus_black_64.png \
    qml/icons/icon_multiply_red+green_64.png \
    qml/icons/icon_multiply_red+blue_64.png \
    qml/icons/icon_multiply_red_64.png \
    qml/icons/icon_multiply_green+blue_64.png \
    qml/icons/icon_multiply_green_64.png \
    qml/icons/icon_multiply_blue_64.png \
    qml/icons/icon_multiply_black_64.png \
    qml/icons/icon_plus_red+green_64.png \
    qml/icons/icon_plus_red+blue_64.png \
    qml/icons/icon_plus_red_64.png \
    qml/icons/icon_plus_green+blue_64.png \
    qml/icons/icon_plus_green_64.png \
    qml/icons/icon_plus_blue_64.png \
    qml/icons/icon_plus_black_64.png

