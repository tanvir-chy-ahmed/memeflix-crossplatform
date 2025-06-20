import 'package:dartz/dartz.dart';
import '../entities/meme.dart';
import '../failures/failures.dart';
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
abstract class MemeRepository {
  /// Fetch all memes from API
  /// Returns either a [List<Meme>] or a [Failure]
  Future<Either<Failure, List<Meme>>> getMemes();
} 