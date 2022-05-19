//
//  BillCardView.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 18/05/22.
//

import SwiftUI

struct BillCardView: View {
    @EnvironmentObject var billVM: BillVM
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 200, height: 130, alignment: .center)
                .foregroundColor( .gray)
                .blendMode(.hardLight)
            HStack {
                VStack(alignment: .center) {
                    Text("Titulozao")
                        .bold()
                        .font(.title)
                        .blendMode(.hardLight)
                    Text("rtestestestestetste")
                        .font(.subheadline)
                }
            }
        }
    }
}

struct BillCardView_Previews: PreviewProvider {
    static var previews: some View {
        BillCardView()
            .previewLayout(.sizeThatFits)
    }
}
