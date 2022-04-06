import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/constant.dart';
import 'package:flutter_issues_viewer/models/github_data.dart';
import 'package:intl/intl.dart';

class InfinityListView extends StatefulWidget {
  final List<GithubData> flutterIssues;
  final Future<void> Function() getContents;

  const InfinityListView({
    Key? key,
    required this.flutterIssues,
    required this.getContents,
  }) : super(key: key);

  @override
  State<InfinityListView> createState() => _InfinityListViewState();
}

class _InfinityListViewState extends State<InfinityListView> {
  // List<GithubData>? flutterIssues;
  late ScrollController scrollController;
  bool isLoading = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent * 0.95 && !isLoading) {
        isLoading = true;

        await widget.getContents();

        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        //todo: 更新処理
        print('refresh');
      },
      child: ListView.builder(
          controller: scrollController,
          itemCount: widget.flutterIssues.length + 1,
          itemBuilder: (context, index) {
            if (widget.flutterIssues.length == index) {
              return const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            //DateTime型変換
            final formatter = DateFormat('yyyy年MM月dd日 HH:mm');
            final formattedCreatedAt = formatter.format(widget.flutterIssues[index].createdAt);
            final formattedUpdatedAt = formatter.format(widget.flutterIssues[index].updatedAt);

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
                        topAndTitleCard(index),
                        descriptionCard(index),
                        dateCard(formattedCreatedAt, formattedUpdatedAt),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Expanded topAndTitleCard(int index) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          topCard(index),
          titleCard(index),
        ],
      ),
    );
  }

  Expanded topCard(int index) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Text(
            'No. ${widget.flutterIssues[index].number}',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(width: 15),
          Row(
            children: [
              const Icon(
                Icons.comment,
                size: 15,
              ),
              const SizedBox(width: 3),
              Text(
                widget.flutterIssues[index].commentCount.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Expanded titleCard(int index) {
    return Expanded(
      flex: 5,
      child: Row(
        children: [
          widget.flutterIssues[index].state == Constant.issueStateOpen
              ? const Icon(
                  Icons.info_outline,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.check_circle_outline,
                  color: Colors.purple,
                ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.flutterIssues[index].title,
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
    );
  }

  Expanded descriptionCard(int index) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        color: Colors.blue.withOpacity(0.2),
        child: Text(widget.flutterIssues[index].description ?? 'no description'),
      ),
    );
  }

  Expanded dateCard(String formattedCreatedAt, String formattedUpdatedAt) {
    return Expanded(
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
    );
  }
}
