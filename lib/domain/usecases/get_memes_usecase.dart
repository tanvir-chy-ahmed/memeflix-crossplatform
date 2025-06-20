import 'package:dartz/dartz.dart';
import '../entities/meme.dart';
import '../failures/failures.dart';
import '../repositories/meme_repository.dart';
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
class GetMemesUseCase {
  final MemeRepository repository;

  GetMemesUseCase(this.repository);

  /// Execute the use case to get memes
  Future<Either<Failure, List<Meme>>> execute() {
    return repository.getMemes();
  }
} 