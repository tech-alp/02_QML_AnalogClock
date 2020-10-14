import QtQuick 2.9
import assets 1.0

Item {
    signal navigationButtonClicked()
    property alias iconCharacter: textIcon.text
    property alias descriptionText: textDescription.text

    width: parent.width
    height: Style.heightNavigationButton


    states: [
        State {
            name: "hover"
            PropertyChanges {
                target: background
                color: hoverColour
            }
        }
    ]


    Rectangle {
        id:background
        anchors.fill: parent
        color: Style.colourNavigationBarBackground
        Row {
            Text {
                id: textIcon
                width: Style.widthNavigationButtonIcon
                height: Style.heightNavigationButtonIcon
                font {
                    family: Style.fontAwesome
                    pixelSize: Style.pixelSizeNavigationBarIcon
                }
                color: Style.colourNavigationBarFont
                text: "\uf11a"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Text {
                id: textDescription
                width: Style.widthNavigationButtonDescription
                height: Style.heightNavigationButtonDescription
                color: Style.colourNavigationBarFont
                font.pixelSize: Style.pixelSizeNavigationBarDescription
                font.bold: true
                text: "Set ME!!"
                verticalAlignment: Text.AlignVCenter
            }
        }
        MouseArea {
            id: mouseArea
            anchors.rightMargin: 0
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onEntered: background.state = "hover"
            onExited: background.state = ""
            onClicked: navigationButtonClicked()
        }
      }


}
