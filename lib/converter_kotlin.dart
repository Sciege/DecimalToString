class Converter {
  List<String> multipliers = ["", "Thousand", "Million", "Billion", "Trillion"];

  String operation(num number) {
    if (number == 0) {
      return 'Please enter a valid cheque amount to be converted';
    } else {
      String connect = '';
      int indexMultipliers = 0;
      int peso = number.toInt();
      int cents = ((number - peso) * 100).round();
      String convertedCents = '';
      if (cents == 0) {
        convertedCents = "";
      } else {
        if (cents == 0) {
          convertedCents = "";
        } else if (cents < 20) {
          convertedCents = "  And " + oneToNineteen(cents);
        } else if (cents < 100) {
          convertedCents =
              "And "+tens(cents ~/ 10) + " " + oneToNineteen(cents % 10);
        }
      }
      while (0 < peso) {
        //multiplier
        if ((peso % 1000).toInt() != 0) {
          connect =
              "${newOperation((peso % 1000).toInt())} ${multipliers[indexMultipliers]} $connect";
        }
        peso ~/= 1000;
        indexMultipliers++;
      }
      if (convertedCents.isNotEmpty){
        return '${connect.trim()} ${convertedCents.trim()} Cents Only';
      }else{
        return '${connect.trim()} Only';
      }
      //'${connect.trim()}${convertedCents.trim()} Only';
    }
  }

  String newOperation(int number) {
    if (number == 0) {
      return "";
    } else if (number < 20) {
      return oneToNineteen(number);
    } else if (number < 100) {
      return tens(number ~/ 10) + " " + oneToNineteen(number % 10);
    } else {
      return oneToNineteen((number ~/ 100)) +
          " Hundred" +
          ((number % 100 != 0 ? " And " : (" ")) + newOperation(number % 100));
    }
  }

  oneToNineteen(int number) {
    switch (number) {
      case 0:
        return "";
      case 1:
        return "One";
      case 2:
        return "Two";
      case 3:
        return "Three";
      case 4:
        return "Four";
      case 5:
        return "Five";
      case 6:
        return "Six";
      case 7:
        return "Seven";
      case 8:
        return "Eight";
      case 9:
        return "Nine";
      case 10:
        return "Ten";
      case 11:
        return "Eleven";
      case 12:
        return "Twelve";
      case 13:
        return "Thirteen";
      case 14:
        return "Fourteen";
      case 15:
        return "Fifteen";
      case 16:
        return "Sixteen";
      case 17:
        return "Seventeen";
      case 18:
        return "Eighteen";
      case 19:
        return "Nineteen";
      default:
        return "Invalid";
    }
  }

  tens(int number) {
    switch (number) {
      case 2:
        return "Twenty";
      case 3:
        return "Thirty";
      case 4:
        return "Forty";
      case 5:
        return "Fifty";
      case 6:
        return "Sixty";
      case 7:
        return "Seventy";
      case 8:
        return "Eighty";
      case 9:
        return "Ninety";
      default:
        return "Invalid";
    }
  }
}
