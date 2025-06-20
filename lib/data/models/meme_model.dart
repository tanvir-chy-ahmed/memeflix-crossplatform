import '../../domain/entities/meme.dart';
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
class MemeModel extends Meme {
  MemeModel({
    required String id,
    required String name,
    required String url,
    required int width,
    required int height,
    required int boxCount,
    required int captions,
  }) : super(
          id: id,
          name: name,
          url: url,
          width: width,
          height: height,
          boxCount: boxCount,
          captions: captions,
        );

  // Factory constructor to create a MemeModel from a JSON map
  factory MemeModel.fromJson(Map<String, dynamic> json) {
    return MemeModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
      boxCount: json['box_count'],
      captions: json['captions'],
    );
  }

  // Convert model to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'width': width,
      'height': height,
      'box_count': boxCount,
      'captions': captions,
    };
  }
} 