//
//  JsonLoader.swift
//  Test
//
//  Created by Vihaan Khare on 6/5/24.
//

import Foundation

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.min.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Can't find \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Can't load \(filename):\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Can't ")
    }
}
