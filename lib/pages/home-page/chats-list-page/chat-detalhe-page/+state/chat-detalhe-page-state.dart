import 'package:flutter/material.dart';
import 'package:kinship_mobile/graphql/subscription.dart';
import 'package:meta/meta.dart';
import 'package:soma_graphql_flutter/subscription.dart';

@immutable
class ChatDetalhePageState{

  final bool isLoading;
  final int totalMensagens;
  final List<dynamic> mensagens;
  final Subscription subscription;

  ChatDetalhePageState({
    @required this.isLoading,
    @required this.totalMensagens,
    @required this.mensagens,
    @required this.subscription,
  });

  factory ChatDetalhePageState.initial(){
    return new ChatDetalhePageState(
      isLoading: true,
      totalMensagens: 0,
      mensagens: null,
      subscription: getSubscription(),
    );
  }

  ChatDetalhePageState copyWith({
    isLoading,
    totalMensagens,
    mensagens,
    subscription
  }) {
    return new ChatDetalhePageState(
      isLoading: isLoading ?? this.isLoading,
      totalMensagens: totalMensagens ?? this.totalMensagens,
      mensagens: mensagens ?? this.mensagens,
      subscription: subscription ?? this.subscription,
    );
  }
}