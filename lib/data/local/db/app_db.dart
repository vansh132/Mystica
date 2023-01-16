import 'dart:io';
import 'package:drift/drift.dart';
import 'package:mytica/data/local/entity/album_entity.dart';
import 'package:mytica/data/local/entity/image_entity.dart';
import 'package:mytica/data/local/entity/journal_entity.dart';
import 'package:mytica/data/local/entity/todo_entity.dart';
import 'package:mytica/data/local/entity/user_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'mystica.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users, Journals, Albums, MyImages, Todos])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Users
  // get user by username
  Future<User> getUser(String username) async {
    return await (select(users)..where((tbl) => tbl.username.equals(username)))
        .getSingle();
  }

  // insertUser
  Future<int> insertUser(UsersCompanion entity) async {
    return await into(users).insert(entity);
  }

  // Journals
  // Get All Journals
  Future<List<Journal>> getJournals() async {
    return await select(journals).get();
  }

  // Create Journal
  Future<int> insertJournal(JournalsCompanion entity) async {
    return await into(journals).insert(entity);
  }

  // Get Journal By Id
  Future<Journal> getJournal(int id) async {
    return await (select(journals)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // Update Journal
  Future<bool> updateJournal(JournalsCompanion entity) async {
    return await update(journals).replace(entity);
  }

  // Albums
  // Get All Albums
  Future<List<Album>> getAlbums() async {
    return await select(albums).get();
  }

  // Create Album
  Future<int> insertAlbum(AlbumsCompanion entity) async {
    return await into(albums).insert(entity);
  }

  // Get Album By Id
  Future<Album> getAlbum(int id) async {
    return await (select(albums)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // Images
  // Get All Images
  Future<List<MyImage>> getImages() async {
    return await select(myImages).get();
  }

  // Create Image
  Future<int> insertImage(MyImagesCompanion entity) async {
    return await into(myImages).insert(entity);
  }

  // Get Image By Id
  Future<MyImage> getImage(int id) async {
    return await (select(myImages)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  //Todos
  // Get all Todos
  Future<List<Todo>> getTodos() async {
    return await select(todos).get();
  }

  // Create Todo
  Future<int> insertTodo(TodosCompanion entity) async {
    return await into(todos).insert(entity);
  }

  // Get Todo By Id
  Future<Todo> getTodo(int id) async {
    return await (select(todos)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  // Update Journal
  Future<bool> updateTodo(TodosCompanion entity) async {
    return await update(todos).replace(entity);
  }
}
