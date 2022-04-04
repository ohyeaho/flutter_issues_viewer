import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/models/api/github_api.dart';
import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'issues_state.freezed.dart';

@freezed
abstract class IssuesState with _$IssuesState {
  const factory IssuesState({
    @Default(false) bool init,
    @Default(false) bool isLoading,
    List<GithubData>? issuesDataList,
    @Default(0) int lastPage,
  }) = _IssuesState;
}

class IssuesStateNotifier extends StateNotifier<IssuesState> with LocatorMixin {
  IssuesStateNotifier(GithubApi api)
      : _api = api,
        super(const IssuesState());

  final GithubApi _api;

  static const _errorMessage = 'エラーが発生しました。';
  final scrollController = ScrollController();

  @override
  Future<void> initState() async {
    try {
      // スクロールが最下部まで達したらロード開始
      scrollController.addListener(() async {
        await _scrollListener();
      });

      await getList();
    } on Exception catch (e) {
      print(e);
      // await showErrorToast(e);
      // logger.d(e.toString());
    } finally {
      // TabBarを飛ばして表示した時、すぐにdisposeされてしまいエラーが出力されるため、
      // mountされているかどうかをチェック
      if (!mounted) return;
      state = state.copyWith(init: true);
    }
  }

  Future<void> getList() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);

    try {
      final issuesDataList = await getGithubApi();

      if (!mounted) return;

      final newList = <GithubData>[];
      if (state.issuesDataList != null && state.issuesDataList!.isNotEmpty) {
        newList.addAll(state.issuesDataList!);
      }

      newList.addAll(issuesDataList!);

      state = state.copyWith(issuesDataList: newList, lastPage: state.lastPage + 1, isLoading: false);
    } on Exception catch (e) {
      print(e);
      // await showErrorToast(e);
      // logger.d(e.toString());
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> refreshAndFetch() async {
    final beforeLastPage = state.lastPage;
    state = state.copyWith(lastPage: 0);
    try {
      final issuesDataList = await getGithubApi();

      if (!mounted) return;

      final newList = <GithubData>[];
      newList.addAll(issuesDataList!);

      state = state.copyWith(issuesDataList: newList, lastPage: 1);
    } on Exception catch (e) {
      print(e);
      // await showErrorToast(e);
      // logger.d(e.toString());
      state = state.copyWith(lastPage: beforeLastPage);
    }
  }

  // Future<List<GithubData>> _fetch() async {
  //   final result = await _api.fetch(lastPage: state.lastPage);
  //   return result;
  // }
  Future<List<GithubData>?> getGithubApi() async {
    final result = await _api.fetch(lastPage: state.lastPage);
    return result;
  }

  // Future<void> showErrorToast(Exception e) async {
  //   await Fluttertoast.showToast(
  //       msg: '$_errorMessage\n${e.toString()}', timeInSecForIosWeb: 3);
  // }

  Future<void> _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      await getList();
    }
  }
}

// class IssuesNotifier extends StateNotifier<IssuesState> {
//   IssuesNotifier(this.api) : super(const IssuesState(issuesDataList: [])) {
//     GithubApi().getGithubApi();
//   }
//
//   GithubApi api;

//     Future<List<GithubData>?> getGithubApi() async {
//     final result = await api.getGithubApi(lastPage: state.lastPage);
//     return result;
//   }
// }
