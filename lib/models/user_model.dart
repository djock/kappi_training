class UserModel {
  final int id;
  final String name;
  final List<int> favouritePrograms;

  UserModel(this.id, this.name, this.favouritePrograms);

  UserModel.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        favouritePrograms = json['favouritePrograms'];
}