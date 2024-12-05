import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/note.dart';

class NoteService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Note>> fetchNotes() async {
    try {
      final data = await _client
          .from('notes')
          .select()
          .order('created_at', ascending: false) as List;

      return data.map((e) => Note.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar notas: $e');
    }
  }

  Future<void> addNote(String title, String description) async {
    try {
      await _client.from('notes').insert({
        'title': title,
        'description': description,
      });
    } catch (e) {
      throw Exception('Erro ao adicionar nota: $e');
    }
  }

  Future<void> updateNote(String id, String title, String description) async {
    try {
      await _client.from('notes').update({
        'title': title,
        'description': description,
      }).eq('id', id);
    } catch (e) {
      throw Exception('Erro ao atualizar nota: $e');
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await _client.from('notes').delete().eq('id', id);
    } catch (e) {
      throw Exception('Erro ao excluir nota: $e');
    }
  }
}
