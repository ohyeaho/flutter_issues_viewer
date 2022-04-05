import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/main.dart';
import 'package:flutter_issues_viewer/models/api/github_api.dart';
import 'package:flutter_issues_viewer/models/data/github_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'issues_state.freezed.dart';

@freezed
abstract class IssuesState with _$IssuesState {
  const factory IssuesState({
    @Default(false) bool init,
    @Default(false) bool isLoading,
    List<GithubData>? issuesDataList,
    @Default(false) bool filterSince,
    @Default('all') String filterState,
    @Default('desc') String sortDirection,
    @Default(0) int lastPage,
    @Default('created') String sort,
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
      await showErrorToast(e);
      logger.d(e.toString());
    }
    // TabBarを飛ばして表示した時、すぐにdisposeされてしまいエラーが出力されるため、
    // mountされているかどうかをチェック
    if (!mounted) return;
    state = state.copyWith(init: true);
  }

  // Future<void> filerAndSort() async {
  //   if (state.isLoading) return;
  //   state = state.copyWith(isLoading: true);
  //   final beforeLastPage = state.lastPage;
  //   state = state.copyWith(lastPage: 0);
  //   try {
  //     final issuesDataList = await getGithubApi();
  //
  //     if (!mounted) return;
  //
  //     final newList = <GithubData>[];
  //     newList.addAll(issuesDataList!);
  //
  //     state = state.copyWith(issuesDataList: newList, lastPage: 1, issueState: 'closed');
  //   } on Exception catch (e) {
  //     await showErrorToast(e);
  //     logger.d(e.toString());
  //     state = state.copyWith(lastPage: beforeLastPage);
  //   }
  // }

  Future<void> filterSince() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    final beforeLastPage = state.lastPage;
    state = state.copyWith(lastPage: 0);
    try {
      final issuesDataList = await getGithubApi();

      if (!mounted) return;

      final newList = <GithubData>[];
      newList.addAll(issuesDataList);

      state = state.copyWith(issuesDataList: newList, lastPage: 1, filterSince: true);
    } on Exception catch (e) {
      await showErrorToast(e);
      logger.d(e.toString());
      state = state.copyWith(lastPage: beforeLastPage);
    }
  }

  Future<void> filterState() async {
    state = state.copyWith(isLoading: true);
    final beforeLastPage = state.lastPage;
    state = state.copyWith(lastPage: 0);
    try {
      final issuesDataList = await getFilterState();

      if (!mounted) return;

      final newList = <GithubData>[];
      newList.addAll(issuesDataList);

      state = state.copyWith(issuesDataList: newList, lastPage: 1, isLoading: false);
    } on Exception catch (e) {
      await showErrorToast(e);
      logger.d(e.toString());
      state = state.copyWith(lastPage: beforeLastPage);
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

      newList.addAll(issuesDataList);

      state = state.copyWith(issuesDataList: newList, lastPage: state.lastPage + 1, isLoading: false);
    } on Exception catch (e) {
      await showErrorToast(e);
      logger.d(e.toString());
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
      newList.addAll(issuesDataList);

      state = state.copyWith(issuesDataList: newList, lastPage: 1);
    } on Exception catch (e) {
      await showErrorToast(e);
      logger.d(e.toString());
      state = state.copyWith(lastPage: beforeLastPage);
    }
  }

  Future<List<GithubData>> getGithubApi() async {
    final result = await _api.fetch(
      since: state.filterSince,
      state: state.filterState,
      sort: state.sort,
      direction: state.sortDirection,
      lastPage: state.lastPage,
    );
    return result;
  }

  Future<List<GithubData>> getFilterState() async {
    final result = await _api.fetch(
      since: state.filterSince,
      state: 'open',
      sort: state.sort,
      direction: state.sortDirection,
      lastPage: state.lastPage,
    );
    return result;
  }

  Future<void> showErrorToast(Exception e) async {
    await Fluttertoast.showToast(msg: '$_errorMessage\n${e.toString()}', timeInSecForIosWeb: 3);
  }

  Future<void> _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      await getList();
    }
  }

  void checkBox() {
    state = state.copyWith(filterSince: !state.filterSince);
  }
}
