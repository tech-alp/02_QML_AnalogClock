import QtQuick 2.0

Item {
    property alias timerText: element1.text
    property alias bestText: element3.text
    Rectangle {
        anchors.fill: parent
        color: "#f0ffff"
        clip: true
    Column {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        id: column
        spacing: 2
        Text {
            id: element
            x: 15
            text: qsTr("Current Time:")
            font.bold: true
            font.pixelSize:12
        }
        Text {
            id: element1
            text: Number(stopwatch.best).toFixed(2)
            font.bold: true
            font.pixelSize: 50
        }
        Text {
            id: element2
            x: 25
            color: "#550000"
            text: qsTr("Best Time:")
            font.bold: true
            font.pixelSize: 12
        }
        Text {
            id: element3
            x: 20
            color: "#550000"
            text: stopwatch.display
            font.pixelSize: 30
            font.bold: true
        }
    }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
