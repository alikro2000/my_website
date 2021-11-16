import 'package:dartz/dartz.dart';
import 'package:my_website/core/app_error.dart';

abstract class Repository {
  Future<Either<AppError, List<String>>> getSkills();
}