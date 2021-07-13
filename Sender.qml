import QtQuick 2.0

//Kolejny przycisk (można powiedzieć obiekt, dziedziczący po utworzonym przez nas przycisku Circle)
//podobnie jak Receiver
Circle {
    id: sendButton
    //tworzymy własne zmienne w tym obiekcie
    property int counter: 0
    //oraz tworzymy obiekt Receiver który odbierze nasze dane z do wysłania
    property Receiver target: null

    //przygotowujemy sygnał do wysłania w formacie string...
    signal send(string value)
    //...który następnie tworząc połączenie wysyłamy do Receiver
    //wywołujemy funkcję receive z obiektu target(Receiver) z argumentem z send - sting value
    onTargetChanged: send.connect(target.receive) //dzięki "onTargetChanged" jest wysyłane przy każdej zmianie

    //tworzymy pole reagujące na myszkę
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
        onReleased: parent.buttonColor = "green"
    }
}
