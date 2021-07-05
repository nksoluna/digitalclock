import 'package:digital/digital.dart' as digital;

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

  void setTime() {}
}

void main(List<String> arguments) {
  print('Hello world: ${digital.calculate()}!');
}
