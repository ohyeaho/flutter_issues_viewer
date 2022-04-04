import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/pages/widget/sort_button.dart';
import 'package:flutter_issues_viewer/pages/widget/tab_bar_widget.dart';
import 'package:flutter_issues_viewer/pages/widget/tab_widget.dart';
import 'package:flutter_issues_viewer/values/string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static List<Tab> labels = <Tab>[
    Tab(text: S().labelAll),
    Tab(text: S().labelWebView),
    Tab(text: S().labelSharedPreferences),
    Tab(text: S().labelWaitingCustomer),
    Tab(text: S().labelSevere),
    Tab(text: S().labelShare),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: labels.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0,
          title: const Text(
            'Flutter Issues Viewer',
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Stack(
              children: [
                TabBarWidget(labels: labels),
                const SortButton(),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TabBarView(
            children: [
              /// 全てタブ
              TabWidget(label: ''),

              /// p: webviewタブ
              TabWidget(label: S().labelWebView),

              /// p: shared_preferencesタブ
              TabWidget(label: S().labelSharedPreferences),

              /// waiting for customer responseタブ
              TabWidget(label: S().labelWaitingCustomer),

              /// severe: new featureタブ
              TabWidget(label: S().labelSevere),

              /// p: shareタブ
              TabWidget(label: S().labelShare),
            ],
          ),
        ),
      ),
    );
  }

  // /// タブ内容
  // Widget _tabBody() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 8.0),
  //     child: TabBarView(
  //       children: [
  //         /// 全てタブ
  //         TabWidget(label: ''),
  //
  //         /// p: webviewタブ
  //         TabWidget(label: S().labelWebView),
  //
  //         /// p: shared_preferencesタブ
  //         TabWidget(label: S().labelSharedPreferences),
  //
  //         /// waiting for customer responseタブ
  //         TabWidget(label: S().labelWaitingCustomer),
  //
  //         /// severe: new featureタブ
  //         TabWidget(label: S().labelSevere),
  //
  //         /// p: shareタブ
  //         TabWidget(label: S().labelShare),
  //       ],
  //     ),
  //   );
  // }

  // /// ラベルとソートボタンの区画割り
  // Widget _buildTabsRow() {
  //   return Stack(
  //     children: [
  //       Row(
  //         children: [
  //           Expanded(
  //             flex: 9,
  //             child: TabBar(
  //               // controller: tabController,
  //               tabs: labels,
  //               labelColor: Colors.black,
  //               indicatorColor: Colors.blue,
  //               isScrollable: true,
  //             ),
  //           ),
  //           const Expanded(
  //             flex: 2,
  //             child: SizedBox(),
  //           ),
  //         ],
  //       ),
  //       Align(
  //         alignment: Alignment.centerRight,
  //         child: IconButton(
  //           onPressed: () {
  //             // showDialog<String>(context: context, builder: (BuildContext context) => _alertDialog(context));
  //             AlertDialog(
  //               content: SingleChildScrollView(
  //                 child: ListBody(
  //                   children: const [
  //                     Text('1年以上更新のないIssueを除外する'),
  //                     Text('closed状態のIssueを除外する'),
  //                     Text('作成日時の新しい順'),
  //                     Text('最終更新日時の古い順'),
  //                     Text('コメント数の多い順'),
  //                   ],
  //                 ),
  //               ),
  //               actions: <Widget>[
  //                 Center(
  //                   child: SizedBox(
  //                     width: double.infinity,
  //                     child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //                       child: ElevatedButton(
  //                         child: const Text(
  //                           '適用する',
  //                           style: TextStyle(fontWeight: FontWeight.bold),
  //                         ),
  //                         style: ElevatedButton.styleFrom(
  //                           primary: Colors.grey[400],
  //                           onPrimary: Colors.black,
  //                           shape: const StadiumBorder(),
  //                         ),
  //                         onPressed: () => Navigator.pop(context),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             );
  //           },
  //           icon: const Icon(Icons.filter_list),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // /// ラベル
  // Widget _buildTabLabels() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         flex: 9,
  //         child: TabBar(
  //           // controller: tabController,
  //           tabs: labels,
  //           labelColor: Colors.black,
  //           indicatorColor: Colors.blue,
  //           isScrollable: true,
  //         ),
  //       ),
  //       const Expanded(
  //         flex: 2,
  //         child: SizedBox(),
  //       ),
  //     ],
  //   );
  // }

  // /// ソートボタン
  // Widget _buildTabActions() {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: IconButton(
  //       onPressed: () {
  //         // showDialog<String>(context: context, builder: (BuildContext context) => _alertDialog(context));
  //         AlertDialog(
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: const [
  //                 Text('1年以上更新のないIssueを除外する'),
  //                 Text('closed状態のIssueを除外する'),
  //                 Text('作成日時の新しい順'),
  //                 Text('最終更新日時の古い順'),
  //                 Text('コメント数の多い順'),
  //               ],
  //             ),
  //           ),
  //           actions: <Widget>[
  //             Center(
  //               child: SizedBox(
  //                 width: double.infinity,
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //                   child: ElevatedButton(
  //                     child: const Text(
  //                       '適用する',
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     ),
  //                     style: ElevatedButton.styleFrom(
  //                       primary: Colors.grey[400],
  //                       onPrimary: Colors.black,
  //                       shape: const StadiumBorder(),
  //                     ),
  //                     onPressed: () => Navigator.pop(context),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //       icon: const Icon(Icons.filter_list),
  //     ),
  //   );
  // }

  // Widget _alertDialog(BuildContext context) {
  //   return AlertDialog(
  //     content: SingleChildScrollView(
  //       child: ListBody(
  //         children: const [
  //           Text('1年以上更新のないIssueを除外する'),
  //           Text('closed状態のIssueを除外する'),
  //           Text('作成日時の新しい順'),
  //           Text('最終更新日時の古い順'),
  //           Text('コメント数の多い順'),
  //         ],
  //       ),
  //     ),
  //     actions: <Widget>[
  //       Center(
  //         child: SizedBox(
  //           width: double.infinity,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //             child: ElevatedButton(
  //               child: const Text(
  //                 '適用する',
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                 primary: Colors.grey[400],
  //                 onPrimary: Colors.black,
  //                 shape: const StadiumBorder(),
  //               ),
  //               onPressed: () => Navigator.pop(context),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   static List<Tab> labels = <Tab>[
//     Tab(text: S().labelAll),
//     Tab(text: S().labelWebView),
//     Tab(text: S().labelSharedPreferences),
//     Tab(text: S().labelWaitingCustomer),
//     Tab(text: S().labelSevere),
//     Tab(text: S().labelShare),
//   ];
//
//   List<GithubData>? flutterIssues;
//
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: labels.length);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[50],
//         elevation: 0,
//         title: const Text(
//           'Flutter Issues Viewer',
//           style: TextStyle(color: Colors.black),
//         ),
//         automaticallyImplyLeading: false,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(40),
//           child: _buildTabsRow(),
//         ),
//       ),
//       body: _tabBody(),
//     );
//   }
// }
