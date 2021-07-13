import QtQuick 2.12
import QtQuick.Window 2.12

//główne okno programu
Window {
    //o takich wymiarach
    width: 640
    height: 480
    //z widocznym wypełnieniem
    visible: true
    //o takim tytule
    title: qsTr("Hello World")

    //do którego dajemy utworzony przez nas Background
    Background {
        id: background
        anchors.fill: parent
        //w którym umieszczamy utworzony przez nas przycisk Sender
        Sender {
            id: sender
            y: 152
            //wycentrowanie pionowe
            anchors.verticalCenter: parent.verticalCenter
            //wstawienie zależnoci od lewej krawędzi Background - nie okna!
            anchors.left: parent.left
            //w odległoći 50px od lewej krawędzi - anchors.left powyżej
            anchors.leftMargin: 50
            //ustawiamy utworzony w Sender licznik na 0
            counter: 0
            //ustawiamy tekst przycisku
            displayText: "Sender"
            //ustawiamy kolor przycisku
            buttonColor: "#0000ff"
            //jako traget ustawiamy Receiver o podanym id - tu zadeklarowany poniżej
            target: receiver
        }
        //i utworzony przez nas przycisk Receiver
        Receiver {
            id: receiver
            y: 152
            //wycentrowanie pionowe
            anchors.verticalCenter: parent.verticalCenter
            //wstawienie zależnoci od prawej krawędzi Background - nie okna!
            anchors.right: parent.right
            //w odległoći 50px od prawej krawędzi - anchors.right powyżej
            anchors.rightMargin: 50
            //ustawiamy kolor przycisku
            buttonColor: "#ff0000"
            //ustawiamy tekst przycisku
            displayText: "Receiver"
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:2}D{i:1}
}
##^##*/
