class FinanceResponse{

	final String message;//message
	final Map errors;//error
	final Map finance;//finance

	FinanceResponse({this.message, this.errors, this.finance});

	factory FinanceResponse.fromJson(Map<String,dynamic> json){
		return FinanceResponse(
			message: json['message'],
			errors: json['errors'],
			finance: json['finance']
		);
	}
}

class ModFinanceResponse{

	final String message;//message

	ModFinanceResponse({this.message});

	factory ModFinanceResponse.fromJson(Map<String,dynamic> json){
		return ModFinanceResponse(
			message: json['message'],
		);
	}
}


class FinancesResponse{

	final List data;

	FinancesResponse({this.data});

	factory FinancesResponse.fromJson(json){
    try {
      return FinancesResponse(
        data: json
      );
    } catch (e) {
      print(json['message']);
      return FinancesResponse(
        data: json
      );
    }
	}
}