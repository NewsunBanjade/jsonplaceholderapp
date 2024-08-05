import 'package:flutter/material.dart';
import 'package:placeholderapp/core/theme/colors.dart';
import 'package:placeholderapp/features/post_detail/model/comment.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [BoxShadow(offset: Offset(4, 4))]),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text(comment.name[0]),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      comment.email,
                      style: const TextStyle(color: AppColors.subtitleColor),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            comment.body,
          )
        ],
      ),
    );
  }
}
