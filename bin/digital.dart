import 'package:digital/digital.dart' as digital;
import 'dart:io';

class Clock {
  int hh;
  int mm;

  Clock(this.hh, this.mm);

  void turnOn(int inhh, int inmm) {
    hh = inhh;
    mm = inmm;
  }

  void showtime() {
    print('the time is [$hh : $mm]');
  }

  void inchour() {
    hh = (hh + 1) % 24;
  }

  void incmin() {
    mm = (mm + 1) % 60;
  }
}

void main(List<String> arguments) {
  final clocks = Clock(0, 0);
  String? command = stdin.readLineSync();

  do {
    if (command == 'On') {
      clocks.turnOn(18, 0);
      clocks.showtime();
    } else if (command == 'Set') {
      do {
        command = stdin.readLineSync();
        if (command == 'inc') {
          clocks.inchour();
          clocks.showtime();
        } else if (command != 'Set') {
          break;
        }
      } while (command != 'Set');
    } else if (command == 'inc') {
      clocks.incmin();
      clocks.showtime();
    } else if (command == 'Show') {
      clocks.showtime();
    }
    command = stdin.readLineSync();
  } while (command != 'Exit');
}
