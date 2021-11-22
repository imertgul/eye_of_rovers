// ignore_for_file: constant_identifier_names

abstract class Rover {
  String get name;
  List<Camera> get availableCameras;
}

class Curiosity extends Rover {
  @override
  String get name => 'Curiosity';

  @override
  List<Camera> get availableCameras => [
        Camera.FHAZ,
        Camera.RHAZ,
        Camera.MAST,
        Camera.CHEMCAM,
        Camera.MAHLI,
        Camera.MARDI,
        Camera.NAVCAM
      ];
}

class Spirit extends Rover {
  @override
  String get name => 'Spirit';

  @override
  List<Camera> get availableCameras => [
        Camera.FHAZ,
        Camera.RHAZ,
        Camera.NAVCAM,
        Camera.PANCAM,
        Camera.MINITES,
      ];
}

class Opportunity extends Rover {
  @override
  String get name => 'Opportunity';
  
  @override
  List<Camera> get availableCameras => [
        Camera.FHAZ,
        Camera.RHAZ,
        Camera.NAVCAM,
        Camera.PANCAM,
        Camera.MINITES,
      ];
}

enum Camera { FHAZ, RHAZ, MAST, CHEMCAM, MAHLI, MARDI, NAVCAM, PANCAM, MINITES }
