import 'package:flutter/material.dart';
import 'package:placeholderapp/core/theme/colors.dart';
import 'package:placeholderapp/core/widget/back_button.dart';
import 'package:placeholderapp/features/post/model/post.dart';
import 'package:placeholderapp/features/post_detail/widget/comments_list.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NeoBackButton(),
              const SizedBox(
                height: 10,
              ),
              Text(
                post.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                post.body,
                style: const TextStyle(
                    color: AppColors.subtitleColor, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(child: CommentsList(postId: post.id))
            ],
          ),
        ),
      ),
    );
  }
}
