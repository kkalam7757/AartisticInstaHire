class UserEmploper {
   String id;
   String fullName;
   String email;
   String userRole;
   String position;
   String company;
   String country;
   String state;
   String city;
   String companyProfile;
   String phone;
   String otherCountry;
  UserEmploper({this.position, this.company, this.country, this.state, this.city, this.companyProfile,this.id, this.fullName, this.email, this.userRole,this.phone,this.otherCountry});

  UserEmploper.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'],
        position = data['position'],
        company = data['company'],
        country = data['country'],
        state = data['state'],
        city = data['city'],
        companyProfile = data['companyProfile'],
        phone = data['phone'],
        otherCountry = data['otherCountry'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
      'position': position,
      'company': company,
      'country': country,
      'state': state,
      'city': city,
      'companyProfile': companyProfile, 
      'phone':phone,
      'otherCountry' : otherCountry
    };
  }
}