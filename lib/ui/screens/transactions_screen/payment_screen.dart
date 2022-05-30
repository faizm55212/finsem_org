import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/ui/screens/transactions_screen/crowdFunding/crowdfunding_payment_screen.dart';
import 'package:finsem_org/ui/screens/transactions_screen/history/history_payment_screen.dart';
import 'package:finsem_org/ui/screens/transactions_screen/pending/pending_payment_screen.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: "Payments",
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 32,
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                unselectedLabelColor: FinColours.mainColor,
                indicatorPadding: EdgeInsets.zero,
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: FinColours.mainColor),
                unselectedLabelStyle: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: FinColours.mainColor,
                ),
                tabs: [
                  Tab(
                    child: Container(
                      height: 32,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: FinColours.mainColor, width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "HISTORY",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 32,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: FinColours.mainColor, width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "PENDING",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 32,
                      width: 115,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: FinColours.mainColor, width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "DONATION",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  HistoryPaymentScreen(),
                  PendingPaymentScreen(),
                  CrowdfundingPaymentScreen(),
                ],
              ),
            ),
          ],
        ));
  }
}
