import QtQuick 2.0

//Receiver - obiekt do odbierania informacji
//ustawiamy go jako utworzony przez nas typ Circle - przycisk
//któRy teraz będziemy modyfikować pod odbiór
Circle {
    id: receiveButton

    //utworzenie fukcji odbioru danych.
    //Przyjmuje jakąs informacje w formacie string i przypisuje nowy tekst do przycisku
    function receive(value){
        //zmiana nazwy
        displayText = value
        //ustawienie zmiennej running z obiektu pod id clicknotify
        //clicknotify - SequentialAnimation zadeklarowany poniżej
        clicknotify.running = true
    }

    //utworzenie animacji do zmiany barwy przycisku
    SequentialAnimation on buttonColor{
        id: clicknotify
        //jeli false - animacja jest wyłączona
        running: false

        //pierwsza zmiana koloru w animacji
        ColorAnimation {
            //kolor początkowy - nadpisujemy kolor podstawowy przypisany w Circle
            from: "aqua"
            //kolor finalny - jaki osiągnie na koniec
            to: "red"
            //czas trwania zmiany koloru w ms. domylnie jest 250
            duration: 2500
        }
        //kolejna zmiana koloru w animacji, rozpoczynająca się po zakończeniu poprzedniej
        ColorAnimation {
            from: "red"
            to: "aqua"
            duration: 2500
        }
    }

}
