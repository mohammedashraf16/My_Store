abstract class RouteExceptions {
  String message;

  RouteExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}

class RouteLocalException extends RouteExceptions {
  RouteLocalException(super.message);

  @override
  String toString() {
    return super.message;
  }
}

class RouteRemoteException extends RouteExceptions {
  RouteRemoteException(super.message);

  @override
  String toString() {
    return super.message;
  }
}
