import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/github_api.dart';
import 'package:flutter_issues_viewer/values/string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static List<Tab> labels = <Tab>[
    Tab(text: S().labelAll),
    Tab(text: S().labelWebView),
    Tab(text: S().labelSharedPreferences),
    Tab(text: S().labelWaitingCustomer),
    Tab(text: S().labelSevere),
    Tab(text: S().labelShare),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: labels.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: _buildTabsRow(),
        ),
      ),
      body: _tabBody(),
    );
  }

  /// タブ内容
  Widget _tabBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TabBarView(
        controller: _tabController,
        children: labels.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return ListView.builder(itemBuilder: (context, index) {
            return _buildCard(label);
          });
        }).toList(),
      ),
    );
  }

  /// issues内容表示
  Widget _buildCard(String label) {
    final flutterIssues = GithubApi(
      number: 54063,
      commentCount: 2,
      title: 'stable',
      description:
          'Command flutter run --machine --start-paused -d gubexwivz5e6eyt8 --dart-define=flutter',
      dateTime: DateTime(2020, 4, 6),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 150,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('No. ${flutterIssues.number}'),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                const Icon(Icons.comment),
                                Text(flutterIssues.commentCount.toString()),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              flutterIssues.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue.withOpacity(0.2),
                    child: Center(child: Text(flutterIssues.description)),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                            '${flutterIssues.dateTime!.year}年${flutterIssues.dateTime!.month}月${flutterIssues.dateTime!.day}日'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('View full issue'),
                        style: OutlinedButton.styleFrom(primary: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ラベルとソートボタンの区画割り
  Widget _buildTabsRow() {
    return Stack(
      children: [
        _buildTabLabels(),
        _buildTabActions(),
      ],
    );
  }

  /// ラベル
  Widget _buildTabLabels() {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TabBar(
            controller: _tabController,
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

  /// ソートボタン
  Widget _buildTabActions() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => _alertDialog(context));
        },
        icon: const Icon(Icons.filter_list),
      ),
    );
  }

  Widget _alertDialog(BuildContext context) {
    return AlertDialog(
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
  }
}
