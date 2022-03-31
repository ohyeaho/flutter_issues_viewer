import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> labels = <Tab>[
    Tab(text: '全て'),
    Tab(text: 'p: web view'),
    Tab(text: 'p: shared_preferences'),
    Tab(text: 'waiting for customer response'),
    Tab(text: 'severe: new feature'),
    Tab(text: 'p: share'),
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
        title: const Text('Flutter Issues Viewer'),
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
    return TabBarView(
      controller: _tabController,
      children: labels.map((Tab tab) {
        final String label = tab.text!.toLowerCase();
        return ListView.builder(itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(label),
              ),
            ),
          );
        });
      }).toList(),
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
        onPressed: () {},
        icon: const Icon(Icons.filter_list),
      ),
    );
  }
}
