/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Todoappmanager

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor


    Rectangle{
        id:backgrount
        anchors.centerIn: parent
        width: 430
        height: 932

        color: "#0294C2"
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 18

        Item{//mainContainer
            id: mainContainer
            anchors.fill: parent
            anchors.margins: 15

            //header
            ColumnLayout{
                id:header
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.09
                height: parent.height * 0.09

                spacing: 0

                RowLayout{
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Image {
                        id: logo
                        source: "images/logo.svg"
                        fillMode: Image.PreserveAspectCrop
                        sourceSize.width: 111
                        sourceSize.height: 34
                        layer.enabled: true

                    }//profileimage

                    Item{
                        id:searchIconContainer
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Image {
                            id: searcIcon
                            source: "images/search-icon.svg"
                            fillMode: Image.PreserveAspectCrop
                            sourceSize.width: 26
                            sourceSize.height: 27
                            layer.enabled: true
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 20

                            layer.effect: ColorOverlay{
                                color: "#D9D9D9"
                            }
                        }//profileimage

                    }//searchIconContainer


                    Image {
                        id: profileImage
                        source: "images/profilePix.jpg"
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: height
                        fillMode: Image.PreserveAspectCrop
                        layer.enabled: true

                        layer.effect: OpacityMask{
                            maskSource: Rectangle{
                                width: profileImage.width
                                height: width
                                radius: width/2
                            }
                        }
                    }//profileimage

                }//header Row

                Item{
                    Layout.preferredHeight:  parent.height * 0.35
                    Layout.fillWidth: true

                    RowLayout{
                        anchors.fill: parent
                        Image{
                            source: "images/back-icon.svg"
                            sourceSize.width: parent.height * 0.7
                            fillMode: Image.PreserveAspectFit
                            layer.enabled: true
                            layer.effect: ColorOverlay{
                                color: mouse4.containsMouse ? "#00B428": "#D9D9D9"
                                Behavior on color {
                                    ColorAnimation {
                                        duration: 200
                                    }
                                }
                            }

                            MouseArea{
                                id:mouse4
                                hoverEnabled: true
                                anchors.fill: parent
                                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                            }
                        }

                        Image{
                            Layout.alignment: Qt.AlignLeft
                            source: "images/cl-icon.svg"
                            sourceSize.width: parent.height
                            fillMode: Image.PreserveAspectFit
                            layer.enabled: true
                            layer.effect: ColorOverlay{
                                color: mouse3.containsMouse ? "#00B428": "#D9D9D9"
                                Behavior on color {
                                    ColorAnimation {
                                        duration: 200
                                    }
                                }
                            }

                            MouseArea{
                                id:mouse3
                                hoverEnabled: true
                                anchors.fill: parent
                                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                            }
                        }

                        RowLayout{

                            Image{
                                source: "images/back-icon.svg"
                                sourceSize.width: parent.height * 0.3
                                fillMode: Image.PreserveAspectFit
                                layer.enabled: true
                                layer.effect: ColorOverlay{
                                    color: mouse5.containsMouse ? "#00B428": "#D9D9D9"
                                    Behavior on color {
                                        ColorAnimation {
                                            duration: 200
                                        }
                                    }
                                }

                                MouseArea{
                                    id:mouse5
                                    hoverEnabled: true
                                    anchors.fill: parent
                                    cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

                                    onClicked: {
                                        let month = datetextfield.month
                                        if(month === 0) {
                                            datetextfield.year = datetextfield.year - 1
                                            datetextfield.month = 11

                                        }else{

                                            datetextfield.month--
                                        }

                                    }
                                }
                            }

                            TextField{
                                id:datetextfield
                                property int year : new Date().getFullYear()
                                property int month : new Date().getMonth()

                                property var days : ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
                                property var months : ["January","Feburay","March","April","May","June","July","August","September","October","November","December"]
                                background: Rectangle{
                                    implicitWidth: 200
                                    color: "transparent"
                                }

                                text: months[month] + ", " + year
                                horizontalAlignment: TextField.AlignHCenter
                                verticalAlignment: TextField.AlignVCenter

                            }

                            Image{
                                source: "images/forward-icon.svg"
                                sourceSize.width: parent.height * 0.3
                                fillMode: Image.PreserveAspectFit
                                layer.enabled: true
                                layer.effect: ColorOverlay{
                                    color: mouse6.containsMouse ? "#00B428": "#D9D9D9"
                                    Behavior on color {
                                        ColorAnimation {
                                            duration: 200
                                        }
                                    }
                                }

                                MouseArea{
                                    id:mouse6
                                    hoverEnabled: true
                                    anchors.fill: parent
                                    cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

                                    onClicked: {
                                        let month = datetextfield.month
                                        if(month === 11) {
                                            datetextfield.year = datetextfield.year + 1
                                            datetextfield.month = 0
                                        }else{

                                            datetextfield.month++
                                        }

                                    }
                                }
                            }
                        }
                    }
                }

            }//header ColumnLayout

            ColumnLayout {
                id:calander
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: header.bottom
                anchors.topMargin: 45
                spacing: 5

                height: parent.height * .32
                DayOfWeekRow {
                    locale: grid.locale
                    Layout.fillWidth: true
                    delegate: Text{
                        text: model.shortName
                        font.pixelSize: 20
                        font.family: "sans-serif"
                        font.weight: Font.Bold
                    }
                }

                MonthGrid {
                    id: grid
                    month: datetextfield.month
                    year: datetextfield.year
                    locale: Qt.locale("en_US")
                    Layout.fillWidth: true

                    delegate:Item
                    {
                        width: 40
                        height: 40
                        opacity: model.month === grid.month ? 1 : 0
                        Image{
                            anchors.fill: parent
                            source: "images/Rectangular.svg"
                            fillMode: Image.PreserveAspectFit
                            layer.enabled: true
                            layer.effect: ColorOverlay{
                                color: mouse2.containsMouse ? "#00B428": "#D9D9D9"
                                Behavior on color {
                                    ColorAnimation {
                                        duration: 200
                                    }
                                }
                            }

                            MouseArea{
                                id:mouse2
                                hoverEnabled: true
                                anchors.fill: parent
                                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                            }
                        }
                        Text {
                            anchors.fill: parent
                            font.pixelSize: 14
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            opacity: model.month === grid.month ? 1 : 0
                            text: model.day
                            // font: control.font
                        }//day number

                        Rectangle{
                            width: 8
                            height: width
                            radius: width/2
                            visible:  model.day % 4 === 0 ? 1 : 0
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 8
                            color: "green"

                        }
                    }
                }//grid
            }//calenderColumn

            Rectangle{
                id:todoBackgroundColor
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: calander.bottom
                anchors.topMargin: 36
                height: parent.height * 0.40
                color: "#2968B2"
                radius: 10

                ListView{
                    id:listview
                    anchors.fill: parent
                    anchors.margins: 15
                    clip:true

                    spacing: 10

                    ScrollIndicator.vertical: ScrollIndicator { }

                    model:ListModel{
                        ListElement{
                            title: "Working after midnight"
                            description: "I am going to be working late hours today, i have to me the tight schedule of next week, or i will be in trouble at the office."
                            time: "3:00 am"
                        }
                        ListElement{
                            title: "Going to the gym"
                            description: "Today is leg day"
                            time: "7:00 am"
                        }
                        ListElement{
                            title: "Doing the dishes this morning"
                            description: "Yeah, it has being a long time coming."
                            time: "9:00 am"
                        }
                        ListElement{
                            title: "Wash my car"
                            description: "Tomorrow is a big day, i need to be prepared."
                            time:"--:--"
                        }
                        ListElement{
                            title: "Call my friend joe."
                            description: "He said he has something important to tell me."
                            time: "10:00 pm"
                        }
                    }



                    delegate: Item
                    {
                        width: todocontainer.sourceSize.width
                        height: todocontainer.sourceSize.height

                        Image{
                            id:todocontainer
                            sourceSize.width:  listview.width
                            sourceSize.height: 76
                            source: "images/todocontainer-icon.svg"
                            layer.enabled: true
                            layer.effect: ColorOverlay{
                                color: mouse.containsMouse ? "#00B428": "#D9D9D9"
                                Behavior on color {
                                    ColorAnimation {
                                        duration: 200
                                    }
                                }
                            }

                            MouseArea{
                                id:mouse
                                hoverEnabled: true
                                anchors.fill: parent
                                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                            }
                        }

                        RowLayout{
                            anchors.fill: parent
                            anchors.margins: 10

                            Item{

                                Layout.preferredWidth: parent.width * .7
                                Layout.fillHeight: true

                                ColumnLayout{
                                    anchors.fill: parent
                                    spacing: 2

                                    Item{
                                        Layout.preferredHeight: parent.height * .3
                                        Layout.fillWidth: true
                                        clip: true

                                        Text {
                                            id:modeltitle
                                            anchors.fill: parent
                                            font.pixelSize: 12
                                            font.weight: Font.Bold
                                            elide: Text.ElideRight
                                            text: model.title
                                        }//modeltitle
                                    }

                                    Item{
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        clip: true

                                        Text {
                                            id:modeldescription
                                            anchors.fill: parent
                                            font.pixelSize: 14
                                            lineHeight: .9
                                            wrapMode: Text.WrapAnywhere
                                            text: model.description
                                        }//modeltitle
                                    }
                                }

                            }

                            Item{
                                Layout.fillHeight: true
                                Layout.fillWidth: true

                                ColumnLayout{
                                    anchors.fill: parent

                                    Item{
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true

                                        Image{
                                            sourceSize.width:  parent.height
                                            anchors.centerIn: parent
                                            source: "images/alarm-icon.svg"
                                            layer.enabled: true
                                            layer.effect: ColorOverlay{
                                                color: mouse7.containsMouse ? "#00B428": "#2F0000"
                                                Behavior on color {
                                                    ColorAnimation {
                                                        duration: 200
                                                    }
                                                }
                                            }

                                            MouseArea{
                                                id:mouse7
                                                hoverEnabled: true
                                                anchors.fill: parent
                                                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                                            }
                                        }
                                    }

                                    Item{
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true

                                        Text{
                                            anchors.centerIn: parent
                                            text: model.time
                                            font.pixelSize: 12
                                        }
                                    }
                                }

                            }

                        }

                    }

                    Rectangle{
                        width: 43
                        height: width
                        radius: width/2
                        color: "#D9D9D9"
                        anchors.right: parent.right

                        anchors.bottom: parent.bottom
                        border.width: 2

                        Image {
                            source: "images/add-icon.svg"
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                    }
                }//listview
            }//listviewBackgroundImage

        }//mainContainer

    }//background


}
