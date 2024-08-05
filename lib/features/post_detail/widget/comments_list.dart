import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:placeholderapp/core/widget/app_error_widget.dart';
import 'package:placeholderapp/features/post_detail/provider/comment_provider.dart';
import 'package:placeholderapp/features/post_detail/widget/comment_card.dart';

class CommentsList extends ConsumerWidget {
  const CommentsList({super.key, required this.postId});
  final int postId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController commentController = TextEditingController();
    final comments = ref.watch(commentsProvider(postId));
    return comments.when(
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "replies - ${data.length}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CommentCard(
                      comment: data[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: data.length),
          ),
          TextField(
            controller: commentController,
            decoration: InputDecoration(
                hintText: "write reply here...",
                fillColor: Colors.white,
                filled: true,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      if (commentController.text.isEmpty) return;
                      ref
                          .read(commentsProvider(postId).notifier)
                          .postComment(commentController.text);
                    },
                    icon: const Icon(Icons.send))),
          )
        ],
      ),
      error: (error, stackTrace) => AppErrorWidget(
        errorText: "Error While Fetching Comments",
        onRefresh: () {
          ref.refresh(commentsProvider(postId));
        },
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
