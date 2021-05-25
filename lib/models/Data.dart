/*"_id": "5b87b2422b59c1563d3ef442",
"userEmail": "gorav.grover88@gmail.com",
"userPassword": "U29mdEAxMjM=",
"signupType": 0,
"is_verified": 1,
"is_blocked": 0,
"is_deleted": 0,
"paid": 1,
"device_type": null,
"userDeviceToken": "sssss",
"expiry_date": "2024-11-26",
"updated_at": "2020-11-26 15:20:08",
"created_at": "2018-12-06 01:45:33",
"access_token": "rn6oerg7cu8woc808kgocsgc4kg4co0",
"name": "user123",
"companyAddress": "123 chandigarh",
"PhoneNumber": "752424",
"companyName": "abc ltd",
"faxNumber": "4236954",
"city": "chandigarh",
"state": "punjab",
"zip": "152104",
"dotNo": "123546",
"MCNo": "12564",
"trailerNo": "susuis",
"truckNumber": "shshjj",
"buisinessType": "Sole Proprietorship",
"mailingAddress": "fufj",
"initials": "gaguwia",
"title": "hahais",
"bankName": "",
"bankCity": "",
"bankState": "",
"BankABANo": "",
"accountNo": "",
"cellNumber": "752424",
"CarrierNumber": "",
"TaxIdNo": "sysy",
"insuranceNo": "999999999",
"companyEmail": "sanjana@softuvo.com",
"location": "Chandigarh, India",
"MCNoImage": "",
"taxIdImage": "",
"insuranceImage": "",
"SignatureImage": "1583140908.696776.jpg",
"companyLogo": "",
"mcno_image_name": "",
"tax_mage_name": "",
"insurance_image_name": "",
"signature_mage_name": "",
"company_logo_name": "",
"invoiceNumber": "11123",
"pass_token": "0mJ33JCb23",
"yearly": "1"*/

class Data {
  String id;
  String userEmail;
  String userPassword;
  int signupType;
  int is_verified;
  int is_blocked;
  int is_deleted;
  int paid;
  bool is_feedback;
  String userDeviceToken;
  String expiry_date;
  String access_token;
  String pass_token;
  String name;
  String companyAddress;
  String PhoneNumber;
  String companyName;
  String faxNumber;
  String city;
  String state;
  String zip;
  String dotNo;
  String MCNo;
  String trailerNo;
  String truckNumber;
  String buisinessType;
  String mailingAddress;
  String initials;
  String title;
  String bankName;
  String bankCity;
  String bankState;
  String BankABANo;
  String accountNo;
  String cellNumber;
  String CarrierNumber;
  String TaxIdNo;
  String insuranceNo;
  String companyEmail;
  String location;
  String MCNoImage;
  String taxIdImage;
  String insuranceImage;
  String SignatureImage;
  String companyLogo;
  String mcno_image_name;
  String tax_mage_name;
  String insurance_image_name;
  String signature_mage_name;
  String company_logo_name;
  String invoiceNumber;
  String yearly;


  Data(
      {this.id,
      this.userEmail,
      this.userPassword,
      this.signupType,
      this.is_verified,
      this.is_blocked,
      this.is_deleted,
      this.paid,
      this.userDeviceToken,
      this.expiry_date,
      this.access_token,
      this.pass_token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
    signupType = json['signupType'];
    is_verified = json['is_verified'];
    is_blocked = json['is_blocked'];
    is_deleted = json['is_deleted'];
    is_feedback = json['is_feedback'];
    paid = json['paid'];
    userDeviceToken = json['userDeviceToken'];
    expiry_date = json['expiry_date'];
    access_token = json['access_token'];
    pass_token = json['pass_token'];
    name = json['name'];
    companyAddress = json['companyAddress'];
    PhoneNumber = json['PhoneNumber'];
    companyName = json['companyName'];
    faxNumber = json['faxNumber'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    dotNo = json['dotNo'];
    MCNo = json['MCNo'];
    trailerNo = json['trailerNo'];
    truckNumber = json['truckNumber'];
    buisinessType = json['buisinessType'];
    mailingAddress = json['mailingAddress'];
    initials = json['initials'];
    title = json['title'];
    bankName = json['bankName'];
    bankCity = json['bankCity'];
    bankState = json['bankState'];
    BankABANo = json['BankABANo'];
    accountNo = json['accountNo'];
    cellNumber = json['cellNumber'];
    CarrierNumber = json['CarrierNumber'];
    TaxIdNo = json['TaxIdNo'];
    insuranceNo = json['insuranceNo'];
    companyEmail = json['companyEmail'];
    location = json['location'];
    MCNoImage = json['MCNoImage'];
    taxIdImage = json['taxIdImage'];
    insuranceImage = json['insuranceImage'];
    SignatureImage = json['SignatureImage'];
    companyLogo = json['companyLogo'];
    mcno_image_name = json['mcno_image_name'];
    tax_mage_name = json['tax_mage_name'];
    insurance_image_name = json['insurance_image_name'];
    signature_mage_name = json['signature_mage_name'];
    company_logo_name = json['company_logo_name'];
    invoiceNumber = json['invoiceNumber'];
    yearly = json['yearly'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['userEmail'] = this.userEmail;
    data['userPassword'] = this.userPassword;
    data['signupType'] = this.signupType;
    data['is_verified'] = this.is_verified;
    data['is_blocked'] = this.is_blocked;
    data['is_deleted'] = this.is_deleted;
    data['is_feedback'] = this.is_feedback;
    data['paid'] = this.paid;
    data['userDeviceToken'] = this.userDeviceToken;
    data['expiry_date'] = this.expiry_date;
    data['access_token'] = this.access_token;
    data['name'] = this.name;
    data['companyAddress'] = this.companyAddress;
    data['PhoneNumber'] = this.PhoneNumber;
    data['companyName'] = this.companyName;
    data['faxNumber'] = this.faxNumber;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['dotNo'] = this.dotNo;
    data['MCNo'] = this.MCNo;
    data['trailerNo'] = this.trailerNo;
    data['truckNumber'] = this.truckNumber;
    data['buisinessType'] = this.buisinessType;
    data['mailingAddress'] = this.mailingAddress;
    data['initials'] = this.initials;
    data['title'] = this.title;
    data['bankName'] = this.bankName;
    data['bankCity'] = this.bankCity;
    data['bankState'] = this.bankState;
    data['BankABANo'] = this.BankABANo;
    data['cellNumber'] = this.cellNumber;
    data['CarrierNumber'] = this.CarrierNumber;
    data['accountNo'] = this.accountNo;
    data['TaxIdNo'] = this.TaxIdNo;
    data['insuranceNo'] = this.insuranceNo;
    data['companyEmail'] = this.companyEmail;
    data['location'] = this.location;
    data['MCNoImage'] = this.MCNoImage;
    data['taxIdImage'] = this.taxIdImage;
    data['insuranceImage'] = this.insuranceImage;
    data['SignatureImage'] = this.SignatureImage;
    data['companyLogo'] = this.companyLogo;
    data['mcno_image_name'] = this.mcno_image_name;
    data['tax_mage_name'] = this.tax_mage_name;
    data['insurance_image_name'] = this.insurance_image_name;
    data['signature_mage_name'] = this.signature_mage_name;
    data['company_logo_name'] = this.company_logo_name;
    data['invoiceNumber'] = this.invoiceNumber;
    data['yearly'] = this.yearly;


    return data;
  }
}
