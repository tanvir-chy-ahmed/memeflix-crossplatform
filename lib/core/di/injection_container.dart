import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../data/datasources/meme_remote_datasource.dart';
import '../../data/repositories/meme_repository_impl.dart';
import '../../domain/repositories/meme_repository.dart';
import '../../domain/usecases/get_memes_usecase.dart';
import '../../presentation/providers/meme_provider.dart';
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


// Service locator instance
final sl = GetIt.instance;

/// Initialize all dependencies
Future<void> init() async {
  // Providers (presentation layer)
  sl.registerFactory(
    () => MemeProvider(getMemesUseCase: sl()),
  );

  // Use cases (domain layer)
  sl.registerLazySingleton(() => GetMemesUseCase(sl()));

  // Repositories (data layer)
  sl.registerLazySingleton<MemeRepository>(
    () => MemeRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources (data layer)
  sl.registerLazySingleton<MemeRemoteDataSource>(
    () => MemeRemoteDataSourceImpl(client: sl()),
  );

  // External dependencies
  sl.registerLazySingleton(() => http.Client());
} 