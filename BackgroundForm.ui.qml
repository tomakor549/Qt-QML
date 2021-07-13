import QtQuick 2.4

//utworzenie obiektu tła, które wstawimy do wybranego okna
Item {
    //wymiary obiektu
    width: 400
    height: 400

    //wstawienie prostokątu do obiektu w celu edycji stylu
    Rectangle {
        id: background
        //dopasowanie wymarów do obiektu (Item)
        anchors.fill: parent
        //wypełnienie kolorem
        //color: "#000000" //jak mamy gradient, kolor jest przysłaniany

        //utworzenie gradientu
        gradient: Gradient {
            //ustawianie pozycji i koloru gradientu
            GradientStop {
                position: 0
                color: "#ffffff"
            }
            GradientStop {
                position: 0.6
                color: "#f0a000"
            }
            GradientStop {
                position: 1
                color: "#f04242"
            }
        }
    }
}
