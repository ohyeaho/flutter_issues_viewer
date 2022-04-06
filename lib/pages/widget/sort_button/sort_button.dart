import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/pages/widget/sort_button/done_button.dart';
import 'package:flutter_issues_viewer/pages/widget/sort_button/filter_widget.dart';
import 'package:flutter_issues_viewer/pages/widget/sort_button/sort_widget.dart';

class SortButton extends StatefulWidget {
  const SortButton({Key? key}) : super(key: key);

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () async {
          showDialog<void>(
              builder: (context) => StatefulBuilder(builder: (context, setState) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: AlertDialog(
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            FilterWidget(),
                            SortWidget(),
                          ],
                        ),
                        actions: const <Widget>[
                          SortDoneButton(),
                        ],
                      ),
                    );
                  }),
              context: context);
        },
        icon: const Icon(Icons.filter_list),
      ),
    );
  }
}
