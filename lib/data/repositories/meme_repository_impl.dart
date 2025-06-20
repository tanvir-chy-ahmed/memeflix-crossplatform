import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/entities/meme.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/meme_repository.dart';
import '../datasources/meme_remote_datasource.dart';
/*
**************************************************
*        📱 Mobile App Developer - Tanvir         *
*------------------------------------------------ *
*  🚀 Native & Hybrid App Development Expert      *
*  💼 Tech Stack: Flutter | Jetpack | Firebase    *
*  📧 Email: dev.tanvirchy269@gmail.com           *
*  🌐 GitHub: https://github.com/tanvir-chy-ahmed *
*  📍 Location: Bangladesh                        *
*                                                 *
*  Need an app? Let’s build something great!      *
**************************************************
*/

class MemeRepositoryImpl implements MemeRepository {
  final MemeRemoteDataSource remoteDataSource;

  MemeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Meme>>> getMemes() async {
    try {
      // Try to get memes from the remote data source
      final memes = await remoteDataSource.getMemes();
      
      // Return the right side of Either with the memes data
      return Right(memes);
    } on SocketException {
      // Return network failure if there's a network issue
      return Left(NetworkFailure());
    } on Exception catch (e) {
      // Return server failure with error message
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      // Return unexpected failure for any other errors
      return Left(UnexpectedFailure());
    }
  }
} 