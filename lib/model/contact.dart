class ContactModel {
  String firstName;
  String lastName;
  String email;
  String phone;
  String company;
  String interest;
  String message;
  toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "company": company,
      "interest": interest,
      "message": message
    };
  }

  ContactModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.company,
      this.interest,
      this.message});
}
