library intro;

export 'src/intro_base.dart';
// Importing core libraries
import 'dart:html';
import 'dart:math';

// Importing libraries from external packages
import 'package:test/test.dart';

// Importing files
//import '/workspace/flutter/lib/main.dart';

class Spacecraft {
  String name;
  DateTime? launchDate;

  //Read-only non-final property
  int? get launchYear => launchDate?.year;

  //Constructor, with suntactic suger for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    //Initialization code goes here.
  }

  //Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  //Method.
  void describe() {
    print('Spacecraft:$name');
    //Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  //...
}

class MockSpaceship implements Spacecraft {
  //...
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('==========');
  }
}

const oneSecond = Duration(seconds: 1);
//...
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> printWithDelay(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try{
      var file = File()
    }
  } 
}

enum PlanetType { terrsetrial, gas, ice }

enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void main() {
  print('Hello, World!');
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);

  flybyObjects.where((name) => name.contains('turn')).forEach(print);

  //This is a normal, one-line comment.

  ///This is a documentation comment, used to document libraries,
  ///classes, and their members. Tools like IDEs and dartdoc treat
  ///doc comments specially.

  /*Comments like these are also supported.*/

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  final yourPlanet = Planet.earth;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }
}
