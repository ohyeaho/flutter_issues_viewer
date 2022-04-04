import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/constant.dart';
import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:provider/provider.dart';

class IssueCardTitle extends StatelessWidget {
  const IssueCardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.select((GithubData value) => value.title);
    final state = context.select((GithubData value) => value.state);

    return Expanded(
      flex: 5,
      child: Row(
        children: [
          state == Constant.issueStateOpen
              ? const Icon(
                  Icons.info_outline,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.check_circle_outline,
                  color: Colors.purple,
                ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title!,
              maxLines: 3,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
