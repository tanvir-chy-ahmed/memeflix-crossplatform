import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/meme_model.dart';
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
abstract class MemeRemoteDataSource {
  /// Gets a list of memes from the remote API
  /// Throws [ServerException] on API error
  Future<List<MemeModel>> getMemes();
}

class MemeRemoteDataSourceImpl implements MemeRemoteDataSource {
  final http.Client client;
  
  // API URL for the Imgflip API
  final String _baseUrl = 'https://api.imgflip.com/get_memes';

  MemeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MemeModel>> getMemes() async {
    try {
      // Make the HTTP GET request
      final response = await client.get(Uri.parse(_baseUrl));
      
      // Check if response is successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        final jsonData = jsonDecode(response.body);
        
        // Check if the API returned success status
        if (jsonData['success'] == true) {
          // Extract the memes array from the response
          final List<dynamic> memesJson = jsonData['data']['memes'];
          
          // Convert each JSON object to a MemeModel
          return memesJson.map((json) => MemeModel.fromJson(json)).toList();
        } else {
          throw Exception('API returned success: false');
        }
      } else {
        throw Exception('Failed to load memes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching memes: $e');
    }
  }
} 