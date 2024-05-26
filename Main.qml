import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    visible: true
    width: 1200
    height: 800
    title: "pp"

    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id:fullwindow
        anchors.fill:parent

        MouseArea{
            anchors.fill: parent

            property int lastX
            property int lastY

            onPressed: {
                lastX = mouse.x
                lastY = mouse.y
            }

            onPositionChanged: {
                var deltaX = mouse.x - lastX
                var deltaY = mouse.y - lastY

                // 更新窗口的位置
                root.x += deltaX
                root.y += deltaY
            }

        }

        Rectangle{
            id:leftWindow
            width:fullwindow.width * 0.045
            height: fullwindow.height
            anchors.left: fullwindow.left
            color:"#FFFFFF"
        }

        Rectangle{
            id : rightWindow
            width:fullwindow.width * 0.65
            height: fullwindow.height
            anchors.right: fullwindow.right

            color: "#F5F6F7"

            Rectangle{
                id:quitButton
                width:rightWindow.width / 10
                height: rightWindow.height / 20
                anchors.right: rightWindow.right
                anchors.top: rightWindow.top

                Rectangle{
                    id:minimumWindow
                    width: quitButton.width / 2
                    height: quitButton.height
                    anchors.left: quitButton.left
                    anchors.top: quitButton.top
                    color: "#F5F6F7"

                    Text{
                        anchors.centerIn: parent
                        text: "-"
                        font.pixelSize: 45
                        color: "#81868F"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked:{
                            root.showMinimized()
                        }
                    }
                }

                Rectangle{
                    id:exitWindow
                    width: quitButton.width / 2
                    height: quitButton.height
                    anchors.right: quitButton.right
                    anchors.top: quitButton.top
                    color: "#F5F6F7"

                    Text{
                        anchors.centerIn: parent
                        text: "x"
                        font.pixelSize: 32
                        color: "#81868F"
                    }

                    MouseArea{
                        anchors.fill: parent

                        onClicked:{
                            root.close()
                        }
                    }
                }
            }
        }
    }


}
