import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1

import "constants.js" as Constants


Rectangle{

    color: 'gray'
    GridView{
          id: main_grid
          readonly property int buttons_width: 80
          property var h_spacing_val : Constants.calcHSpacing(main_width, main_height, 5, buttons_width)
          property var v_spacing_val : Constants.calcVSpacing(main_width, main_height, 4, buttons_width)
          anchors.fill: parent
          anchors.topMargin: v_spacing_val
          anchors.leftMargin: h_spacing_val
          cellWidth: buttons_width + h_spacing_val
          cellHeight: buttons_width + v_spacing_val
          Component.onCompleted: {
              console.log("GridView completed", cellWidth, h_spacing_val)
          }

          model: ListModel {
              ListElement { btn_id: "btn_0"; name: "Grey"; colorCode: "grey"}
              ListElement { btn_id: "btn_1"; name: "Red"; colorCode: "red"}
              ListElement { btn_id: "btn_2"; name: "Blue"; colorCode: "blue"}
              ListElement { btn_id: "btn_3"; name: "Green"; colorCode: "green"}
              ListElement { btn_id: "btn_4"; name: "Green"; colorCode: "green"}

              ListElement { btn_id: "btn_5"; name: "Grey"; colorCode: "grey"}
              ListElement { btn_id: "btn_6"; name: "Red"; colorCode: "red"}
              ListElement { btn_id: "btn_7"; name: "Blue"; colorCode: "blue"}
              ListElement { btn_id: "btn_8"; name: "Green"; colorCode: "green"}
              ListElement { btn_id: "btn_9"; name: "Green"; colorCode: "green"}

              ListElement { btn_id: "btn_10"; name: "Grey"; colorCode: "grey"}
              ListElement { btn_id: "btn_11"; name: "Red"; colorCode: "red"}
              ListElement { btn_id: "btn_12"; name: "Blue"; colorCode: "blue"}
              ListElement { btn_id: "btn_13"; name: "Green"; colorCode: "green"}
              ListElement { btn_id: "btn_14"; name: "Green"; colorCode: "green"}

              ListElement { btn_id: "btn_15"; name: "Grey"; colorCode: "grey"}
              ListElement { btn_id: "btn_16"; name: "Red"; colorCode: "red"}
              ListElement { btn_id: "btn_17"; name: "Blue"; colorCode: "blue"}
              ListElement { btn_id: "btn_18"; name: "Green"; colorCode: "green"}
              ListElement { btn_id: "btn_19"; name: "Green"; colorCode: "green"}

          }

          delegate: Item {
              id: button_root
              height: 80
              width: 80

              Rectangle {
                  id: rect
    //                      width: button_root.width
    //                      height: button_root.height
                  color: colorCode
                  anchors.fill: button_root
                  anchors.horizontalCenter: parent.horizontalCenter

                  Image {
                      id: btn_image
                      anchors.fill: rect
                  }

                  Text {
                      id: btn_txt
                      text: name
                      anchors.centerIn: rect
                      font.bold: true
                  }
                  MouseArea{
                      id: btn_mouse_area
                      anchors.fill: rect
                      onPressed: console.log("btn Pressed!", btn_id)
                      onReleased: console.log("btn Released!", btn_id)
                      onPressAndHold: console.log("pressed and hold!", pressAndHoldInterval, btn_id)

                  }

              }
          }
    }


}
