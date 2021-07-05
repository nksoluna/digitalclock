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
  String? command = stdin.readLineSync() ?? 'nothing in here';
  List commandList = command.split(' ');
  String? afteron;
  var textcommand = commandList[0].toString();
  var hh = commandList[1].toString();
  var hour = int.parse(hh);
  var mm = commandList[2].toString();
  var minutes = int.parse(mm);

  if (textcommand == 'on') {
    clocks.turnOn(hour, minutes);
    clocks.showtime();
    afteron = stdin.readLineSync();
  } else {
    throw (exit(0));
  }
  do {
    if (afteron == 'set') {
      do {
        afteron = stdin.readLineSync();
        if (afteron == 'inc') {
          clocks.inchour();
        } else if (afteron == 'set') {
          break;
        } else {
          print('Wrong command');
        }
      } while (afteron != 'set');
    } else if (afteron == 'inc') {
      clocks.incmin();
    } else if (afteron == 'show') {
      clocks.showtime();
    } else {
      print('Wrong command');
    }
    afteron = stdin.readLineSync();
  } while (afteron != 'exit');
}
