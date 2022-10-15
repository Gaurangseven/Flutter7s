import 'package:flutter/cupertino.dart';

class Flutterdevelopers {
  @required
  String? name;
  String? title;
  String? twitterlink;
  String? instalink;
  String? githublink;
  String? userimagename;

  Flutterdevelopers(
      {@required this.name,
      @required this.title,
      this.githublink,
      this.instalink,
      this.twitterlink,
      @required this.userimagename});
}
