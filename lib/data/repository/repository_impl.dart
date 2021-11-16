import 'package:dartz/dartz.dart';
import 'package:my_website/core/app_error.dart';
import 'package:my_website/data/datasource/remote/remote_data_source.dart';
import 'package:my_website/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource remoteDataSource;

  RepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<String>>> getSkills() async {
    try {
      return Right(await remoteDataSource.getSkills());
    } on Exception {
      return Left(AppError('An Error Occurred!'));
    }
  }
}
