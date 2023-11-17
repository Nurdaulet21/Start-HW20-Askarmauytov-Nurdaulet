//
//  model.swift
//  hw20
//
//  Created by Нурдаулет on 15.11.2023.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let name: String
    let price: Int
    let zhanbil: Int

    private enum CodingKeys : String, CodingKey {
        case id, name, price
        case zhanbil = "has_discount"
    }
}
