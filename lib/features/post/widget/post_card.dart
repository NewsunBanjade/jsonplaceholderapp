import 'package:flutter/material.dart';
import 'package:placeholderapp/core/theme/colors.dart';
import 'package:placeholderapp/features/post/model/post.dart';
import 'package:placeholderapp/features/post_detail/page/post_detail_page.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailPage(post: post),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              post.body,
              style: const TextStyle(color: AppColors.subtitleColor),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
