//
//  ContentView.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var billVM: BillVM
    @State private var enumModel: OptionTypes?
    var body: some View {
        NavigationView {
            List {
                ForEach($billVM.bills) { $bill in
                    Button {
                        enumModel = .update(bill)
                    } label: {
                        LabelItem(status: $bill.status, description: $bill.billDescription)
                    }
                }
                .onDelete(perform: billVM.deleteBill )
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Contas")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        enumModel = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
        .sheet(item: $enumModel) {
            switch $0 {
            case .new:
                BillFormView(bformVM: BillFormVM())
            case .update(let bill):
                BillFormView(bformVM: BillFormVM(bill))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BillVM())
    }
}
