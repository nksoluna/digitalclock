import 'package:digital/digital.dart' as digital;
import 'dart:io';

class Clock {
  int hh;
  int mm;

  Clock(this.hh, this.mm);

  void turnOn() {
    hh = 0;
    mm = 0;
  }

  void showtime() {
    print('the time is [$hh : $mm]');
  }

  void inc() {
    hh = hh + 1;
  }
}

void main(List<String> arguments) {
  String? command = stdin.readLineSync();
  if (command == 'On') {
    final clocks = Clock(0, 0);

    clocks.showtime();
  }
}
