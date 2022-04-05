import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/github_api.dart';
import 'package:flutter_issues_viewer/models/github_data.dart';
import 'package:intl/intl.dart';

class TabWidget extends StatelessWidget {
  List<GithubData>? flutterIssues;
  final String? label;

  TabWidget({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GithubApi().getGithubApi(state: 'all', label: label, sort: 'created', direction: 'desc'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            flutterIssues = snapshot.data;
            return RefreshIndicator(
              onRefresh: () async {
                flutterIssues = snapshot.data;
                print('refresh');
              },
              child: ListView.builder(
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
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
            'No. ${flutterIssues![index].number}',
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
                flutterIssues![index].commentCount.toString(),
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
    );
  }

  Expanded descriptionCard(int index) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        color: Colors.blue.withOpacity(0.2),
        child: Text(flutterIssues![index].description ?? 'no description'),
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
