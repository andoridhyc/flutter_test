/// userId : 5
/// id : 41
/// title : "non est facere"
/// body : "molestias id nostrum excepturi molestiae dolore omnis repellendus quaerat saepe consectetur iste quaerat tenetur asperiores accusamus ex ut nam quidem est ducimus sunt debitis saepe"
/// likeNum : 1
/// shareNum : 2
/// commentsNum : 3
library;

class HomeModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  int? likeNum;
  int? shareNum;
  int? commentsNum;

  HomeModel(
      {this.userId,
        this.id,
        this.title,
        this.body,
        this.likeNum,
        this.shareNum,
        this.commentsNum});

  HomeModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    likeNum = json['likeNum'];
    shareNum = json['shareNum'];
    commentsNum = json['commentsNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['likeNum'] = likeNum;
    data['shareNum'] = shareNum;
    data['commentsNum'] = commentsNum;
    return data;
  }
}
