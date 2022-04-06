import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1

import "constants.js" as Constants


Window {


    property int main_width : Constants.main_width
    property int main_height : Constants.main_height

    id: main_window
    width: main_width
    height: main_height
    visible: true
    title: qsTr("StreamDeck")
    flags: "FramelessWindowHint"
    x : Screen.width / 2 - width / 2
    y : Screen.height / 2 - height / 2

    Popup {
        id: dateDialog
        visible: false
        modal: true
        focus: true
        anchors.centerIn: parent

        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Text {
            id: name
            text: qsTr("text")
            anchors.centerIn: parent
        }
    }


    SwipeView{
        id: main_swipe
        anchors.fill: parent
        currentIndex: 0


        Item{
            id: item_one

            ControlButtons{
                anchors.fill: parent
            }
        }

        Item{
            id: item_two
            TimerCd{
                anchors.fill: parent
            }
        }



        PageIndicator{
            id: page_indicator
            count: main_swipe.count
            currentIndex: main_swipe.currentIndex
            anchors.bottom: main_window.bottom
            anchors.horizontalCenter: main_window.horizontalCenter
        }


    }



}
