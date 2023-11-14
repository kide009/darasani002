import 'package:darasani/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/utils/flutterwave_currency.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/AuthController.dart';
import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widgets/custom_text.dart';
import '../home/student_profile_screen.dart';
import 'secrets.dart';

class PaymentDetailPage extends StatefulWidget {
  const PaymentDetailPage({super.key});

  @override
  State<PaymentDetailPage> createState() => _PaymentDetailState();
}

//add the following values to create the UI for Flutterwave Payment
class _PaymentDetailState extends State<PaymentDetailPage> {
  //use the currency you would like the user to Pay In, in this case, I used KES currency
  final String currency = FlutterwaveCurrency.KES;
  final formKey = GlobalKey<FormState>();
  late  TextEditingController fullname = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController email = TextEditingController();
  final TextEditingController amount = TextEditingController();

  String? name;
  String? _email;
  String? phoneNumber;
  String? profileImg;


  @override
  void initState() {
    super.initState();
    loadUserData();


  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    UserController userController = UserController();
    // Retrieve 'name', 'email', and 'phoneNumber' from SharedPreferences
    setState(() {
      _email = prefs.getString('email');
      userController.fetchUserByEmail(_email!);

      name = prefs.getString('name');
      phoneNumber = prefs.getString('phoneNumber');

// Set initial values for text fields
      fullname = TextEditingController(text: name ?? '');
      phone = TextEditingController(text: phoneNumber ?? '');
      email = TextEditingController(text: _email ?? '');
    });
  }
  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: kGreyColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            // child: Center(
            //  child: Image.network(
            //    widget.library.coverImg,
            //    height: 14.h,
            //  ),
            // ),
          ),
          centerTitle: true,
          title: CustomText(
            title: "Payment",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: kBlackColor,
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Helper.toScreen(context, StudentProfileScreen());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 36.h,
                        width: 36.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/dp.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Form(
          key: formKey,
          child: Container(
            margin: const EdgeInsets.all(10.0), // Add margin to center the content
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: fullname,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                    ),
                    validator: (value) =>
                    value!.isNotEmpty ? null : "Please fill in Your Name",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: phone,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                    ),
                    validator: (value) =>
                    value!.isNotEmpty ? null : "Please fill in Your Phone number",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) =>
                    value!.isNotEmpty ? null : "Please fill in Your Email",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: amount,
                    decoration: const InputDecoration(
                      labelText: "Amount",
                    ),
                    validator: (value) =>
                    value!.isNotEmpty ? null : "Please fill in the Amount you are Paying",
                  ),
                ),
                ElevatedButton(
                  child: const Text('Pay via Mpesa'),
                  onPressed: () {
                    final name = fullname.text;
                    final userPhone = phone.text;
                    final userEmail = email.text;
                    final amountPaid = amount.text;

                    if (formKey.currentState!.validate()) {
                      _makeFlutterwavePayment(context, name, userPhone, userEmail, amountPaid);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  void _makeFlutterwavePayment(BuildContext context, String fullname,
      String phone, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
        //the first 10 fields below are required/mandatory
          context: this.context,
          fullName: fullname,
          phoneNumber: phone,
          email: email,
          amount: amount,
          //Use your Public and Encription Keys from your Flutterwave account on the dashboard
          encryptionKey: Secrets.encryptionKey,
          publicKey: Secrets.publicKey,
          currency: currency,
          txRef: DateTime.now().toIso8601String(),
          //Setting DebugMode below to true since will be using test mode.
          //You can set it to false when using production environment.
          isDebugMode: true,
          //configure the the type of payments that your business will accept
          acceptCardPayment: false,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: true,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false);

      final response = await flutterwave.initializeForUiPayments();
      if (response == null) {
        print("Transaction Failed");
      } else {
        if (response.status == "Transaction successful") {
          // print(response.data);
          // print(response.message);
          Helper.toScreen(context, HomeScreen());
        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }


}