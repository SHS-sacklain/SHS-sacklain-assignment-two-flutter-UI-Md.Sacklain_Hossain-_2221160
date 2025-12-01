import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// ===== Replace these with your real details =====
const String STUDENT_NAME = 'Md.Sacklain Hossain';
const String STUDENT_ID = '2221160';
const String STUDENT_EMAIL = '2221160@iub.edu.bd';
/// ===============================================

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Two - Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFF7F7FA),
      ),
      home: AssignmentTwoHome(),
    );
  }
}

class AssignmentTwoHome extends StatefulWidget {
  @override
  _AssignmentTwoHomeState createState() => _AssignmentTwoHomeState();
}

class _AssignmentTwoHomeState extends State<AssignmentTwoHome> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ReportsPage(),
    CardsPage(),
    ProfilePage(),
  ];

  void _onTap(int idx) {
    setState(() => _currentIndex = idx);
    _pageController.animateToPage(idx,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, -1))
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTap,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.insert_chart_outlined), label: 'Reports'),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined), label: 'Cards'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

/// =================== PAGE 1 - Home / Dashboard ===================
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pad = 16.0;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.indigoAccent,
                  child: Text(
                    STUDENT_NAME.isNotEmpty ? STUDENT_NAME[0] : 'M',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome back,', style: TextStyle(color: Colors.grey[700])),
                      SizedBox(height: 2),
                      Text(
                        STUDENT_NAME,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
              ],
            ),

            SizedBox(height: 16),

            _BalanceCard(),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _QuickAction(icon: Icons.swap_horiz, label: 'Transfer'),
                _QuickAction(icon: Icons.receipt_long, label: 'Pay Bills'),
                _QuickAction(icon: Icons.monetization_on, label: 'Invest'),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: Text('View All'))
              ],
            ),

            SizedBox(height: 8),


            Column(
              children: [
                _TransactionTile(
                    title: 'Netflix Subscription',
                    subtitle: 'Entertainment · Today',
                    amount: '-\$19.99',
                    amountColor: Colors.red),
                _TransactionTile(
                    title: 'Coffee Shop',
                    subtitle: 'Food & Drink · Today',
                    amount: '-\$4.50',
                    amountColor: Colors.red),
                _TransactionTile(
                    title: 'Salary Deposit',
                    subtitle: 'Income · Yesterday',
                    amount: '+\$3500.00',
                    amountColor: Colors.green),
                _TransactionTile(
                    title: 'Grocery Store',
                    subtitle: 'Shopping · Yesterday',
                    amount: '-\$55.80',
                    amountColor: Colors.red),
                _TransactionTile(
                    title: 'Amazon Purchase',
                    subtitle: 'Shopping · 2 days ago',
                    amount: '-\$120.45',
                    amountColor: Colors.red),
              ],
            ),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Container(
        padding: EdgeInsets.all(18),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [Color(0xFF5B5FFF), Color(0xFF6C57FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Balance', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8),
            Row(
              children: [
                Text('\$8,945', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                Text('.32', style: TextStyle(color: Colors.white70, fontSize: 18)),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
                )
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Savings: \$5,500', style: TextStyle(color: Colors.white70)),
                Text('Last 30 days: +\$300', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Container(
            height: 72,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 18, backgroundColor: Colors.indigo[50], child: Icon(icon, color: Colors.indigo)),
                SizedBox(height: 8),
                Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[800])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;

  const _TransactionTile({required this.title, required this.subtitle, required this.amount, required this.amountColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.grey[100], child: Icon(Icons.store, color: Colors.grey[700])),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: Text(amount, style: TextStyle(color: amountColor, fontWeight: FontWeight.bold)),
        onTap: () {},
      ),
    );
  }
}

/// =================== PAGE 2 - Reports ===================
class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pad = 16.0;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 18, backgroundColor: Colors.indigoAccent, child: Text(STUDENT_NAME.isNotEmpty ? STUDENT_NAME[0] : 'M', style: TextStyle(color: Colors.white))),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome back,', style: TextStyle(color: Colors.grey[700])),
                      SizedBox(height: 2),
                      Text(STUDENT_NAME, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
              ],
            ),

            SizedBox(height: 20),

            Text('Monthly Spending Report', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),

            SizedBox(height: 12),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Expenses (Last 30 days)', style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 8),
                    Text('-\$1270.00', style: TextStyle(color: Colors.redAccent[700], fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('↑ Up 12% from last month', style: TextStyle(color: Colors.red[800])),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Spending Breakdown', style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 12),
                    _SpendingRow(label: 'Food & Drink', amount: '\$450.00 (35%)', percent: 0.35, color: Colors.red),
                    _SpendingRow(label: 'Shopping', amount: '\$320.00 (25%)', percent: 0.25, color: Colors.purple),
                    _SpendingRow(label: 'Housing', amount: '\$280.00 (22%)', percent: 0.22, color: Colors.orange),
                    _SpendingRow(label: 'Transport', amount: '\$150.00 (12%)', percent: 0.12, color: Colors.green),
                    _SpendingRow(label: 'Other', amount: '\$70.00 (6%)', percent: 0.06, color: Colors.grey),
                  ],
                ),
              ),
            ),

            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}

class _SpendingRow extends StatelessWidget {
  final String label;
  final String amount;
  final double percent;
  final Color color;

  const _SpendingRow({required this.label, required this.amount, required this.percent, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), Text(amount)],
        ),
        SizedBox(height: 6),
        Stack(
          children: [
            Container(height: 8, decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8))),
            FractionallySizedBox(
              widthFactor: percent,
              child: Container(height: 8, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8))),
            )
          ],
        )
      ]),
    );
  }
}

/// =================== PAGE 3 - Cards ===================
class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pad = 16.0;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(pad),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Row(
            children: [
              CircleAvatar(radius: 18, backgroundColor: Colors.indigoAccent, child: Text(STUDENT_NAME.isNotEmpty ? STUDENT_NAME[0] : 'M', style: TextStyle(color: Colors.white))),
              SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Welcome back,', style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 2),
                  Text(STUDENT_NAME, style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
            ],
          ),

          SizedBox(height: 20),

          Text('My Cards', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          SizedBox(height: 12),


          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [Color(0xFF0B1726), Color(0xFF122537)]),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 6))],
            ),
            padding: EdgeInsets.all(18),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(width:50, height: 40, decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(6))),
                Text('BANK', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
              ]),
              Spacer(),
              Text('4567  ****  ****  1234', style: TextStyle(letterSpacing: 2.0, color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('CARD HOLDER', style: TextStyle(color: Colors.white54, fontSize: 10)),
                  SizedBox(height: 4),
                  Text(STUDENT_NAME, style: TextStyle(color: Colors.white)),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('EXPIRES', style: TextStyle(color: Colors.white54, fontSize: 10)),
                  SizedBox(height: 4),
                  Text('12/28', style: TextStyle(color: Colors.white)),
                ]),
              ]),
            ]),
          ),

          SizedBox(height: 12),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CardAction(icon: Icons.close, label: 'Block'),
              _CardAction(icon: Icons.info_outline, label: 'Details'),
              _CardAction(icon: Icons.tune, label: 'Limit'),
            ],
          ),

          SizedBox(height: 20),

          Text('Linked Accounts', style: TextStyle(fontWeight: FontWeight.bold)),

          SizedBox(height: 8),

          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.indigo[50], child: Icon(Icons.savings, color: Colors.indigo)),
              title: Text('Shared Savings'),
              subtitle: Text('\$5,500.00'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),

          SizedBox(height: 200),
        ]),
      ),
    );
  }
}

class _CardAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CardAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 70,
            alignment: Alignment.center,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CircleAvatar(radius: 18, backgroundColor: Colors.indigo[50], child: Icon(icon, color: Colors.indigo)),
              SizedBox(height: 6),
              Text(label, style: TextStyle(fontSize: 12)),
            ]),
          ),
        ),
      ),
    );
  }
}

/// =================== PAGE 4 - Profile ===================
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pad = 16.0;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(pad),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(children: [
            CircleAvatar(radius: 18, backgroundColor: Colors.indigoAccent, child: Text(STUDENT_NAME.isNotEmpty ? STUDENT_NAME[0] : 'M', style: TextStyle(color: Colors.white))),
            SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Welcome back,', style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 2),
              Text(STUDENT_NAME, style: TextStyle(fontWeight: FontWeight.bold)),
            ])),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
          ]),

          SizedBox(height: 20),

          Text("User Profile", style: TextStyle(fontWeight: FontWeight.bold)),

          CircleAvatar(radius: 38, backgroundColor: Colors.indigoAccent, child: Text(_initials(), style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),

          SizedBox(height: 18),

          _InfoCard(label: 'Name', value: '$STUDENT_NAME'),
          _InfoCard(label: 'Student ID', value: '$STUDENT_ID'),
          _InfoCard(label: 'Email', value: '$STUDENT_EMAIL'),

          SizedBox(height: 12),

          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Bio / Story', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                  '“I\'m currently focusing on my final year, balancing studies with building side projects. I believe financial health is key to academic success. I love hiking on weekends and planning my next big travel adventure!”',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 8),
                Text('(Note: Students should replace the text above with their own description here)', style: TextStyle(color: Colors.red[300], fontSize: 12)),
              ]),
            ),
          ),

          SizedBox(height: 120),
        ]),
      ),
    );
  }

  static String _initials() {
    if (STUDENT_NAME.trim().isEmpty) return 'MH';
    final parts = STUDENT_NAME.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts.last[0]).toUpperCase();
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;
  const _InfoCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(label, style: TextStyle(color: Colors.grey[700])),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
