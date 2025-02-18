import 'package:deepvidai/Utils/theme.dart';
import 'package:flutter/material.dart';

class BillingSubscriptionScreen extends StatefulWidget {
  @override
  _BillingSubscriptionScreenState createState() =>
      _BillingSubscriptionScreenState();
}

class _BillingSubscriptionScreenState extends State<BillingSubscriptionScreen> {
  bool isYearly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Billing & Subscription"),
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flexible Pricing for Every Creator",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Choose the perfect plan for your needs. Save up to 60% with yearly billing.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ToggleButtons(
              isSelected: [!isYearly, isYearly],
              onPressed: (index) {
                setState(() {
                  isYearly = index == 1;
                });
              },
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Monthly")),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Yearly (Save 60%)")),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _buildSubscriptionPlans(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSubscriptionPlans() {
    List<Map<String, dynamic>> plans = isYearly ? yearlyPlans : monthlyPlans;
    return plans.map((plan) {
      return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan['name'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(plan['billing'], style: TextStyle(color: Colors.grey)),
              SizedBox(height: 5),
              Text(
                plan['price'],
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: plan['features']
                    .map<Widget>((feature) => Text("• $feature"))
                    .toList(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text("Choose ${plan['name']}",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}

List<Map<String, dynamic>> monthlyPlans = [
  {
    "name": "Free",
    "billing": "Billed monthly",
    "price": "\$0/month",
    "features": [
      "60 credits per month",
      "6 images, 3 songs, or 2 videos",
      "Lower priority processing",
      "Only 2 AI voices",
      "Standard generation speed",
      "Non-commercial use only",
      "Watermarks"
    ]
  },
  {
    "name": "Starter",
    "billing": "Billed monthly",
    "price": "\$7.99/month",
    "features": [
      "500 credits per month",
      "50 images, 25 songs, or 16 videos",
      "High priority processing",
      "4 AI voices",
      "Standard generation speed",
      "Non-commercial use only",
      "Watermarks"
    ]
  },
  {
    "name": "Creator",
    "billing": "Billed monthly",
    "price": "\$14.99/month",
    "features": [
      "1,200 credits per month",
      "120 images, 60 songs, or 40 videos",
      "8 AI voices",
      "High priority processing",
      "No Watermarks",
      "Fast generation speed",
      "Commercial use allowed"
    ]
  },
  {
    "name": "Premium",
    "billing": "Billed monthly",
    "price": "\$29.99/month",
    "features": [
      "2,800 credits per month",
      "280 images, 140 songs, or 93 videos",
      "All 10 AI voices",
      "High priority processing",
      "No Watermarks",
      "Fastest generation speed",
      "Commercial use allowed"
    ]
  },
];

List<Map<String, dynamic>> yearlyPlans = [
  {
    "name": "Free",
    "billing": "Billed yearly",
    "price": "\$0/year",
    "features": [
      "60 credits per month (total 720 Credits)",
      "72 images, 36 songs, or 24 videos",
      "Lower priority processing",
      "Only 2 AI voices",
      "Standard generation speed",
      "Non-commercial use only",
      "Watermarks"
    ]
  },
  {
    "name": "Starter",
    "billing": "Billed yearly",
    "price": "\$79.99/year",
    "features": [
      "540 credits per month (total 6,500 Credits) ~ 8% more!",
      "650 images, 325 songs, or 216 videos",
      "High priority processing",
      "4 AI voices",
      "Standard generation speed",
      "Non-commercial use only",
      "Watermarks"
    ]
  },
  {
    "name": "Creator",
    "billing": "Billed yearly",
    "price": "\$149.99/year",
    "features": [
      "1,250 credits per month (total 15,000 Credits) ~ 25% more!",
      "1,500 images, 750 songs, or 500 videos",
      "8 AI voices",
      "High priority processing",
      "No Watermarks",
      "Fast generation speed",
      "Commercial use allowed"
    ]
  },
  {
    "name": "Premium",
    "billing": "Billed yearly",
    "price": "\$299.99/year",
    "features": [
      "2,920 credits per month (total 35,000 Credits) ~ 25% more!",
      "3,500 images, 1,750 songs, or 1,166 videos",
      "All 10 AI voices",
      "High priority processing",
      "No Watermarks",
      "Fastest generation speed",
      "Commercial use allowed"
    ]
  },
];
