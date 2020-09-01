class UserModel {
  final int id;
  final String name;
  final List<int> favouritePrograms;

  UserModel(this.id, this.name, this.favouritePrograms);

  UserModel.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        favouritePrograms = _buildFavourites(json['favouritePrograms']);

  static List<int> _buildFavourites(node)
  {
    List<int> result = new List<int>();
    for(var item in node) {
      result.add(item);
    }

    return result;
  }
}