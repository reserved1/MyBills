//
//  BillFormView.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import SwiftUI

struct BillFormView: View {
    @EnvironmentObject var billVM: BillVM
    @ObservedObject var bformVM: BillFormVM
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    TextField("Nome da Conta", text: $bformVM.billDescription)
                    TextField("Código de Barra", text: $bformVM.barCode)
                    TextField("Valor", value: $bformVM.value, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .padding()
                    Toggle(bformVM.status ? "Pago" : "Não Pago", isOn: $bformVM.status)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Contas")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    cancelButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    saveUpdateButton
                }
            }
        }
    }
}
extension BillFormView {
    func addBill() {
        let bill = Bill(barCode: bformVM.barCode, billDescription: bformVM.billDescription, status: bformVM.status, value: bformVM.value)
        billVM.addBill(bill)
        presentationMode.wrappedValue.dismiss()
    }
    func updateBill() {
        let bill = Bill(id: bformVM.id!, barCode: bformVM.barCode, billDescription: bformVM.billDescription, status: bformVM.status, value: bformVM.value)
        billVM.updateBill(bill)
        presentationMode.wrappedValue.dismiss()
    }
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    var saveUpdateButton: some View {
        Button( bformVM.update ? "Update" : "Save", action: bformVM.update ? updateBill : addBill)
        .disabled(bformVM.isDisabled)
    }
}
struct BillFormView_Previews: PreviewProvider {
    static var previews: some View {
        BillFormView(bformVM: BillFormVM())
            .environmentObject(BillVM())
    }
}
