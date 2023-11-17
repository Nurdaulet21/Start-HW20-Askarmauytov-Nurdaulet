//
//  ViewController.swift
//  hw20
//
//  Created by Нурдаулет on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(cardName: "Black lotus")
        fetchData(cardName: "Ops")
    }

    private func fetchData(cardName: String) {
        guard let url = URL(string: "https://api.magicthegathering.io/v1/cards?name=\(cardName)") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                if let data = data {
                    do {
                        let card = try JSONDecoder().decode(Card.self, from: data)
                        if let myCard = card.cards.first {
                            print("name: \(cardName)")
                            print("type: \(myCard.type ?? "")")
                            print("mana cost: \(myCard.manaCost ?? "")")
                            print("set name: \(myCard.setName ?? "")")
                        } else {
                            fatalError()
                        }
                    } catch {
                        print(String(describing: error))
                    }
                }
            }
        }
        task.resume()
    }

}
