import QtQuick 2.4

BackgroundForm {
    //dodanie obiektu Circle do modyfikacji - na start null
    property Circle target: null
    //wyłapywanie działań na klawiaturze - włączamy, bo domylnie wyłączone
    focus: true

    //wyłapywanie kliknięć
    Keys.onPressed: {
        //JavaScript

        //jeli liknięto przycisk + na klawiaturze
        if(event.key === Qt.Key_Plus)
            target.width=target.width+10;   //rozszerz Circle o 10
        //jeli liknięto przycisk - na klawiaturze
        if(event.key === Qt.Key_Minus)
            target.width=target.width-10;   //zwęż Circle o 10
    }
}
