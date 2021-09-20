import 'package:flutter/material.dart';
import 'package:tgf_style_guide_v2/pages/loginPage.dart';
import 'package:tgf_style_guide_v2/pages/otp.dart';
import 'package:tgf_style_guide_v2/pages/tnc.dart';
import 'dart:async';

// ignore: must_be_immutable
class FormPage extends StatefulWidget {
  FormPage({
    Key? key,
    // ignore: avoid_init_to_null
    this.firsTName: null,
    // ignore: avoid_init_to_null
    this.middleName: null,
    // ignore: avoid_init_to_null
    this.lastName: null,
    // ignore: avoid_init_to_null
    this.maValtejsthan: null,
    // ignore: avoid_init_to_null
    this.mobileNumber: null,
    // ignore: avoid_init_to_null
    this.emailAddress: null,
    // ignore: avoid_init_to_null
    this.shiVir: null,
    // ignore: avoid_init_to_null
    this.tejSthan: null,
    // ignore: avoid_init_to_null
    this.ciTy: null,
  }) : super(key: key);

  var firsTName,
      middleName,
      lastName,
      maValtejsthan,
      mobileNumber,
      emailAddress,
      shiVir,
      tejSthan,
      ciTy;

  @override
  _FormPageState createState() => _FormPageState(
        this.firsTName,
        this.middleName,
        this.lastName,
        this.maValtejsthan,
        this.mobileNumber,
        this.emailAddress,
        this.shiVir,
        this.tejSthan,
        this.ciTy,
      );
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  //TextFormField controllers
  final fName = TextEditingController();
  final mName = TextEditingController();
  final lName = TextEditingController();
  final mobNo = TextEditingController();
  final emailId = TextEditingController();
  final cityName = TextEditingController();
  final countryName = TextEditingController()..text = 'India';

  //data variables
  var _shivir = [
    'Maha Aasmani Shivir',
    'Online MA (Maha Aasmani)',
    'Moun Tejsadhana Shivir (SSP1)',
    'Sadhana Shivir (SSP2)',
    'Higher Shivir'
  ];
  var _tejsthan = [
    "Ahmednagar",
    "Kedgaon",
    "Ahmednagar",
    "Bhingar",
    "Khatgaon Takli",
    "Kopargaon",
    "Bhramangaon",
    "Andarsul",
    "Rahuri",
    "Shrirampur",
    "Sangamner",
    "Kolhar",
    "Nimgaon Jali",
    "Karjat",
    "Kada",
    "Ashti",
    "Shirur",
    "Nevasa",
    "Shevgaon",
    "Pathardi",
    "Dhorjalgaon",
    "Bhoom",
    "Satara",
    "Satara Road",
    "Karandwadi",
    "Kashil",
    "Phaltan",
    "Lonand",
    "Natepute",
    "Malshiraj",
    "Rajuri",
    "Shirval",
    "Karad",
    "Kale",
    "Vadgaon",
    "Umbraj",
    "Dhebewadi",
    "Undale",
    "Kadegaon",
    "Wai",
    "Surur",
    "Mahabaleshwar",
    "Kenjal",
    "Bhuinj",
    "Balli Cuncoli",
    "Mhapasa",
    "Pedne",
    "Phonda",
    "Vasco",
    "Sankhali",
    "Madgaon",
    "Panaji",
    "Adajan",
    "Ghod Dod Road",
    "Mota Varacha",
    "Sarthana",
    "Sachin",
    "Udhana",
    "Happy Shoppe",
    "Navsari",
    "Bhuj",
    "Vapi",
    "Silvasa",
    "Bhavnagar",
    "Visnagar",
    "Halol",
    "Bharuch",
    "Nikol",
    "Paldi",
    "Vastral",
    "Gorva",
    "Ring Road",
    "Ambejogai",
    "Vivekanandnagar",
    "Beed",
    "Dombri",
    "Latur",
    "Latur - Sitaram Nagar",
    "Latur - Ajinkya City",
    "Ausa",
    "Ahmedpur",
    "Udgir",
    "Handarguli",
    "Devani",
    "Ratnagiri",
    "Oras",
    "Chiplun",
    "Dapoli",
    "Khed",
    "Matvan",
    "Kumbhave",
    "Bajaj Nagar",
    "Shivaji Nagar",
    "Hudco",
    "Ram Nagar",
    "Selu",
    "Partur",
    "Jalana",
    "Mantha",
    "Aheri",
    "Allapalli",
    "Etapalli",
    "Datala Road",
    "Lalpeth",
    "Tukum",
    "Ekori Ward, Chandrapur",
    "Bhadrawati",
    "Bhadrawati -Gawarala",
    "Rajura",
    "Gondpipri",
    "Gadchiroli, Navegaon Complex",
    "Gadchiroli, Sneha Nagar",
    "Gadchiroli, Kannamwar nagar",
    "Brahmapuri",
    "Warora",
    "Chimur",
    "Wani-Jatra Road",
    "Wani-Nandepera Road",
    "Pandharkawda",
    "Patala",
    "Neri",
    "Ajara",
    "Gadhingalaj",
    "Bidri",
    "Gargoti",
    "Pangire",
    "Ichalkaranji",
    "Dwarakadish(Ich)",
    "Abdul Lath",
    "Pethvadgaon",
    "Narande",
    "Rukadi",
    "Kolhapur",
    "Saneguruji Vasahat",
    "Kolhapur -Fulewadi",
    "Uchgaon",
    "Kagal",
    "Chinchwad",
    "Mulund",
    "Dombovli",
    "Matunga",
    "Ghodbandar",
    "Thane",
    "Chinchpokali",
    "Kalyan",
    "Ulhasnagar",
    "Badlapur",
    "Thane Vashant Vihar",
    "Girgaon",
    "Khar",
    "Borivali",
    "Kandivali",
    "Boisar",
    "Andheri",
    "Malad",
    "Mira Road",
    "Palghar",
    "Nalasopara",
    "Lokhandwala",
    "Amravati",
    "Kurum",
    "Khed",
    "Morshi",
    "Nagpur, Adhyapak Vidyalay",
    "Nagpur, Smruti Nagar",
    "Nagpur, Ravinagar",
    "Wadi",
    "Wadi, Kohale Layout",
    "Ramna Maruti",
    "Godhani",
    "Jaytala",
    "Hingana",
    "Sonegaon",
    "Kiranapur",
    "Binaki",
    "Bhivapur",
    "Kalmeshwar",
    "Nagpur,Gopalnagar",
    "Aasgav",
    "Bhandara",
    "Amravati,Devdatt nagar",
    "Wardha",
    "Hinganghat",
    "Hinganghat (Chaudhari Ward)",
    "Hingani",
    "Yavatmal",
    "Darwha",
    "Dhamangaon",
    "Talegaon (Dashasar)",
    "Borgaon Meghe",
    "Gajanan Nagar, Wardha",
    "Mhasala",
    "Sainagar, Wadha",
    "Baramati",
    "Uruli Kanchan",
    "Indapur",
    "Kedgaon Chaufula",
    "Daund",
    "Talegaon",
    "Lonavala",
    "Saswad",
    "Neera",
    "Pisurti",
    "Gulunche",
    "Korhale",
    "Jejuri",
    "Dighi",
    "Bhosari MIDC",
    "Koyananagar",
    "Thergaon",
    "Chinchwad",
    "Sangavi (Sambhavna)",
    "Bhosari (Vishwavas)",
    "Nigdi (Nimit)",
    "Pimpri (Tejam)",
    "Chakan",
    "Dehu Road",
    "Khanapur",
    "Katraj",
    "Market Yard",
    "Kirkatwadi",
    "Karvenagar (Krupasthan)",
    "Ambegaon Datta Nagar",
    "DSK Vishwa",
    "Dhankwadi",
    "Dhayri",
    "Warje",
    "Lakshmi Road (Upasna)",
    "Aundh (Mouka)",
    "Gokhale Nagar",
    "Kothrud",
    "Bhugaon",
    "Loni",
    "Chandannagar",
    "Vishrantwadi (Sangam)",
    "Yerwada (Rakshasthan)",
    "Hadapsar",
    "Vadgaon Sheri",
    "Keshavnagar",
    "Ghorpadi",
    "Rajgurunagar",
    "Narayangaon",
    "Bhor",
    "Panvel",
    "Vashi",
    "Kalamboli",
    "CBD Belapur",
    "Nerul",
    "Mankhurd",
    "Alibag",
    "Pen",
    "Uran",
    "Mhasala",
    "Barshi",
    "Osmanabad",
    "Tembhurni",
    "Kurduwadi",
    "Karmala",
    "Akluj",
    "Karkambh",
    "Pandharpur",
    "Visawa",
    "Amrutanubhav",
    "Khardi",
    "Kasegoan",
    "Bhandishegoan",
    "Bhalvani",
    "Sonke",
    "Sangola",
    "Laxmi Dahivadi",
    "Aatpadi",
    "Shetphale",
    "Dighanchi",
    "Solapur - Saat Rasta",
    "Solapur - Akkalkot Road",
    "Robotex Park",
    "Hotgi Road",
    "Lashkar",
    "Akkalkot",
    "Mohol",
    "Bale",
    "Nannaj",
    "Jalkot",
    "Basavkalyan",
    "Omerga",
    "Hyderabad - Miyapur",
    "Hyderabad - Sanathnagar",
    "Shah Ali Banda",
    "Vijayawada",
    "Raipur",
    "Mandir Hasod",
    "Mahasamund",
    "Bhilai",
    "Bilaspur",
    "Dhamtari",
    "Banglore",
    "Banglore Marathhalli",
    "Bangalore Electronic city",
    "Belgaum CAMP",
    "Belgaum Shahapur",
    "Dharwad- Dwarwatika layout",
    "Dharwad- Laxminagar",
    "Dharwad- Kalyannagar",
    "Hubli",
    "Haliyal",
    "Bidar",
    "Raichur",
    "Gulbarga",
    "Bhopal- Minal",
    "Bhopal- Kolar",
    "Bhopal Idgah hills",
    "Bhopal Malviynagar",
    "Vidisha",
    "Indore",
    "Ujjain",
    "Ratlam",
    "Itarasi",
    "Harda",
    "Hoshangabad",
    "Bankhedi",
    "Itarasi-Pathroda",
    "Mandla",
    "Betul",
    "Satna",
    "Chindwara",
    "Gwalior",
    "Bhind",
    "Nanded- Kotha",
    "CIDCO Colony",
    "Mahavir Society",
    "Bhaswar Chowk",
    "Dharmadad",
    "Sonpeth",
    "Parbhani",
    "Bori",
    "Jintur",
    "Shembal Pimpri",
    "Palshi",
    "Pusad",
    "Madhubani",
    "Gaya",
    "Patna",
    "Bettiah",
    "Muzaffarpur",
    "Rewari",
    "Jammu",
    "Ranchi",
    "Kathara",
    "Dhanbad",
    "Bokaro ",
    "Tatanagar",
    "Jowai",
    "Bhubaneswar",
    "Balasore",
    "Jharsughuda",
    "Rajgangpur",
    "Kendujhar",
    "Borawar",
    "Jaipur",
    "Jodhpur",
    "Chennai",
    "Lucknow Janakipuram",
    "Gorakhpur",
    "KANPUR",
    "Kolkatta",
    "Kolkatta-Salt lake",
    "Gidhani",
    "Suri",
    "Monigram",
    "Dayarampur",
  ];
  var _currentValueShivir;
  var _currentValueTejsthan;

  //Condition Variables
  var _ma;
  bool _acceptCheckbox = false;

  //Value variables
  var _shivirValue;
  var _tejsthanValue;
  var _maValue;
  var otpsender;

  //collection variable
  var responseCollector;
  var mobileNo;
  var firstName;
  var middleName;
  var lastName;
  var emailID;
  String disabledmessage = '';

  bool _enabled = false;
  bool agree = false;
  bool conditionvar = false;

  _FormPageState(firsTName, middleName, lastName, maValtejsthan, mobileNumber,
      emailAddress, shiVir, tejSthan, ciTy) {
    if (firsTName != null) {
      fName.text = firsTName;
    }
    if (middleName != null) {
      mName.text = middleName;
    }
    if (lastName != null) {
      lName.text = lastName;
    }
    if (maValtejsthan == "Male") {
      _ma = 1;
    } else if (maValtejsthan == "Female") {
      _ma = 2;
    } else {
      _ma = 0;
    }
    if (mobileNumber != null) {
      mobNo.text = mobileNumber;
    }
    if (emailAddress != null) {
      emailId.text = emailAddress;
    }
    if (ciTy != null) {
      cityName.text = ciTy;
    }
    _acceptCheckbox = false;
  }
  // Submit Function for pushing data to another page
  void submit(BuildContext context, attendance, maValtejsthan, shivirValue,
      tejsthanValue) async {
    //validatinng the form
    if (_formKey.currentState!.validate()) {
      if (shivirValue == 'Online MA (Maha Aasmani)' ||
          (shivirValue != 'Online MA (Maha Aasmani)' &&
              _tejsthanValue != null)) {
        setState(
          () {
            conditionvar = true;
          },
        );

        await Future.delayed(Duration(milliseconds: 800));
        if (_acceptCheckbox == true) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => otpPage(
                firstName: fName.text,
                middleName: mName.text,
                lastName: lName.text,
                whatsAppNo: mobNo.text,
                emailId: emailId.text,
                cityName: cityName.text,
                country: countryName.text,
                tejsthan: _tejsthanValue,
                khojiShivir: _shivirValue,
                maCompleted: _maValue == "Yes" ? true : false,
                emailAuth: otpsender,
              ),
            ),
          );
          setState(
            () {
              conditionvar = false;
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: NetworkImage(
                                'https://alexwebdevelop.com/wp-content/uploads/2019/08/php-login-and-authentication-the-definitive-guide.png'),
                            width: 300,
                            height: 150,
                          ),
                        ),
                        Text(
                          "Register Now",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Welcome!",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // firstname field
                        TextFormField(
                          autofocus: true,
                          controller: fName,
                          decoration: InputDecoration(
                            labelText: "First Name *",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          // first name validation
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your First Name *";
                            } else if (value.length < 2) {
                              return "First Name must be atleast of 2 characters *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: mName,
                          decoration: InputDecoration(
                            labelText: "Middle Name",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: lName,
                          decoration: InputDecoration(
                            labelText: "Last Name *",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Last Name *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Email id field
                        TextFormField(
                          controller: emailId,
                          decoration: InputDecoration(
                            labelText: "Email Id *",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          //email id validation
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email Id *";
                            } else if (!(value.contains(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")))) {
                              return "Please enter valid Email address";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //Mobile number field
                        TextFormField(
                          controller: mobNo,
                          decoration: InputDecoration(
                            labelText: "WhatsApp Number *",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          //Mobile Number  Validation
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Mobile Number *";
                            } else if (value.length != 10) {
                              return "Length must be of 10 characters *";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Yes no radio button question
                        Text(
                          "Have you done Mahaasmani Shivir",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Yes no radio button
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _ma,
                              onChanged: (value) {
                                setState(() {
                                  _ma = value;
                                  _maValue = "Yes";
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Yes",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            // Yes no radio button
                            Radio(
                              value: 2,
                              groupValue: _ma,
                              onChanged: (value) {
                                setState(() {
                                  _ma = value;
                                  _maValue = "No";
                                  _tejsthanValue = "";
                                  _shivirValue = "";
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "No",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //shivir dropdwon
                        Container(
                          child: Column(
                            children: [
                              //visibilty depending upon ma value
                              Visibility(
                                visible: _maValue == "Yes",
                                child: Container(
                                  child: DropdownButtonFormField<String>(
                                    items: _shivir.map((String dropdownItem) {
                                      return DropdownMenuItem<String>(
                                        child: Text(dropdownItem),
                                        value: dropdownItem,
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(
                                        () {
                                          this._currentValueShivir =
                                              newValue.toString();
                                          _shivirValue = newValue.toString();

                                          if (_shivirValue ==
                                              'Online MA (Maha Aasmani)') {
                                            _tejsthanValue = '';
                                            disabledmessage =
                                                'Tejsthan is disabled when Shvir is online Maha Asmani';
                                            _enabled = true;
                                          } else {
                                            _enabled = false;
                                            disabledmessage = '';
                                          }
                                        },
                                      );
                                    },
                                    isExpanded: true,
                                    value: _currentValueShivir,
                                    validator: (value) {
                                      if ((value == null)) {
                                        return "Please enter Shivir *";
                                      }

                                      return null;
                                    },
                                    hint: Text(
                                      "Current Shivir",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.8),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.expand_more_outlined,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    dropdownColor:
                                        Theme.of(context).canvasColor,
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                    elevation: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //tejsthan dropdown
                        Container(
                          child: Column(
                            children: [
                              //Visibilty of tejsthan depending upon Ma value
                              Visibility(
                                visible: _maValue == "Yes",
                                child: new IgnorePointer(
                                  //Ignoring parameter used to disable or enable the tejsthan field
                                  ignoring: _enabled,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    items: _tejsthan.map((String dropdownItem) {
                                      return DropdownMenuItem<String>(
                                        child: Text(dropdownItem),
                                        value: dropdownItem,
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (_shivirValue ==
                                            'Online MA (Maha Aasmani)') {
                                          _tejsthanValue = '';
                                          return null;
                                        }

                                        this._currentValueTejsthan =
                                            newValue.toString();
                                        this._tejsthanValue =
                                            newValue.toString();
                                      });
                                    },
                                    //tejsthan validation
                                    value: _currentValueTejsthan,
                                    validator: (value) {
                                      if ((value == null) &&
                                          _shivirValue !=
                                              'Online MA (Maha Aasmani)') {
                                        return "Please enter Tejsthan *";
                                      }

                                      return null;
                                    },
                                    hint: Text(
                                      "Tejsthan",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.8),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.expand_more_outlined,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    dropdownColor:
                                        Theme.of(context).canvasColor,
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                    elevation: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //disabled message when tejsthan is online ma
                        Text(
                          disabledmessage,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        // city form field
                        TextFormField(
                          controller: cityName,
                          decoration: InputDecoration(
                            labelText: "City Name",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          // City validation
                          validator: (value) {
                            if (value!.isEmpty &&
                                _shivirValue == 'Online MA (Maha Aasmani)') {
                              return "Please enter City Name *";
                            }
                            if (value == "" && _maValue == 'No') {
                              return "Please enter City Name *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // Country field
                        TextFormField(
                          autofocus: true,
                          controller: countryName,
                          decoration: InputDecoration(
                            labelText: "Country",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          // Validation of city
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Country Name *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: _acceptCheckbox,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _acceptCheckbox = value!;
                                    print(_acceptCheckbox);
                                  });
                                }),
                            Text(
                              "I accept the ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: _acceptCheckbox
                                    ? Theme.of(context).accentColor
                                    : Color(0xFF4a417f),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    conditionvar ? 50 : 8),
                                color: Color(0xFFf5f5f5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => tncPage()),
                                    );
                                  },
                                  //terms and condition navigate
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: conditionvar ? 50 : 130,
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: conditionvar
                                        ? Icon(
                                            Icons.done_outlined,
                                            color:
                                                Theme.of(context).canvasColor,
                                          )
                                        : Text(
                                            "Terms & Conditions",
                                            style: TextStyle(
                                              color: Color(0xFF4a417f),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Material(
                            borderRadius:
                                BorderRadius.circular(conditionvar ? 50 : 8),
                            color: Color(0xFF4a417f),
                            child: InkWell(
                              onTap: () {
                                print(_acceptCheckbox);
                                if (_acceptCheckbox == true) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => otpPage(
                                        firstName: fName.text,
                                        middleName: mName.text,
                                        lastName: lName.text,
                                        whatsAppNo: mobNo.text,
                                        emailId: emailId.text,
                                        cityName: cityName.text,
                                        country: countryName.text,
                                        tejsthan: _tejsthanValue,
                                        khojiShivir: _shivirValue,
                                        maCompleted:
                                            _maValue == "Yes" ? true : false,
                                      ),
                                    ),
                                  );
                                }
                                if (_formKey.currentState!.validate()) {
                                  submit(context, _acceptCheckbox, _ma,
                                      _shivirValue, _tejsthanValue);
                                }
                              },
                              // proceed button
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: conditionvar ? 50 : 120,
                                height: 40,
                                alignment: Alignment.center,
                                child: conditionvar
                                    ? Icon(
                                        Icons.done_outlined,
                                        color: Theme.of(context).canvasColor,
                                      )
                                    : Text(
                                        "PROCEED",
                                        style: TextStyle(
                                          color: Theme.of(context).canvasColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // back to login page button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text('If already registered'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    conditionvar ? 50 : 8),
                                color: Color(0xFFf5f5f5),
                                child: InkWell(
                                  onTap: () {
                                    //navigate to login page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: conditionvar ? 50 : 120,
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: conditionvar
                                        ? Icon(
                                            Icons.done_outlined,
                                            color:
                                                Theme.of(context).canvasColor,
                                          )
                                        : Text(
                                            "Sign In Now",
                                            style: TextStyle(
                                              color: Color(0xFF4a417f),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
