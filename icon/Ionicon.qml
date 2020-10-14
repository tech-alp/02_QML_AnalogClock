import QtQuick 2.7
import QtGraphicalEffects 1.0
Image {
        Image {
            id: image
            x: 35
            y: 97
            width: 100
            height: 75
            fillMode: Image.PreserveAspectFit
            source: "pause.svg"
        }

        Image {
            id: image1
            x: 35
            y: 178
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
            source: "caret-forward-outline.svg"
        }
}
