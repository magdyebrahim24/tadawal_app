import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadawal/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}


// to pass in classes which get data not post
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
