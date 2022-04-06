class GithubData {
  final int? number;
  final int? commentCount;
  final String state;
  final String title;
  final String? description;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  GithubData.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        commentCount = json['comments'],
        state = json['state'],
        title = json['title'],
        description = json['body'],
        url = json['html_url'],
        createdAt = DateTime.parse(json['created_at']),
        updatedAt = DateTime.parse(json['updated_at']);
}
