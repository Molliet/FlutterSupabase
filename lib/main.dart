import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'providers/note_provider.dart';
import 'screens/note_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configuração do Supabase
  await Supabase.initialize(
    url: 'https://oqyfpagxobhorjmzpnrv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9xeWZwYWd4b2Job3JqbXpwbnJ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxODIxODMsImV4cCI6MjA0ODc1ODE4M30.8LNjBRwGjKe6PJ63it2MKEWtzrabPN4sAX7UjGxY8wk',
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerenciador de Notas',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: NoteListScreen(),
      ),
    );
  }
}
