class MealDescription {
  String? ingredients;
  String? quantity;
  String? preparationMode;

  MealDescription({this.ingredients, this.quantity, this.preparationMode});

  MealDescription.fromJson(Map<String, dynamic> json) {
    ingredients = json['ingredients'];
    quantity = json['quantity'];
    preparationMode = json['preparationMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredients'] = this.ingredients;
    data['quantity'] = this.quantity;
    data['preparationMode'] = this.preparationMode;
    return data;
  }
}
