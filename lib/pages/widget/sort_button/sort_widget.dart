import 'package:flutter/material.dart';

enum SingingCharacter { sortCreated, sortUpdated, sortComments }

class SortWidget extends StatefulWidget {
  const SortWidget({Key? key}) : super(key: key);

  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  @override
  Widget build(BuildContext context) {
    SingingCharacter? _character = SingingCharacter.sortCreated;

    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Radio<SingingCharacter>(
                  value: SingingCharacter.sortCreated,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              const Spacer(),
              const Expanded(
                flex: 9,
                child: Text('作成日時の新しい順'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Radio<SingingCharacter>(
                  value: SingingCharacter.sortUpdated,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              const Spacer(),
              const Expanded(
                flex: 9,
                child: Text('最終更新日時の古い順'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Radio<SingingCharacter>(
                  value: SingingCharacter.sortComments,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              const Spacer(),
              const Expanded(
                flex: 9,
                child: Text('コメント数の多い順'),
              ),
            ],
          ),
        ],
      );
    });
  }
}
