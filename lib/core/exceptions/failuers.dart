  class Failures {
  String errorMessage;
  Failures( this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }

}

class ServerError extends Failures {
  ServerError(super.errorMessage);

  @override
  String toString() {
    return super.errorMessage;
  }
}
class ClientError extends Failures {
  ClientError(super.errorMessage);

  @override
  String toString() {
    return super.errorMessage;
  }
}

class NetworkError extends Failures {
  NetworkError( super.errorMessage);

  @override
  String toString() {
    return super.errorMessage;
  }
}

