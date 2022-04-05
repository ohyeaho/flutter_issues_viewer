import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/main.dart';
import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:intl/intl.dart";
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class IssueCardDate extends StatelessWidget {
  const IssueCardDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DateTime型変換
    final formatter = DateFormat('yyyy年MM月dd日 HH:mm');
    final createdAt = formatter.format(context.select((GithubData value) => value.createdAt!));
    final updatedAt = formatter.format(context.select((GithubData value) => value.updatedAt!));

    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '作成日時: $createdAt',
                  style: const TextStyle(fontSize: 12),
                ),
                // 更新されているときのみ更新日時を表示
                createdAt != updatedAt
                    ? Text(
                        '更新日時: $updatedAt',
                        style: const TextStyle(fontSize: 12),
                      )
                    : const SizedBox(),
              ],
            ),
            OutlinedButton(
              onPressed: () async {
                await launchUrl(context);
              },
              child: const Text('View full issue'),
              style: OutlinedButton.styleFrom(primary: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

///webページへ遷移
Future<void> launchUrl(BuildContext context) async {
  final url = context.read<GithubData>().url;
  try {
    await launch(url!);
  } on Exception catch (e) {
    await Fluttertoast.showToast(msg: 'URLの起動に失敗しました。');
    logger.d(e.toString());
  }
}
