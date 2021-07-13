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

        //w którym umieszczamy utworzone przez nas przyciski SendAndReceive
        SendAndReceive {
            id: sendAndReceive0
            y: 376
            width: 200
            height: 100
            //wycentrowanie pionowe
            //wstawienie zależnoci od lewej krawędzi Background - nie okna!
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            //w odległoći 50px od lewej krawędzi - anchors.left powyżej
            anchors.leftMargin: 50
            //ustawiamy utworzony w Sender licznik na 0
            counter: 0
            //ustawiamy tekst przycisku
            displayText: "Send"
            //ustawiamy kolor przycisku
            buttonColor: "#0000ff"
            //jako traget ustawiamy SendAndReceive o podanym id
            target: sendAndReceive1
        }
        //a jako target podajemy sobie je nazwzajem w celu dwustronnej komunikacji
        SendAndReceive {
            id: sendAndReceive1
            y: 152
            width: 200
            height: 100
            //wycentrowanie pionowe
            //wstawienie zależnoci od prawej krawędzi Background - nie okna!
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            //w odległoći 50px od prawej krawędzi - anchors.right powyżej
            anchors.rightMargin: 50
            //ustawiamy utworzony w Sender licznik na 0
            counter: 0
            //ustawiamy kolor przycisku
            buttonColor: "#ff0000"
            //ustawiamy tekst przycisku
            displayText: "Receive"
            //jako traget ustawiamy SendAndReceive o podanym id
            target: sendAndReceive0
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
