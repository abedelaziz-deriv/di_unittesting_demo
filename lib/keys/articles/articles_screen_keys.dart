import 'package:flutter/material.dart';

const Key articlesScreenKey = Key('articlesScreen_key');
const Key articlesScreenLoadingKey = Key('articlesScreen_loadingKey');
const Key articlesScreenEmptyViewKey = Key('articlesScreen_emptyViewKey');
const Key articlesScreenListKey = Key('articlesScreen_listKey');
const Key articlesScreenImagePlaceholderKey =
    Key('articlesScreen_imagePlaceholderKey');

Key articlesScreenOpenBrowserKey(int index) =>
    Key('${index}_articlesScreen_openBrowserKey');
