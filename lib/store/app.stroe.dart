import 'package:flutter_riverpod/flutter_riverpod.dart';

/// app状态
final appState = StateNotifierProvider<AppStateNotifier,AppState>((ref) => AppStateNotifier());


class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState(count: 0));

  addCount(int value) {
    state = state.copyWith(count: state.count + value);
  }
}

class AppState {
  AppState({required this.count});
  int count;
  AppState copyWith({int? count}) {
    return AppState(count: count ?? this.count);
  }
}