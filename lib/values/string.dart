abstract class _String {
  String get labelAll;
  String get labelWebView;
  String get labelSharedPreferences;
  String get labelWaitingCustomer;
  String get labelSevere;
  String get labelShare;
}

class S implements _String {
  @override
  String get labelAll => '全て';

  @override
  String get labelWebView => 'p: web view';

  @override
  String get labelSharedPreferences => 'p: shared_preferences';

  @override
  String get labelWaitingCustomer => 'waiting for customer response';

  @override
  String get labelSevere => 'severe: new feature';

  @override
  String get labelShare => 'p: share';
}
