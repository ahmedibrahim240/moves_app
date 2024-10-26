typedef Lazy<T> = T Function();

sealed class Either<L, R> {
  const Either();

  bool get isLeft => this is Left<L, R>;

  bool get isRight => this is Right<L, R>;

  L get left => this.fold<L>(
      (value) => value,
      (right) => throw Exception(
          'Illegal use. You should check isLeft before calling'));

  R get right => this.fold<R>(
      (left) => throw Exception(
          'Illegal use. You should check isRight before calling'),
      (value) => value);

  T fold<T>(T Function(L failure) fnL, T Function(R success) fnR);
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  T fold<T>(T Function(L left) fnL, T Function(R right) fnR) {
    return fnL(value);
  }
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  T fold<T>(T Function(L left) fnL, T Function(R right) fnR) {
    return fnR(value);
  }
}
