import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class LoadMoreCustom extends LoadMore {
  static DelegateBuilder<LoadMoreDelegate> buildDelegate =
      () => DefaultLoadMoreDelegate();
  static DelegateBuilder<LoadMoreTextBuilder> buildTextBuilder =
      () => DefaultLoadMoreTextBuilderCustom.custom;

  static String failText = "";
  static String idleText = "";
  static String loadingText = "";
  static String noMoreText = "";

  final Widget child;

  /// return true is refresh success
  ///
  /// return false or null is fail
  final FutureCallBack onLoadMore;

  /// if [isFinish] is true, then loadMoreWidget status is [LoadMoreStatus.nomore].
  final bool isFinish;

  /// see [LoadMoreDelegate]
  final LoadMoreDelegate delegate;

  /// see [LoadMoreTextBuilder]
  final LoadMoreTextBuilder textBuilder = DefaultLoadMoreTextBuilderCustom.custom;

  /// when [whenEmptyLoad] is true, and when listView children length is 0,or the itemCount is 0,not build loadMoreWidget
  final bool whenEmptyLoad;

  LoadMoreCustom({
    Key key,
    @required this.child,
    @required this.onLoadMore,
    this.isFinish = false,
    this.delegate,
    this.whenEmptyLoad = true,
    failText,
    idleText,
    loadingText,
    noMoreText
  // ignore: missing_required_param
  }) : super(key: key){
    LoadMoreCustom.failText = failText ?? 'Falhou ao carregar, tente novamente.';
    LoadMoreCustom.idleText = idleText ?? 'Carregando, aguarde..';
    LoadMoreCustom.loadingText = loadingText ?? 'Carregando, aguarde...';
    LoadMoreCustom.noMoreText = noMoreText ?? 'Sem mais itens.';
  }
}

String _buildCustomText(LoadMoreStatus status) {
  String text;
  switch (status) {
    case LoadMoreStatus.fail:
      text = LoadMoreCustom.failText;
      break;
    case LoadMoreStatus.idle:
      text = LoadMoreCustom.idleText;
      break;
    case LoadMoreStatus.loading:
      text = LoadMoreCustom.loadingText;
      break;
    case LoadMoreStatus.nomore:
      text = LoadMoreCustom.noMoreText;
      break;
    default:
      text = "";
  }
  return text;
}

class DefaultLoadMoreTextBuilderCustom extends DefaultLoadMoreTextBuilder {
  static const LoadMoreTextBuilder custom = _buildCustomText;
}