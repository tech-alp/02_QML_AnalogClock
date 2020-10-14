pragma Singleton
import QtQuick 2.0

Item {
    property string boardText
    property bool isCollpase: false
    property alias fontAwesome: fontAwesomeLoader.name
    property color colourNavigationBarFont: "#000000"
    readonly property color colourNavigationBarBackground: "#b22222"//"#ffa500"
    readonly property int pixelSizeNavigationBarIcon: 42
    readonly property int pixelSizeNavigationBarDescription: 22
    readonly property real widthNavigationButtonIcon: 80
    readonly property real heightNavigationButtonIcon: widthNavigationButtonIcon
    readonly property real widthNavigationButtonDescription: 100
    readonly property real heightNavigationButtonDescription: heightNavigationButtonIcon
    readonly property real widthNavigationButton: widthNavigationButtonDescription + widthNavigationButtonIcon
    readonly property real heightNavigationButton: Math.max(heightNavigationButtonIcon,heightNavigationButtonDescription)
    readonly property real heightNavigationBarExpanded: widthNavigationButton
    readonly property real widthNavigationBarCollapsed: widthNavigationButtonIcon
    FontLoader {
        id: fontAwesomeLoader
        source: "qrc:/assets/fontawesome.ttf"
    }
}
