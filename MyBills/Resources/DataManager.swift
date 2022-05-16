//
//  DataManager.swift
//  MyBills
//
//  Created by Matheus Augusto Alves de Meneses on 16/05/22.
//

import Foundation

let fileName = ".saves.JSON"

extension FileManager {
    static var docURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    func saveDoc(contents: String, docName: String, completion: (Error?) -> Void) {
        let url = Self.docURL.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }
    }
    func readDoc(docName: String, completion: (Result<Data, Error>) -> Void) {
        let url = Self.docURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    func docExists(docName: String) -> Bool {
        fileExists(atPath: Self.docURL.appendingPathComponent(docName).path)
    }
}

struct CodableData {
    func enconde(_ bills: [Bill]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(bills)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDoc(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    func decode(_ bills: inout [Bill]) {
        FileManager().readDoc(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    bills = try decoder.decode([Bill].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
