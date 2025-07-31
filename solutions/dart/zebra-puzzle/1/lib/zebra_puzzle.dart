// this solution below is terrible

enum Animal {
  DOG, SNAIL, FOX, HORSE, ZEBRA
}

enum Color {
  RED, GREEN, IVORY, YELLOW, BLUE
}

enum Nationality {
  ENGLISH("English"), SPANIARD("Spaniard"), UKRAINIAN("Ukrainian"), NORWEGIAN("Norwegian"), JAPANESE("Japanese");

  final String str;

  const Nationality(this.str);
}

enum Position {
  FIRST(0), SECOND(1), THIRD(2), FOURTH(3), FIFTH(4);

  final int i;

  const Position(this.i);

  bool isRightOf(Position other) {
    return this == Position.FIRST && other == Position.SECOND
        || this == Position.SECOND && other == Position.THIRD
        || this == Position.THIRD && other == Position.FOURTH
        || this == Position.FOURTH && other == Position.FIFTH;
  }

  bool isLeftOf(Position other) {
    return other.isRightOf(this);
  }

  bool isSideOf(Position other) {
    return this.isRightOf(other) || this.isLeftOf(other);
  }
}

enum Drink {
  COFFEE, TEA, MILK, JUICE, WATER
}

enum Hobby {
  DANCE, PAINT, READ, FOOTBAL, CHESS
}

class House {

  Color? _color;
  Color? get color => _color;
  set color(Color? value) {

    if (value != null)
      colors.remove(value);
    else if (_color != null)
      colors.add(_color!);
    _color = value;
  }

  Nationality? _nationality;
  Nationality? get nationality => _nationality;
  set nationality(Nationality? value) {
    if (value != null)
      nationalities.remove(value);
    else if (_nationality != null)
      nationalities.add(_nationality!);
    _nationality = value;
  }

  Position? _position;
  Position? get position => _position;
  set position(Position? value) {
    if (value != null)
      positions.remove(value);
    else if (_position != null)
      positions.add(_position!);
    _position = value;
  }

  Drink? _drink;
  Drink? get drink => _drink;
  set drink(Drink? value) {
    if (value != null)
      drinks.remove(value);
    else if (_drink != null)
      drinks.add(_drink!);
    _drink = value;
  }

  Hobby? _hobby;
  Hobby? get hobby => _hobby;
  set hobby(Hobby? value) {
    if (value != null)
      hobbies.remove(value);
    else if (_hobby != null)
      hobbies.add(_hobby!);
    _hobby = value;
  }

  Animal? _animal;
  Animal? get animal => _animal;
  set animal(Animal? value) {
    if (value != null)
      animals.remove(value);
    else if (_animal != null)
      animals.add(_animal!);
    _animal = value;
  }

  House.empty() {

  }

  House.colorWithConstraints(Color color) {
    _color = color;
    if(color == Color.GREEN)
      _drink = Drink.COFFEE;
    if(color == Color.RED)
      _nationality = Nationality.ENGLISH;
  }

  House.nationalityWithConstraints(Nationality nationality) {
    _nationality = nationality;
    if (nationality == Nationality.SPANIARD)
      _animal = Animal.DOG;
    if (nationality == Nationality.UKRAINIAN)
      _drink = Drink.TEA;
    if (nationality == Nationality.JAPANESE)
      _hobby = Hobby.CHESS;
    if (nationality == Nationality.ENGLISH)
      _color = Color.RED;
  }

  House.hobbyWithConstraints(Hobby hobby) {
    _hobby = hobby;
    if (hobby == Hobby.DANCE) {
      _animal = Animal.SNAIL;
    }
    if (hobby == Hobby.FOOTBAL) {
      _drink = Drink.JUICE;
    }
    if (hobby == Hobby.CHESS) {
      _nationality = Nationality.JAPANESE;
    }
  }

  House.drinkWithConstraints(Drink drink) {
    _drink = drink;
    if(drink == Drink.COFFEE){
      color = Color.GREEN;
    }
    if(drink == Drink.TEA){
      nationality = Nationality.UKRAINIAN;
    }
    if(drink == Drink.JUICE){
      hobby = Hobby.FOOTBAL;
    }
  }

  @override
  String toString() {
    return 'House{_color: $_color, _nationality: $_nationality, _position: $_position, _drink: $_drink, _hobby: $_hobby, _animal: $_animal}';
  }

  House.animalWithConstraints(Animal animal) {
    _animal = animal;

    if (animal == Animal.DOG){
      nationality = Nationality.SPANIARD;
    }
    if (animal == Animal.SNAIL){
      hobby = Hobby.DANCE;
    }
  }

  bool merges(House other) {
    if (other.position != null && this.position != null)
      return false;
    else if (other.color != null && this.color != null)
      return false;
    else if (other.nationality != null && this.nationality != null)
      return false;
    else if (other.animal != null && this.animal != null)
      return false;
    else if (other.drink != null && this.drink != null)
      return false;
    else if (other.hobby != null && this.hobby != null)
      return false;
    else
      return true;
  }

  void merge(House other) {
    if (this.position == null)
      this.position = other.position;
    if (this.color == null)
      this.color = other.color;
    if (this.nationality == null)
      this.nationality = other.nationality;
    if (this.animal == null)
      this.animal = other.animal;
    if (this.drink == null)
      this.drink = other.drink;
    if (this.hobby == null)
      this.hobby = other.hobby;
  }

  void unmerge(House other) {
    if (other.position != null)
      this.position = null;
    if (other.color != null)
      this.color = null;
    if (other.nationality != null)
      this.nationality = null;
    if (other.animal != null)
      this.animal = null;
    if (other.drink != null)
      this.drink = null;
    if (other.hobby != null)
      this.hobby = null;
  }

  static List<Color> colors = [Color.RED, Color.IVORY, Color.GREEN, Color.YELLOW, Color.BLUE]; //
  static List<Position> positions = [Position.FIRST, Position.SECOND, Position.THIRD, Position.FOURTH, Position.FIFTH]; //
  static List<Nationality> nationalities = [Nationality.ENGLISH, Nationality.SPANIARD, Nationality.UKRAINIAN, Nationality.NORWEGIAN, Nationality.JAPANESE];//
  static List<Animal> animals = [Animal.DOG, Animal.SNAIL, Animal.FOX, Animal.HORSE, Animal.ZEBRA];
  static List<Drink> drinks = [Drink.COFFEE, Drink.TEA, Drink.MILK, Drink.JUICE, Drink.WATER]; //
  static List<Hobby> hobbies = [Hobby.DANCE, Hobby.PAINT, Hobby.READ, Hobby.FOOTBAL, Hobby.CHESS]; //
}

class ZebraPuzzle {

  List<House> houses = List.generate(5, (i) => House.empty());

  get drinksWater {
    return houses.firstWhere((h) => h.drink == Drink.WATER).nationality?.str ?? "NULL";
  }

  get ownsZebra {
    return houses.firstWhere((h) => h.animal == Animal.ZEBRA).nationality?.str ?? "NULL";
  }

  bool guess() {
    houses.forEach((h) => print(h));
    if (House.colors.isNotEmpty) {
      var colors = House.colors.map((e) => e);
      for (var guessColor in colors) {
        var houseGuess = House.colorWithConstraints(guessColor);
        print("houseGuess: $houseGuess\n");
        var housesToMergeGuess = houses.where((house) => house.merges(houseGuess)).toList();
        for (var i = 0; i< housesToMergeGuess.length; i++) {
          var houseToMergeGuess = housesToMergeGuess[i];
          var j = houseToMergeGuess.position!.i;
          if (guessColor == Color.GREEN && (j == 0 || (houses[j - 1].color != Color.IVORY && houses[j - 1].color != null))) {
            continue;
          } else if (guessColor == Color.IVORY && (j == houses.length - 1 || (houses[j + 1].color != Color.GREEN && houses[j + 1].color != null))) {
            continue;
          }

          houseToMergeGuess.merge(houseGuess);
          if (completeGuessing()) {
            return true;
          } else {
            if(guess())
              return true;
            else {
              print("undo: $houseGuess\n");
              houseToMergeGuess.unmerge(houseGuess);
            }
          }
        }
      }
    }
    else if (House.nationalities.isNotEmpty) {
      var nationalities = House.nationalities.map((e) => e);
      for (var guessNationality in nationalities) {
        var houseGuess = House.nationalityWithConstraints(guessNationality);
        var housesToMergeGuess = houses.where((house) => house.merges(houseGuess)).toList();
        print("houseGuess: $houseGuess\n");
        for (var i = 0; i< housesToMergeGuess.length; i++) {

          var houseToMergeGuess = housesToMergeGuess[i];
          houseToMergeGuess.merge(houseGuess);
          if (completeGuessing()) {
            return true;
          } else {
            if(guess())
              return true;
            else {
              print("undo: $houseGuess\n");
              houseToMergeGuess.unmerge(houseGuess);
            }
          }
        }
      }
    }
    else if (House.drinks.isNotEmpty) {
      var drinks = House.drinks.map((e) => e);
      for (var guessDrink in drinks) {
        var houseGuess = House.drinkWithConstraints(guessDrink);
        print("houseGuess: $houseGuess\n");
        var housesToMergeGuess = houses.where((house) => house.merges(houseGuess)).toList();
        for (var i = 0; i< housesToMergeGuess.length; i++) {
          var houseToMergeGuess = housesToMergeGuess[i];
          houseToMergeGuess.merge(houseGuess);
          if (completeGuessing()) {
            return true;
          } else {
            if(guess())
              return true;
            else {
              print("undo: $houseGuess\n");
              houseToMergeGuess.unmerge(houseGuess);
            }
          }
        }
      }
    }
    else if (House.hobbies.isNotEmpty) {
      var hobbies = House.hobbies.map((e) => e);
      for (var guessHobby in hobbies) {
        var houseGuess = House.hobbyWithConstraints(guessHobby);
        print("houseGuess: $houseGuess\n");
        var housesToMergeGuess = houses.where((house) => house.merges(houseGuess)).toList();
        for (var i = 0; i< housesToMergeGuess.length; i++) {
          var houseToMergeGuess = housesToMergeGuess[i];
          var j = houseToMergeGuess.position!.i;
          if (guessHobby == Hobby.READ
              && (
                  (j != 0 && houses[j - 1].animal != Animal.FOX && houses[j - 1].animal != null)
                  || (j != houses.length - 1 && houses[j + 1].animal != Animal.FOX && houses[j + 1].animal != null)
              )
          ) {
            continue;
          }

          houseToMergeGuess.merge(houseGuess);
          if (completeGuessing()) {
            return true;
          } else {
            if(guess())
              return true;
            else {
              print("undo: $houseGuess\n");
              houseToMergeGuess.unmerge(houseGuess);
            }
          }
        }
      }
    }
    else if (House.animals.isNotEmpty) {
      var animals = House.animals.map((e) => e);
      for (var guessAnimal in animals) {
        var houseGuess = House.animalWithConstraints(guessAnimal);
        print("houseGuess: $houseGuess\n");
        var housesToMergeGuess = houses.where((house) => house.merges(houseGuess)).toList();
        for (var i = 0; i< housesToMergeGuess.length; i++) {
          var houseToMergeGuess = housesToMergeGuess[i];
          var j = houseToMergeGuess.position!.i;
          if (guessAnimal == Animal.FOX
              && (
                  (j != 0 && houses[j - 1].hobby != Hobby.READ && houses[j - 1].hobby != null)
                      || (j != houses.length - 1 && houses[j + 1].hobby != Hobby.READ && houses[j + 1].hobby != null)
              )
          ) {
            continue;
          }

          houseToMergeGuess.merge(houseGuess);
          if (completeGuessing()) {
            return true;
          } else {
            if(guess())
              return true;
            else {
              print("undo: $houseGuess\n");
              houseToMergeGuess.unmerge(houseGuess);
            }
          }
        }
      }
    }
    return false;
  }


  void solve() {

    houses[0].position = Position.FIRST;
    houses[0].nationality = Nationality.NORWEGIAN;
    houses[0].color = Color.YELLOW; // not Green, not Ivory, not blue, not red
    houses[0].hobby = Hobby.PAINT;
    houses[0].animal = null; // not dog, not snail, not horse
    houses[0].drink = Drink.WATER; // not coffee, not tea, not juice, not milk

    houses[1].position = Position.SECOND;
    houses[1].nationality = null; // not Norwegian, not spaniard, not english : Ukrainian of japanese
    houses[1].color = Color.BLUE;
    houses[1].hobby = null; // not dance
    houses[1].animal = Animal.HORSE;
    houses[1].drink = null; //not coffee, not milk, not water

    houses[2].position = Position.THIRD;
    houses[2].nationality = null;    // not Ukrainian, not norwegian
    houses[2].color = null;         // not Green, not Blue, not Yellow: Red or Ivory
    houses[2].hobby = null;         // not football, not paint
    houses[2].animal = null;
    houses[2].drink = Drink.MILK;

    houses[3].position = Position.FOURTH;
    houses[3].nationality = null;
    houses[3].color = null;
    houses[3].hobby = null;
    houses[3].animal = null;
    houses[3].drink = null;

    houses[4].position = Position.FIFTH;
    houses[4].nationality = null;
    houses[4].color = null;      // not Ivory not Blue, not Yellow
    houses[4].hobby = null;
    houses[4].animal = null;
    houses[4].drink = null;

    guess();
    print("END");
    houses.forEach((h) => print(h));

    // houses[?].nationality = Nationality.SPANIARD;
    // houses[?].animal = Animal.DOG;
    //
    // houses[?].color = Color.GREEN;
    // houses[?].drink = Drink.COFFEE;
    //
    // houses[?].nationality = Nationality.UKRAINIAN;
    // houses[?].drink = Drink.TEA;
    //
    // houses[?].animal = Animal.SNAIL;
    // houses[?].hobby = Hobby.DANCE;
    //
    // houses[?].hobby = Hobby.FOOTBAL;
    // houses[?].drink = Drink.JUICE;
    //
    // houses[?].nationality = Nationality.JAPANESE;
    // houses[?].hobby = Hobby.CHESS;

    // houses[?].nationality = Nationality.ENGLISH;
    // houses[?].color = Color.RED;
  }

  void conditions() {
    //The green house is immediately to the right of the ivory house.
    //The person who enjoys reading lives in the house next to the person with the fox.
    //!The painter's house is next to the house with the horse.
    //!The Norwegian lives next to the blue house.
  }

  bool completeGuessing() {
    return House.colors.isEmpty &&
    House.positions.isEmpty &&
    House.nationalities.isEmpty &&
    House.animals.isEmpty &&
    House.drinks.isEmpty &&
    House.hobbies.isEmpty;
  }



/*
    /There are five houses.
    /The Englishman lives in the red house.
    /The Spaniard owns the dog.
    /The person in the green house drinks coffee.
    /The Ukrainian drinks tea.
    -The green house is immediately to the right of the ivory house.
    /The snail owner likes to go dancing.
    /The person in the yellow house is a painter.
    /The person in the middle house drinks milk.
    /The Norwegian lives in the first house.
    -The person who enjoys reading lives in the house next to the person with the fox.
    -The painter's house is next to the house with the horse.
    /The person who plays football drinks orange juice.
    /The Japanese person plays chess.
    -The Norwegian lives next to the blue house.
 */
}

void main() {
  ZebraPuzzle().solve();
}
