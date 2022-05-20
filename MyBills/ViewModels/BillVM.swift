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
        codableData.decode(&bills)
    }
    func saveBills() {
        codableData.enconde(bills)
    }
}
