import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:provider/provider.dart';

class IssueCardTop extends StatelessWidget {
  const IssueCardTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = context.select((GithubData value) => value.number);
    final comments = context.select((GithubData value) => value.commentCount);

    return Expanded(
      flex: 1,
      child: Row(
        children: [
          /// number部分
          Text(
            'No.$number',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(width: 15),

          /// commentCount部分
          Row(
            children: [
              const Icon(
                Icons.comment,
                size: 15,
              ),
              const SizedBox(width: 3),
              Text(
                comments.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
