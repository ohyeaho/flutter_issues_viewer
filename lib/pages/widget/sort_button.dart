import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class SortButton extends StatelessWidget {
  const SortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingingCharacter? _character = SingingCharacter.lafayette;
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () async {
          showDialog<void>(
              builder: (context) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: AlertDialog(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Checkbox(
                                  value: true,
                                  onChanged: (bool? value) {},
                                ),
                              ),
                              const Spacer(),
                              const Expanded(
                                flex: 9,
                                child: Text('1年以上更新のないIssueを除外する'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (bool? value) {},
                                ),
                              ),
                              const Spacer(),
                              const Expanded(
                                flex: 9,
                                child: Text('closed状態のIssueを除外する'),
                              ),
                            ],
                          ),
                          ListTile(
                            title: const Text('作成日時の新しい順'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.lafayette,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                // setState(() {
                                //   _character = value;
                                // });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('最終更新日時の古い順'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.jefferson,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                // setState(() {
                                //   _character = value;
                                // });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('コメント数の多い順'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.jefferson,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                // setState(() {
                                //   _character = value;
                                // });
                              },
                            ),
                          ),
                        ],
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
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              context: context);
        },
        icon: const Icon(Icons.filter_list),
      ),
    );
  }

  // Future<void> _filterState(BuildContext context) async {
  //   await context.read<IssuesStateNotifier>().filterState();
  // }
}
