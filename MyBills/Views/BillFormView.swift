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
    @State private var rotation: Double = 0

    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .center) {
                    Section(header: Text("Nome da Conta:").bold().position(x: 61, y: 15)) {
                        TextField("Nome da Conta", text: $bformVM.billDescription).font(.subheadline)
                    }
                    .textFieldStyle(.automatic)
                    Divider()
                    Section(header: Text("Código de Barras:").bold().position(x: 68, y: 15)) {
                        TextField("Código de Barra", text: $bformVM.barCode).font(.subheadline)
                            .textFieldStyle(.automatic)
                    }
                    Divider()
                    Section(header: Text("Valor:").bold().position(x: 19, y: 15)) {
                        TextField("", value: $bformVM.value, formatter: NumberFormatter()).font(.subheadline)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.automatic)
                    }
                    Divider()
                    Section(header: Text("Pagamento:").bold().position(x: 45, y: 15)) {
                        Toggle(bformVM.status ? "Pago" : "Não Pago", isOn: $bformVM.status)
                    }
                }
                .padding()
                .foregroundColor(Color("Principal"))
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Contas")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color("Principal"))
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
        let bill = Bill(
            barCode: bformVM.barCode, billDescription: bformVM.billDescription, status: bformVM.status, value: bformVM.value
        )
        billVM.addBill(bill)
        presentationMode.wrappedValue.dismiss()
    }
    func updateBill() {
        let bill = Bill(
            id: bformVM.id!, barCode: bformVM.barCode, billDescription: bformVM.billDescription, status: bformVM.status, value: bformVM.value
        )
        billVM.updateBill(bill)
        presentationMode.wrappedValue.dismiss()
    }
    var cancelButton: some View {
        Button("Cancelar") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    var saveUpdateButton: some View {
        Button( bformVM.update ? "Atualizar" : "Salvar", action: bformVM.update ? updateBill : addBill)
        .disabled(bformVM.isDisabled)
    }
}
struct BillFormView_Previews: PreviewProvider {
    static var previews: some View {
        BillFormView(bformVM: BillFormVM())
            .environmentObject(BillVM())
    }
}
