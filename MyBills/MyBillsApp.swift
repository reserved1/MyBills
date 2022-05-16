//
//  MyBillsApp.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import SwiftUI

@main
struct MyBillsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BillVM())
        }
    }
}
