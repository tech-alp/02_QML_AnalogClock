import QtQuick 2.5
import assets 1.0

Item {
    id: analogClock
    Rectangle {
        anchors.fill: parent
        color: "#f0ffff"
        clip: true
    }

    Rectangle {
        id: circle
        anchors.centerIn: parent
        height: Math.min(parent.width,parent.height) / 2
        width: height
        radius: width/2
        border.color: "#46242d"
        color:"gold"
        border.width: 2

        Rectangle {
            id: secondNeddle
            anchors {
                top: parent.top
                bottom: parent.Center
            }
            x: circle.width/2;
            width: 1; height: circle.height / 2
            color: "red"
            transformOrigin: Item.Bottom
            border.color: "#00000000"
            antialiasing: true
            rotation: 360/60 *(Number(stopwatch.second) % 60)
        }

        Rectangle {
            id: minuteNeddle
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -height / 2
            width: 1.5; height: circle.height / 3
            color: "blue"
            transformOrigin: Item.Bottom
            border.color: "#00000000"
            antialiasing: true
            rotation: 360/60 *(stopwatch.minute % 60)
        }

        Rectangle {
            id: hourNeddle
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -height / 2
            width: 2; height: circle.height / 4
            color: "green"
            transformOrigin: Item.Bottom
            border.color: "#00000000"
            antialiasing: true
            rotation: 360/24 *(stopwatch.hour % 24)
        }
    }
    Repeater {
        model: 12
        Item {
            anchors.fill: circle
            property int hour: index
            transformOrigin: Item.Center
            rotation: index * 30
            Rectangle {
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 4
                }
                width: 10
                height: width
                radius: 180
                color: "black"
                Text {
                    anchors.fill: parent
                    text: index === 0 ? 12 : index
                    anchors.topMargin: 8
                    //transformOrigin: Text.left
                    //rotation: 360 - index * 30
                }
            }
        }
    }

    Rectangle {
        id: centerCircle
        anchors.centerIn: parent
        radius: 180
        width: 20
        height: 20
        color: "#eb0c0c"
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2;anchors_height:120;anchors_y:0}
}
##^##*/
