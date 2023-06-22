import 'package:data/src/models/articles/articles_data_model.dart';
import 'package:remote/remote.dart';

extension ArticlesMapper on ArticleModel {
  ArticlesDataModel get articlesModel => ArticlesDataModel(
      id: id,
      url: url,
      title: title,
      source: source,
      publishedDate: publishedDate,
      summary: summary,
      image: media.isNotEmpty ? media.first.mediaMetaData.first.url : null);
}
