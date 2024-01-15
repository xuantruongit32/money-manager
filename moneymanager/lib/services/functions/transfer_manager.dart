import 'package:moneyManager/services/models/transfer.dart';

class TransferManager {
  static List<Transfer> transfers=[];

  static addTransfer(Transfer transfer){
    transfers.add(transfer);
  }
  static removeTransfer(Transfer transfer){
    transfers.remove(transfer);
  }
}
