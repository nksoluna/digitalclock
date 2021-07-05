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
  String? commandnumber = stdin.readLineSync() ?? "nothing in here";
  List commandList = commandnumber.split(' ');
  var textcommand = commandList[0].toString();
  var hh = commandList[0].toString();
  var hour = int.parse(hh);
  var mm = commandList[1].toString();
  var minutes = int.parse(mm);

  do {
    if (command == 'On') {
      clocks.turnOn(hour, minutes);
      clocks.showtime();
    } else if (command == 'Set') {
      do {
        command = stdin.readLineSync();
        if (command == 'inc') {
          clocks.inchour();
        } else if (command == 'Set') {
          clocks.showtime();
          break;
        } else {
          print('Wrong command');
        }
      } while (command != 'Set');
    } else if (command == 'inc') {
      clocks.incmin();
    } else if (command == 'Show') {
      clocks.showtime();
    } else {
      print('Wrong command');
    }
    command = stdin.readLineSync();
  } while (command != 'Exit');
}
