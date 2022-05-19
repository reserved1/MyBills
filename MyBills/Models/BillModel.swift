//
//  BillModel.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import Foundation

struct Bill: Identifiable, Codable, Hashable {
    var id: String = UUID().uuidString
    var barCode: String
    var billDescription: String
    var status: Bool
    var value: Double
    static let mock: [Bill] = [
        Bill(barCode: "12345", billDescription: "Energia", status: true, value: 10.0),
        Bill(barCode: "54321", billDescription: "Internet", status: false, value: 50.5)
    ]
}
