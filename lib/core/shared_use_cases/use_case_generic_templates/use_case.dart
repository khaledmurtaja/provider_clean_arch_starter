import 'package:equatable/equatable.dart';

abstract class SingleUseCase<Type, Params> {
  Type call(Params params);
}

abstract class ListUseCase<Type, Params> {
  List<Type> call(Params params);
}

abstract class SingleFutureUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class ListFutureUseCase<Type, Params> {
  Future<List<Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
