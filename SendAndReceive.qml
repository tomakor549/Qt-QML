import QtQuick 2.0

Circle {
    id: sendAndReceive

    //tworzymy własne zmienne w tym obiekcie
    property int counter: 0
    //oraz tworzymy obiekt Receiver który odbierze nasze dane z do wysłania
    property SendAndReceive target: null

    //przygotowujemy sygnał do wysłania w formacie int...
    signal send(int value)
    //...który następnie tworząc połączenie wysyłamy do Receiver
    //wywołujemy funkcję receive z obiektu target(Receiver) z argumentem z send - sting value
    onTargetChanged: send.connect(target.receive) //dzięki "onTargetChanged" jest wysyłane przy każdej zmianie

    //utworzenie fukcji odbioru danych.
    //Przyjmuje jakąs informacje w formacie string i przypisuje nowy tekst do przycisku
    function receive(value){
        //zmiana wartości counter na przychodzącą
        counter = value
        //zmiana tekstu na przycisku na wartość counter
        displayText = "count: " + counter

        //console.log("counter: ", counter)

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
            duration: 250
        }
        //kolejna zmiana koloru w animacji, rozpoczynająca się po zakończeniu poprzedniej
        ColorAnimation {
            from: "red"
            to: "aqua"
            duration: 250
        }
    }

    MouseArea{
        //dopadowujemy to pole do całego obiektu - okna
        anchors.fill: parent

        //obsługa kliknięcia
        onClicked: {
            //inkrementujemy counter
            counter++
            //i przekazujemy jako argument do senda będącym w rodzicu mauseArea
            //tu rodzicem MouseArea jest Circle - to co jest powyżej xD
            parent.send(counter) //onTargetChanged wyłapie zmianę i wykona przypisane działanie

        }
        //po kliknięciu i przytrzymaniu zmieniamy kolor na żółty
        onPressed: parent.buttonColor = "yellow"
        //zmiana na stałe koloru przycisku po pierwszym kliknięciu
        //zmieni się przy odbiorze, ponieważ przy odbiorze wywoływany jest SequentialAnimation
        //który zmienia kolory
        //przycisk ponownie zzielenieje, po kliknięciu
        onReleased: parent.buttonColor = "green"
    }
}
