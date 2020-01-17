class Input {
  //variabler
  StringBuffer tekstFelt=new StringBuffer();
  String[] tekst;
  String answer="";

  float a, x, b, y;
  float placX=10, placY=10, W=200, H=50;

  boolean korCheck=false;

  //constructor
  Input() {
  }

  //metode der tegner
  void tegn() {

    //hvidt rektangel
    fill(255);
    rect(placX, placY, W, H);

    //Tekst der angiver format på inputtekst
    fill(255);
    textSize(12);
    textAlign(LEFT, TOP);
    text("Input skal være: a, x, b, y", placX, placY+H+10);

    //visning af inputteksten
    fill(0);
    textSize(32);
    textAlign(LEFT);
    text(tekstFelt.toString(), placX+5, placY+32);

    //Output tegnes hvis korCheck er sand
    if(korCheck){
    textAlign(CENTER);
    fill(255);
    textSize(50);
    text(answer, width/2, height/2);
    }
  }

  //metode der tilføjer tegn til stringBuffer, sletter eller tjekker punktet og linjen ved tryk på ENTER
  void tast() {
    if (key==BACKSPACE && tekstFelt.length() > 0) {
      tekstFelt.deleteCharAt(tekstFelt.length()-1);
    } else if (key==ENTER) {

      //korCheck sættes til true
      korCheck=true;
    } else {
      tekstFelt.append(key);
    }
  }

  void konverter() {
    //der laves en string-array der indeholder inputtet, hvor de forskellige pladser er en ny variabel 
    tekst=split(tekstFelt.toString(), ",");

    /*Kode der konverterer de fire første pladser i arrayen til et float som tilskrives en variabel
     der laves try-catch hvis der forekommer NumberFormatException*/
    try {
      a=Float.parseFloat(tekst[0]);
      x=Float.parseFloat(tekst[1]);
      b=Float.parseFloat(tekst[2]);
      y=Float.parseFloat(tekst[3]);
    }
    catch (Exception NumberFormatException) {
      println("Forkert format, prøv igen");

      //korCheck ændres til false, således vil koden der konverterer og checker ikke køre
      korCheck=false;
    }
  }

  //metode der check om punktet ligger over, under eller på linjern
  void check( ) {

    //der laves en lokal variabel der tilskrives funktionsværdien
    float svar=a*x+b;

    //punktets placering ift. linjen tjekkes
    if (y<svar) {
      answer="UNDER";
    } else if (y>svar) {
      answer="OVER";
    } else {
      answer="LINJE";
    }
  }
}
