int[] x={1, 2, 3, 3};
int[] y={1, 2, 3, 4};

float areal;

ArrayList <PVector> vektorer= new ArrayList <PVector>();

void setup() {

  //for-loop, der definerer udgangspunktet for vektoren

  for (int i=0; i<x.length; i++) {

    //fjerner alle vektorer i arraylist

    for (int k = vektorer.size() - 1; k >= 0; k--) {
      vektorer.remove(k);
    }

    //for-loop der definerer det andet punkt til vektoren

    for (int j=0; j<x.length; j++) {

      //hvis det er samme punkt, så skal loopet gå videre

      if (j==i) continue;
      else {

        //der laves en x- og en y-komposant

        int xKom=x[j]-x[i];
        int yKom=y[j]-y[i];

        //vektoren tilføjes til ArrayList

        vektorer.add(new PVector(xKom, yKom));
      }
    }

    //for-loop der definerer den vektor der danner udgangspunkt

    for (int l=0; l<vektorer.size(); l++) {

      //for-loop der definerer den anden vektor

      for (int m=0; m<vektorer.size(); m++) {

        if (l==m) continue;
        else {

          //Der laves to float variabler der indeholder længden på de to vektorer

          float mag0=vektorer.get(m).mag();
          float mag1=vektorer.get(l).mag();

          // arealet af trekanten mellem de to vektorer findes, hvis dette er større end det hidtidige areal sættes areal til nytAreal 
          
          float nytAreal= (mag0*mag1* sin(PVector.angleBetween(vektorer.get(l), vektorer.get(m))))/2;

          if (nytAreal>areal) {
            areal=nytAreal;
          }
        }
      }
    }
  }
  println("Det største areal er: ", areal);
}
