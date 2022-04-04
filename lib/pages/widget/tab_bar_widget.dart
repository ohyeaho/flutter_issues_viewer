import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.labels,
  }) : super(key: key);

  final List<Tab> labels;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TabBar(
            tabs: labels,
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
            isScrollable: true,
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
      ],
    );
  }
}
