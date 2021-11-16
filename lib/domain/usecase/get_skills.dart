import 'package:dartz/dartz.dart';
import 'package:my_website/core/app_error.dart';
import 'package:my_website/data/repository/repository_impl.dart';
import 'package:my_website/domain/repository/repository.dart';

import 'no_params.dart';
import 'use_case.dart';

class GetSkills extends UseCase<List<String>, NoParams> {
  final Repository repository;

  GetSkills(this.repository);

  @override
  Future<Either<AppError, List<String>>> call(NoParams params) async {
    return await repository.getSkills();
  }
}
