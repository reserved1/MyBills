//
//  BillFormVM.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import Foundation

class BillFormVM: ObservableObject {
    var id: String?
    @Published var barCode: String = ""
    @Published var billDescription: String = ""
    @Published var status: Bool = false
    @Published var value: Double = 0
    var isDisabled: Bool {
        barCode.isEmpty || billDescription.isEmpty || value <= 0
    }
    var update: Bool {
        id != nil
    }
    init() {}
    init(_ bill: Bill) {
        id = bill.id
        self.barCode = bill.barCode
        self.billDescription = bill.billDescription
        self.status = bill.status
        self.value = bill.value
    }
}
