import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import assets 1.0
import components 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("KDAB29")

    SettingsBar {
        id: settingsBar
        //onAnalogClockClicked: contentFrame.replace("qrc:/components/AnalogClock.qml")

        //onClockChangeChanged:contentFrame.replace("qrc:/components/AnalogClock.qml")
    }

    Connections {
        target: settingsBar
        onAnalogClockClicked: contentFrame.replace("qrc:/components/AnalogClock.qml")
        onTextDataClicked:contentFrame.replace("qrc:/components/ShowDataText.qml")
    }



    StackView {
        id: contentFrame
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: settingsBar.right
        }
        initialItem: Qt.resolvedUrl("qrc:/components/ShowDataText.qml")
        clip: true
    }



    /*Text {
        text: Style.boardText
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: settingsBar.right
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
        font.bold: true
    }*/

}
