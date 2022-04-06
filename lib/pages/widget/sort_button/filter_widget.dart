import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  var sinceCheckBox = false;
  var stateCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Checkbox(
                  value: sinceCheckBox,
                  onChanged: (bool? value) {
                    setState(() {
                      sinceCheckBox = value!;
                    });
                  },
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
                  value: stateCheckBox,
                  onChanged: (bool? value) {
                    setState(() {
                      stateCheckBox = value!;
                    });
                  },
                ),
              ),
              const Spacer(),
              const Expanded(
                flex: 9,
                child: Text('closed状態のIssueを除外する'),
              ),
            ],
          ),
        ],
      );
    });
  }
}
