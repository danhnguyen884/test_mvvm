import 'package:test_mvvm/src/core/models/media.dart';
import 'package:test_mvvm/src/core/services/base_service.dart';
import 'package:test_mvvm/src/core/services/media_service.dart';

class MediaRepository {
  BaseService _mediaService = MediaService();

  Future<List<Media>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response['results'] as List;
    List<Media> mediaList =
        jsonData.map((tagJson) => Media.fromJson(tagJson)).toList();
    return mediaList;
  }
}