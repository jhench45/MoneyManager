import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';
import 'package:moneymanager/services/financeservice.dart';

import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/views/signinpage.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/app_drawer.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/app_fab.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/app_bar_title_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/empty_transaction_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/month_year_picker_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/summary_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/transactions_listview_widget.dart';
import 'package:provider/provider.dart';
import 'package:moneymanager/models/authmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!Provider.of<AuthModel>(context, listen: false).isLoggedIn) {
      return SignInPage();
    }

    return BaseView<HomeModel>(
      onModelReady: (model) async => await model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: buildAppBar(model.appBarTitle, model),
        //backgroundColor: Colors.green,
        drawer: AppDrawer(context),

        floatingActionButton: Visibility(
          visible: model.show,
          child: AppFAB(model.closeMonthPicker),
        ),
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      

                      FutureBuilder(
                        future: generateSummaryWidget(context),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print(snapshot.error);
                          if (snapshot.hasData) {
                            return snapshot.data;
                          } else {
                            return EmptyTransactionsWidget();
                          }
                        },
                      ),
                      FutureBuilder(
                        future: generateTransactList(context, model),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print(snapshot.error);
                          if (snapshot.hasData) {
                            return snapshot.data;
                          } else {
                            return SummaryWidget(
                              income: model.incomeSum,
                              expense: model.expenseSum,
                            );
                          }
                        },
                      ),

                      // buildList(model.transactions, model),
                    ],
                  ),
                  model.isCollabsed
                      ? PickMonthOverlay(
                          model: model,
                          showOrHide: model.isCollabsed,
                          context: context)
                      : Container(),
                ],
              ),
      ),
    );
  }

  buildAppBar(String title, HomeModel model) {
    return AppBar(
      backgroundColor: Colors.green,
      title: AppBarTitle(
        title: title,
        model: model,
      ),
    );
  }


  Future generateSummaryWidget(context)async{
    var token = Provider.of<AuthModel>(context, listen: false).token;
    var finances = await getFinances(token);
    var income = 0;
    var expense = 0;

    for (var item in finances.data) {
      if(item['type'] == "expense"){
        expense += item["amount"];
      }else{
        income += item["amount"];
      }
    }

    if(income != 0 && expense != 0){
      return SummaryWidget(
        income: income,
        expense: expense,
      );
    }
  }

  buildList(List<Transaction> transactions, HomeModel model) {
    return transactions.length == 0
        ? EmptyTransactionsWidget()
        : TransactionsListView(transactions, model);
  }

  Future<Widget> generateTransactList(context, model) async {
    var token = Provider.of<AuthModel>(context, listen: false).token;
    var finances = await getFinances(token);
    var months = [
      "January",
      "Febuary",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    print(finances.data);
    List<Transaction> customTransactions = [];

    for (var item in finances.data) {
      customTransactions.add(Transaction(
          day: item["date"].toString().substring(8, 10),
          month: months[int.parse(item["date"].toString().substring(5, 7))],
          type: item['type'],
          amount: item['amount'],
          memo: item['memo'],
          categoryindex: int.parse(item['category'])));
    }

    return customTransactions.length == 0
        ? EmptyTransactionsWidget()
        : TransactionsListView(customTransactions, model);
  }


}
