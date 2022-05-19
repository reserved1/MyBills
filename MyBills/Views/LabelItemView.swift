//
//  Item.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import Foundation
import SwiftUI

struct LabelItem: View {
    @Binding var bill: Bill
    @Binding var status: Bool
    @Binding var description: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 300, height: 50, alignment: .center)
            HStack {
                VStack(alignment: .center) {
                    Group {
                        Text(description)
                            .bold()
                            .font(.title)
                        Text(status ? "Pago" : "Não Pago")
                            .font(.subheadline)
                    }
                    .foregroundColor(Color("Principal"))
                }
            }
        }
//        .accentColor(.white.opacity(0.01))
    }
}
