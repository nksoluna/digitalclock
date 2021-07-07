import 'dart:io';

class Clock {
  final Context state;
  int hh;
  int mm;

  Clock(this.state, this.hh, this.mm) {
    state.clock = this;
  }

  void turnOn(int inhh, int inmm) {
    hh = inhh;
    mm = inmm;
  }

  @override
  String toString() {
    return 'the time is [$hh : $mm]';
  }

  void increment() {
    state.current.increment(state);
  }

  void settonext() {
    state.nextState();
  }
}

class Context {
  State current;
  Clock? clock;

  Context(this.current);

  void nextState() {
    current.nextState(this);
  }

  void setState(State next) {
    current = next;
  }
}

abstract class State {
  void nextState(Context state);
  void increment(Context state);
  String getName();
}

class IdleState implements State {
  @override
  void nextState(Context state) {
    state.setState(HourState());
  }

  @override
  void increment(Context context) {}

  @override
  String getName() {
    return 'Idle';
  }
}

class HourState implements State {
  @override
  void nextState(Context state) {
    state.setState(MinState());
  }

  @override
  void increment(Context state) {
    state.clock!.hh = (state.clock!.hh + 1) % 24;
  }

  @override
  String getName() {
    return 'Set hour';
  }
}

class MinState implements State {
  @override
  void nextState(Context state) {
    state.setState(IdleState());
  }

  @override
  void increment(Context state) {
    state.clock!.mm = (state.clock!.mm + 1) % 60;
  }

  @override
  String getName() {
    return 'Set min';
  }
}

void main(List<String> arguments) {
  var state = Context(IdleState());
  final clocks = Clock(state, 0, 0);
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
    print(clocks);
    afteron = stdin.readLineSync();
  } else {
    exit(0);
  }
  do {
    switch (afteron) {
      case 'inc':
        clocks.increment();
        break;
      case 'set':
        clocks.settonext();
    }
    afteron = stdin.readLineSync();
  } while (afteron != 'exit');

  print(clocks);
  print('state = ${state.current.getName()}');
}
