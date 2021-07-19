class UserModel{
  final String uid;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String phone;

  UserModel(this.uid, this.firstName, this.lastName, this.password, this.email,
      this.phone);
}

class FoodModel{
  final String name;
  final String icon;
  final String sugarContent;

  FoodModel(this.name, this.icon, this.sugarContent);
}

class HospitalModel{
  final String name;
  final String logo;
  final String address;
  final String email;
  final String phone;
  final String taxPercentage;
  final String serviceCharge;

  HospitalModel(this.name, this.logo, this.address, this.email, this.phone,
      this.taxPercentage, this.serviceCharge);
}

class DoctorModel extends UserModel{

  final String designation;
  final String type;
  final String chargePerChannel;

  DoctorModel(String uid, String firstName, String lastName, String password, String email, String phone, this.designation, this.type, this.chargePerChannel) : super(uid, firstName, lastName, password, email, phone);

}

class ArticleModel {
  final String name;
  final String image;
  final String url;

  ArticleModel(this.name, this.image, this.url);
}