import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placeholderapp/core/config/app_url.dart';
import 'package:placeholderapp/core/service/dio/dio_services.dart';
import 'package:placeholderapp/features/post/model/post.dart';

final postProvider = FutureProvider<List<Post>>((ref) async {
  return await () async {
    try {
      final List<dynamic> data =
          await ref.read(dioServiceProvider).getDataWithOutAuth(AppUrl.posts);
      return data.map((e) => Post.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }();
});
