import QtQuick 2.4

Item {
    //wymiary obiektu
    width: 200
    height: 200
    //dane które chcemy wyeksportować - wykorzystać gdzie indziej
    property alias buttonColor: button.color
    property alias displayText: display.text

    //utworzenie prostokąta w obiekcie (Item)
    Rectangle {
        id: button
        //przypisanie koloru
        color: "aqua"
        //ustawienie promienia w celu zaokrąglenia wierzchołków
        //odpowiednio zaokrąglone wierzchołki mogą utworzyć okrąg, elipsę
        radius: width * 0.5
        //obramowanie - grubosć
        border.width: 1
        //dopasowanie do wymiarów obiektu
        anchors.fill: parent
        //wstawienie tekstu do prostokąta
        Text {
            id: display
            //poożenie tekstu
            x: 50
            y: 50
            //treć tekstu
            text: qsTr("Text")
            //zależnosci położenia tekstu - wtedy x i y nie mają znaczenia
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            //ustawienia czcionki tekstu
            font.pixelSize: 30
            font.bold: true
            font.family: "Times New Roman"
        }
    }
}
