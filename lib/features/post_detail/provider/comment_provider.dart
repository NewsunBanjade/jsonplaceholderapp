import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placeholderapp/core/config/app_config.dart';
import 'package:placeholderapp/core/config/app_url.dart';
import 'package:placeholderapp/core/service/dio/dio_services.dart';
import 'package:placeholderapp/features/post_detail/model/comment.dart';

class CommentNotifier extends FamilyAsyncNotifier<List<Comment>, int> {
  @override
  FutureOr<List<Comment>> build(int arg) {
    return getComments();
  }

  Future<List<Comment>> getComments() async {
    try {
      final List<dynamic> data = await ref
          .read(dioServiceProvider)
          .getDataWithOutAuth(AppUrl.comments(arg));
      return data
          .map(
            (e) => Comment.fromMap(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  void postComment(String message) async {
    try {
      final comment = Comment(
          id: -1,
          name: "Newsun Banjade",
          email: "myemail@io.com",
          body: message);
      await ref
          .read(dioServiceProvider)
          .postWithOutAuth(AppUrl.comments(arg), comment.toMap());
      state = AsyncValue.data([...?state.value, comment]);
    } catch (e) {
      AppConfig.showErrorToast("Error While Posting Comment Please Try Later");
    }
  }
}

final commentsProvider =
    AsyncNotifierProviderFamily<CommentNotifier, List<Comment>, int>(
  () {
    return CommentNotifier();
  },
);
