//
//  Product.swift
//  hw20
//
//  Created by Нурдаулет on 16.11.2023.
//

import Foundation

struct CardInfo: Decodable {
    public var name: String?
    public var manaCost: String?
    public var type: String?
    public var setName: String?
}

struct Card: Decodable {
    public var cards: [CardInfo]
}
