//
//  Item.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import Foundation
import SwiftUI

struct LabelItem: View {
    @Binding var status: Bool
    @Binding var description: String
    var body: some View {
        HStack {
            Circle()
                .strokeBorder(Color.white, lineWidth: 2)
                .background(Circle().foregroundColor(status ? .green : .red))
                .frame(width: 40, height: 40)
                .shadow(radius: 7)
            Text(description)
                .font(.title3)
                .strikethrough(status)
        }
    }
}
