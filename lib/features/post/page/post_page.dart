import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placeholderapp/core/config/app_config.dart';
import 'package:placeholderapp/core/widget/animated_scroll_view_item.dart';
import 'package:placeholderapp/core/widget/app_error_widget.dart';
import 'package:placeholderapp/features/post/provider/post_provider.dart';
import 'package:placeholderapp/features/post/widget/post_card.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postProvider);
    return Scaffold(
      body: Padding(
        padding: AppConfig.kDefaultPadding,
        child: posts.when(
          data: (data) => ListView.separated(
              cacheExtent: 0,
              itemBuilder: (context, index) =>
                  AnimatedScrollViewItem(child: PostCard(post: data[index])),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: data.length),
          error: (error, stackTrace) => AppErrorWidget(
            errorText: error.toString(),
            onRefresh: () {
              ref.refresh(postProvider);
            },
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
