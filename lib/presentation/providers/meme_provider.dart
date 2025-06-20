import 'package:flutter/material.dart';
import '../../domain/entities/meme.dart';
import '../../domain/failures/failures.dart';
import '../../domain/usecases/get_memes_usecase.dart';
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
enum LoadingState { initial, loading, loaded, error }

class MemeProvider extends ChangeNotifier {
  final GetMemesUseCase getMemesUseCase;

  MemeProvider({required this.getMemesUseCase});

  // State management variables
  LoadingState _state = LoadingState.initial;
  List<Meme> _memes = [];
  String _errorMessage = '';

  // Getters
  LoadingState get state => _state;
  List<Meme> get memes => _memes;
  String get errorMessage => _errorMessage;

  // Load all memes
  Future<void> loadMemes() async {
    _state = LoadingState.loading;
    notifyListeners();

    // Call the use case to get memes
    final result = await getMemesUseCase.execute();

    // Handle the result using fold from Either
    result.fold(
      (failure) {
        _state = LoadingState.error;
        _errorMessage = failure.message;
      },
      (memes) {
        _state = LoadingState.loaded;
        _memes = memes;
      },
    );

    notifyListeners();
  }
} 