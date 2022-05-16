//
//  BillDataVM.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import Foundation
class BillVM: ObservableObject {
    @Published var bills: [Bill] = []
    let codableData = CodableData()
    init() {
        print(FileManager.docURL.path)
        loadBills()
    }
    func addBill(_ bill: Bill) {
        bills.append(bill)
        saveBills()
    }
    func updateBill(_ bill: Bill) {
        guard let index = bills.firstIndex(where: { $0.id == bill.id }) else { return }
        bills[index] = bill
        saveBills()
    }
    func deleteBill(at indexSet: IndexSet ) {
        bills.remove(atOffsets: indexSet)
        saveBills()
    }
    func loadBills() {
//        bills = Bill.mock
        codableData.decode(&bills)
//        FileManager().readDoc(docName: fileName) { (result) in
//            switch result {
//            case .success(let data):
//                let decoder = JSONDecoder()
//                do {
//                    bills = try decoder.decode([Bill].self, from: data)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    func saveBills() {
        print("Saving info.")
        codableData.enconde(bills)
//        let encoder = JSONEncoder()
//        do {
//            let data = try encoder.encode(bills)
//            let jsonString = String(decoding: data, as: UTF8.self)
//            FileManager().saveDoc(contents: jsonString, docName: fileName) { (error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
    }
}
