import '../../../domain/entities/random_user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/local/i_user_local_datasource.dart';
import '../datasources/remote/i_user_remote_datasource.dart';

class UserRepository implements IUserRepository {
  late IUserRemoteDataSource remoteDataSource;
  late IUserLocalDataSource localDataSource;

  UserRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<bool> getUser() async {
    // TODO
    // Aquí debemos obtener una instancia de RandomUser del remoteDataSource
    // y pasarla al localDataSource
    var user = await remoteDataSource.getUser();
    await localDataSource.addUser(user);
    return true;
  }

  @override
  Future<List<RandomUser>> getAllUsers() async {
    // TODO
    // Aquí debemos obtener una lista de RandomUser del localDataSource
    List<RandomUser> list = await localDataSource.getAllUsers();
    return Future.value(list);
  }

  @override
  Future<void> deleteUser(id) async {
    // TODO
    // Aquí debemos eliminar un usuario del localDataSource
    await localDataSource.deleteUser(id);
  }

  @override
  Future<void> deleteAll() async {
    // TODO
    // Aquí debemos eliminar todos los usuarios del localDataSource
    await localDataSource.deleteAll();
  }

  @override
  Future<void> updateUser(user) async {
    // TODO
    // Aquí debemos actualizar un usuario del localDataSource
    await localDataSource.updateUser(user);
  }
}
