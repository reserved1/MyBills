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
    @State var searchText: String = ""
    var body: some View {
            NavigationView {
                List {
                    ForEach(filteredBills, id: \.self) { bill in
                                Button {
                                    enumModel = .update(bill)
                                } label: {
                                    HStack(alignment: .center) {
                                        Spacer()
                                            VStack(alignment: .center) {
                                                    Text(bill.billDescription)
                                                        .bold()
                                                        .font(.title2)
                                                        .foregroundColor(Color("Principal"))
                                                    Text(bill.status ? "Pago" : "Não Pago")
                                                        .font(.subheadline)
                                                        .foregroundColor(Color("Principal"))
                                            }
                                        Spacer()
                                        }
                                    .frame(height: 60)
                                }
                                .tint(Color("Principal"))
                    }
                    .onDelete(perform: billVM.deleteBill)
                }
                .listStyle(.insetGrouped)
                .environment(\.defaultMinListRowHeight, 20)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Text("Contas")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(Color("Principal"))
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
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .sheet(item: $enumModel) {
                switch $0 {
                case .new:
                    BillFormView(bformVM: BillFormVM())
                case .update(let bill):
                    BillFormView(bformVM: BillFormVM(bill))
                }
            }
    }
    var filteredBills: [Bill] {
        if searchText.lowercased() == ".ispaid" {
            return billVM.bills.filter { $0.status == true }
        }
        if searchText.lowercased() == ".nopaid" {
            return billVM.bills.filter { $0.status == false }
        }
        if searchText.isEmpty {
            return billVM.bills
        } else {
            return billVM.bills.filter { $0.billDescription.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BillVM())
    }
}
