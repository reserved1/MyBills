//
//  EnumModel.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import SwiftUI

enum OptionTypes: Identifiable, View {
    case new
    case update(Bill)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    var body: some View {
        switch self {
        case .new:
            return BillFormView(bformVM: BillFormVM())
        case .update(let bill):
            return BillFormView(bformVM: BillFormVM(bill))
        }
    }
}
