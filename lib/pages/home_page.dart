import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/github_api.dart';
import 'package:flutter_issues_viewer/values/string.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  static List<Tab> labels = <Tab>[
    Tab(text: S().labelAll),
    Tab(text: S().labelWebView),
    Tab(text: S().labelSharedPreferences),
    Tab(text: S().labelWaitingCustomer),
    Tab(text: S().labelSevere),
    Tab(text: S().labelShare),
  ];

  List<GithubData>? flutterIssues;

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
    // return ElevatedButton(
    //     onPressed: () async {
    //       await GithubApi().getGithubApi();
    //     },
    //     child: Text('test'));

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TabBarView(
        controller: _tabController,
        children: [
          FutureBuilder(
              future: GithubApi().getGithubApi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  flutterIssues = snapshot.data;
                  return ListView.builder(
                      itemCount: flutterIssues!.length,
                      itemBuilder: (context, index) {
                        //DateTime型変換
                        final formatter = DateFormat('yyyy年MM月dd日 HH:mm');
                        final formattedCreatedAt = formatter.format(flutterIssues![index].createdAt);
                        final formattedUpdatedAt = formatter.format(flutterIssues![index].updatedAt);

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
                                height: 200,

                                /// カード内3分割 [[number,commentCount],title],[description],[createdAt]
                                child: Column(
                                  children: [
                                    /// [[number,commentCount],title]部分
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          /// [number,commentCount]部分
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                /// number部分
                                                Text(
                                                  'No. ${flutterIssues![index].number}',
                                                  style: const TextStyle(fontSize: 12),
                                                ),
                                                const SizedBox(width: 15),

                                                /// commentCount部分
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.comment,
                                                      size: 15,
                                                    ),
                                                    const SizedBox(width: 3),
                                                    Text(
                                                      flutterIssues![index].commentCount.toString(),
                                                      style: const TextStyle(fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          /// title部分
                                          Expanded(
                                            flex: 5,
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.info_outline,
                                                  color: Colors.green,
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    flutterIssues![index].title,
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
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// description部分
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.blue.withOpacity(0.2),
                                        child: Text(flutterIssues![index].description ?? 'no description'),
                                      ),
                                    ),

                                    /// createdAt部分
                                    Expanded(
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
                                                  '作成日時: $formattedCreatedAt',
                                                  style: const TextStyle(fontSize: 12),
                                                ),
                                                formattedCreatedAt != formattedUpdatedAt
                                                    ? Text(
                                                        '更新日時: $formattedUpdatedAt',
                                                        style: const TextStyle(fontSize: 12),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: const Text('View full issue'),
                                              style: OutlinedButton.styleFrom(primary: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          ListView.builder(itemBuilder: (context, index) {
            return Text('test');
          }),
          ListView.builder(itemBuilder: (context, index) {
            return Text('test');
          }),
          ListView.builder(itemBuilder: (context, index) {
            return Text('test');
          }),
          ListView.builder(itemBuilder: (context, index) {
            return Text('test');
          }),
          ListView.builder(itemBuilder: (context, index) {
            return Text('test');
          }),
        ],
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
          showDialog<String>(context: context, builder: (BuildContext context) => _alertDialog(context));
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
