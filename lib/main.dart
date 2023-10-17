import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  TextEditingController _controller4 = new TextEditingController();
  TextEditingController _controller5 = new TextEditingController();
  late double interateAmt;
  late double eigfoamt;
  late double totalsalary;
  late double taxpayafded;
  late double diffmortrefund;
  late double mortgagededuction;
  late double monthlyDeduction;
  late double wozzvalue;
  late double netaftertaxrefund;
  void loancalculation() {
    final wozvalue = double.parse(_controller1.text);
    final rateamount = wozvalue * (double.parse(_controller2.text) / 100);
    final eigforfaitamt = wozvalue * (double.parse(_controller3.text) / 100);
    final tSalry =
        double.parse(_controller4.text) + double.parse(_controller5.text);
    final tpayafdeduc = tSalry - rateamount + eigforfaitamt;
    final difformrt = tSalry - tpayafdeduc;
    final mortded = (difformrt * 35) / 100;
    final monthdedu = mortded / 12;
    final netaftaxre = 3668 - monthdedu;
    setState(() {
      wozzvalue = wozvalue;
      interateAmt = rateamount;
      eigfoamt = eigforfaitamt;
      totalsalary = tSalry;
      taxpayafded = tpayafdeduc;
      diffmortrefund = difformrt;
      mortgagededuction = mortded;
      monthlyDeduction = monthdedu;
      netaftertaxrefund = netaftaxre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.notes,
          size: 30,
          color: Colors.black,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.cyanAccent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Salary",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    //style: GoogleFonts.robotoMono(fontSize: 35),
                  ),
                  Text(
                    "Details",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    //style: GoogleFonts.robotoMono(fontSize: 35),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputForm(
                  wvalue: "Woz vaue", intrest: " ", controller: _controller1),
              inputForm(
                  wvalue: "Interest", intrest: " ", controller: _controller2),
              inputForm(
                  wvalue: "eigenforfait",
                  intrest: " ",
                  controller: _controller3),
              inputForm(
                  wvalue: "Salary 1", intrest: " ", controller: _controller4),
              inputForm(
                  wvalue: "Salary 2", intrest: " ", controller: _controller5),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  loancalculation();
                  Future.delayed(Duration.zero);
                  showModalBottomSheet(
                      isDismissible: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      context: context,
                      builder: (BuildContext context) {
                        // ignore: sized_box_for_whitespace
                        return Container(
                          height: 1000,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Result",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  result(title: "Woz value", amount: wozzvalue),
                                  result(
                                      title: "Interest Rate",
                                      amount: interateAmt),
                                  result(
                                      title: "Eigenwoningforfait ",
                                      amount: eigfoamt),
                                  result(
                                      title: "Total Salary",
                                      amount: totalsalary),
                                  result(
                                      title: "TaxPayAfterDeduction",
                                      amount: taxpayafded),
                                  result(
                                      title: "DifferenceforMortgRe",
                                      amount: diffmortrefund),
                                  result(
                                      title: "Mortgage Deduction",
                                      amount: mortgagededuction),
                                  result(
                                      title: "Monthly Deduction",
                                      amount: monthlyDeduction),
                                  result(
                                      title: "Net after tax refund",
                                      amount: netaftertaxrefund),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      //style: GoogleFonts.robotoMono(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget result({required String title, required double amount}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      trailing: Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Text(
          amount.toStringAsFixed(2),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget inputForm({
    required String wvalue,
    required String intrest,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          wvalue,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 30,
            width: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: intrest),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
