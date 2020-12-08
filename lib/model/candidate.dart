class CandidateModel {
  String firstName;
  String lastName;
  String email;
  String phone;
  String position;
  String employer;
  String address;
  String country;
  toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "position": position,
      "address": address,
      "employer": employer,
      "country": country
    };
  }
}
