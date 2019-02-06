class Phase{

  double showButtonsOpac;
  String text;
  String control1;
  String control2;
  String animation;
  Phase(this.showButtonsOpac , this.text , this.control1 , this.control2, this.animation);
}

List<Phase> phases = [

  Phase(0.0, "Welcome", "Cancel" , "Start", "to 3"),
  Phase(1.0, "Calibrate Up", "Back" , "Continue", "to 4"),
  Phase(1.0, "Calibrate Down", "Back" , "Continue", "to 6"),
  Phase(0.0, "Calibration Complete", "Back" , "Finish", "Demo Mode"),

];