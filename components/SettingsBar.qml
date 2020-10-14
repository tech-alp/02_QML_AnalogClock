import QtQuick 2.9
import assets 1.0

Item {
    anchors {
        top: parent.top
        bottom: parent.bottom
        left: parent.left
        //verticalCenter: parent.verticalCenter
    }
    property bool isCollapsed: true
    width: isCollapsed ? Style.widthNavigationBarCollapsed : Style.heightNavigationBarExpanded
    signal analogClockClicked
    signal textDataClicked
    property bool clockChange: true
    Rectangle {
        anchors.fill: parent
        color: Style.colourNavigationBarBackground
        Column {
            width: parent.width
            NavigationButton {
                id: btnExpanded
                iconCharacter: "\uf0c9"
                descriptionText: ""
                onNavigationButtonClicked: {
                    isCollapsed = !isCollapsed
                    Style.colourNavigationBarFont = isCollapsed ? "black" : "#90ee90"
                }
            }
            NavigationButton {
                iconCharacter: ""//"\uf144"
                descriptionText: "Start"
                Image {
                    source: "qrc:/svg/round-play-button.png"
                    width: Style.widthNavigationButtonIcon
                    height: Style.heightNavigationButtonIcon
                }
                onNavigationButtonClicked: {
                    stopwatch.start()// start the stopwatch
                    console.log("start")
                }
            }
            NavigationButton {
                iconCharacter: ""
                descriptionText: "Stop"
                Image {
                    x: 8
                    y: 15
                    width: Style.widthNavigationButtonIcon -20
                    height: Style.heightNavigationButtonIcon -35
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/svg/pause.svg"
                }
                onNavigationButtonClicked: {
                    stopwatch.stop()// stop the stopwatch
                    console.log("Stop")
                }
            }
            NavigationButton {
                iconCharacter: ""//"\uf017"
                descriptionText: "Goal 3.0"
                Image {
                    x: 8
                    y: 15
                    source: "qrc:/svg/watch.svg"
                    width: Style.widthNavigationButtonIcon -20
                    height: Style.heightNavigationButtonIcon -30
                }
                onNavigationButtonClicked: {
                    stopwatch.display = 3.0// set the best time
                }
            }
            NavigationButton {
                iconCharacter: ""//"\uf017"
                descriptionText: "Reset"
                Image {
                    x: 9
                    y: 15
                    source: "qrc:/svg/reset-icon.svg"
                    width: Style.widthNavigationButtonIcon -20
                    height: Style.heightNavigationButtonIcon -30
                    anchors.margins: 8
                }
                onNavigationButtonClicked: {
                    stopwatch.reset()  // reset the stopwatch
                    console.log("Reset")
                }
            }
            NavigationButton {
                iconCharacter: ""//"\uf017"
                descriptionText: "Clock"
                Image {
                    x: 9
                    y: 15
                    source: "qrc:/svg/analog-clock.svg"
                    width: Style.widthNavigationButtonIcon -20
                    height: Style.heightNavigationButtonIcon -30
                    anchors.margins: 8
                }
                onNavigationButtonClicked: {
                    clockChange ? analogClockClicked() : textDataClicked()
                    clockChange = !clockChange
                    console.log("Clock Changed")
                }
            }

    }
    }
}
