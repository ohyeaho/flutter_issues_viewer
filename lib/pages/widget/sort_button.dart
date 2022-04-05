import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {
          AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text('1年以上更新のないIssueを除外する'),
                  Text('closed状態のIssueを除外する'),
                  Text('作成日時の新しい順'),
                  Text('最終更新日時の古い順'),
                  Text('コメント数の多い順'),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ElevatedButton(
                      child: const Text(
                        '適用する',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[400],
                        onPrimary: Colors.black,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        icon: const Icon(Icons.filter_list),
      ),
    );
  }
}
