abstract class Failures {

  final String message;

  Failures(this.message);

}

class SomeSpecificError extends Failures {
  SomeSpecificError(super.message);

}