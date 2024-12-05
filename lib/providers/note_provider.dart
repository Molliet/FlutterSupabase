import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/note_service.dart';

class NoteProvider with ChangeNotifier {
  final NoteService _noteService = NoteService();
  List<Note> _notes = [];
  bool _isLoading = false;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  Future<void> fetchNotes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _notes = await _noteService.fetchNotes();
    } catch (e) {
      print('Erro ao carregar notas: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(String title, String description) async {
    try {
      await _noteService.addNote(title, description);
      await fetchNotes();
    } catch (e) {
      print('Erro ao adicionar nota: $e');
    }
  }

  Future<void> updateNote(String id, String title, String description) async {
    try {
      await _noteService.updateNote(id, title, description);
      await fetchNotes();
    } catch (e) {
      print('Erro ao atualizar nota: $e');
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await _noteService.deleteNote(id);
      await fetchNotes();
    } catch (e) {
      print('Erro ao excluir nota: $e');
    }
  }
}
