import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../datasource/character_datasource.dart';

import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterDatasource repository;

  CharacterBloc({required this.repository}) : super(CharacterInitial()) {
    on<FetchCharacters>(_onFetchCharacters);
  }

  Future<void> _onFetchCharacters(
    FetchCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading());
    try {
      final characters = await repository.fetchCharacters();
      emit(CharacterLoaded(characters));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }
}