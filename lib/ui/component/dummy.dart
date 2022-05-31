import 'package:get/get.dart';

class DummyData {
  RxList tickets = [
    Tickets(
        tBlockRoom: "Tower 1 - 1304",
        tDesc: "Blockage in Tap",
        tID: "TK45689",
        tImg: "assets/images/blockTap.jpg",
        tstatus: "Recieved",
        tType: "Plumber"),
    Tickets(
        tBlockRoom: "Tower 4 - 801",
        tDesc: "Broken Table",
        tID: "TK44569",
        tImg: "assets/images/brokenTable.jpg",
        tstatus: "Under Progress",
        tType: "Carpenter"),
    Tickets(
      tBlockRoom: "Tower 3 - 1503",
      tDesc: "Tubelight is Flickering",
      tID: "TK78554",
      tImg: "assets/images/flickertube.jpeg",
      tstatus: "Resolved",
      tType: "Electrician",
    ),
  ].obs;
  RxList paymentHistory = [
    PaymentHistory(
        senderName: "Dheeraj Gupta",
        amount: "3500",
        blockRoom: "Tower 4 - 903",
        dateTime: "16/04/2022 10:43 AM",
        purpose: "Maintenance",
        trxID: "TX2317542353684422"),
    PaymentHistory(
        senderName: "Sirajuddin Ahmed",
        amount: "8000",
        blockRoom: "Tower 2 - 1402",
        dateTime: "11/03/2022 09:15 AM",
        purpose: "Donation",
        trxID: "TX3428653678578224"),
    PaymentHistory(
        senderName: "Gautam Rishi",
        amount: "4500",
        blockRoom: "Tower 2 - 604",
        dateTime: "18/04/2022 11:29 AM",
        purpose: "Maintenance",
        trxID: "TX3127543698488243"),
    PaymentHistory(
        senderName: "Yashwanth HK",
        amount: "2000",
        blockRoom: "Tower 1 - 201",
        dateTime: "12/03/2022 2:13 PM",
        purpose: "Donation",
        trxID: "TX3529653678456972"),
    PaymentHistory(
        senderName: "Faiz Khan",
        amount: "3500",
        blockRoom: "Tower 1 - 703",
        dateTime: "23/04/2022 8:35 AM",
        purpose: "Maintenance",
        trxID: "TX5578453678927450"),
    PaymentHistory(
        senderName: "Bhabya Sinha",
        amount: "4500",
        blockRoom: "Tower 3 - 402",
        dateTime: "19/04/2022 1:27 PM",
        purpose: "Maintenance",
        trxID: "TX5428453678499134"),
    PaymentHistory(
        senderName: "Dheeraj Gupta",
        amount: "3500",
        blockRoom: "Tower 4 - 903",
        dateTime: "16/04/2022 10:43 AM",
        purpose: "Maintenance",
        trxID: "TX2317542353684422"),
    PaymentHistory(
        senderName: "Tanweer Hussain",
        amount: "4500",
        blockRoom: "Tower 2 - 1502",
        dateTime: "22/04/2022 09:18 AM",
        purpose: "Maintenance",
        trxID: "TX1236541353553355"),
  ].obs;
  RxList paymentPending = [
    PaymentPending(
        purpose: "Maintenance",
        blockRoom: "Tower 1 - 303",
        number: "9632587412",
        amount: "3500",
        pName: "Ankit Gupta"),
    PaymentPending(
        purpose: "Maintenance",
        blockRoom: "Tower 2 - 402",
        number: "9843787465",
        amount: "4500",
        pName: "Shashi Bhooshan"),
    PaymentPending(
        purpose: "Maintenance",
        blockRoom: "Tower 1 - 201",
        number: "8652596931",
        amount: "3500",
        pName: "Kumaraswamy"),
    PaymentPending(
        purpose: "Maintenance",
        blockRoom: "Tower 4 - 502",
        number: "6392587241",
        amount: "4500",
        pName: "Puja"),
    PaymentPending(
        purpose: "Maintenance",
        blockRoom: "Tower 3 - 901",
        number: "7732695335",
        amount: "3500",
        pName: "Manoj"),
    PaymentPending(
        purpose: "Maintenance",
        blockRoom: "Tower 2 - 604",
        number: "6602586809",
        amount: "4500",
        pName: "Shubham"),
  ].obs;
  RxList paymentDonation = [
    PaymentDonation(
        purpose: "Donation",
        blockRoom: "Tower 4 - 903",
        number: "9614035474",
        amount: "2000",
        pName: "Dheeraj Gupta"),
    PaymentDonation(
        purpose: "Donation",
        blockRoom: "Tower 2 - 1502",
        number: "8691540312",
        amount: "8000",
        pName: "Tanweer Hussain"),
    PaymentDonation(
        purpose: "Donation",
        blockRoom: "Tower 1 - 101",
        number: "723489065",
        amount: "4000",
        pName: "Manish Gogoi"),
    PaymentDonation(
        purpose: "Donation",
        blockRoom: "Tower 1 - 1702",
        number: "9895035480",
        amount: "6000",
        pName: "Diganta Das"),
    PaymentDonation(
        purpose: "Donation",
        blockRoom: "Tower 5 - 303",
        number: "9987045075",
        amount: "4000",
        pName: "Dheeraj Gupta"),
  ].obs;
}

class PaymentDonation {
  final String pName;
  final String blockRoom;
  final String purpose;
  final String number;
  final String amount;

  PaymentDonation({
    required this.purpose,
    required this.blockRoom,
    required this.number,
    required this.amount,
    required this.pName,
  });
}

class PaymentPending {
  final String pName;
  final String blockRoom;
  final String purpose;
  final String number;
  final String amount;

  PaymentPending({
    required this.purpose,
    required this.blockRoom,
    required this.number,
    required this.amount,
    required this.pName,
  });
}

class PaymentHistory {
  final String senderName;
  final String amount;
  final String blockRoom;
  final String purpose;
  final String dateTime;
  final String trxID;

  PaymentHistory({
    required this.senderName,
    required this.amount,
    required this.blockRoom,
    required this.dateTime,
    required this.purpose,
    required this.trxID,
  });
}

class Tickets {
  final String tBlockRoom;
  final String tType;
  final String tDesc;
  final String tImg;
  final String tstatus;
  final String tID;

  Tickets(
      {required this.tBlockRoom,
      required this.tDesc,
      required this.tID,
      required this.tImg,
      required this.tstatus,
      required this.tType});
}
