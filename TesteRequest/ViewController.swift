//
//  ViewController.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 31/08/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listCard: CardResponse?
    var presenter: CardsPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CardTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        
        presenter = CardsPresenter()
        presenter?.Delegate = self
        presenter?.listCards(uri: "https://motor-cards-v3-212618.appspot.com/card/user/1235")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCard?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CardTableViewCell {
            let item = listCard?.response?[indexPath.row]
            cell.setupTable(card: item)
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return listCard?.response?[indexPath.row].height ?? 0
    }
}

extension ViewController: CardsPresenterDelegate {
    func listCardSuccess(listCard: CardResponse?) {
        self.listCard = listCard
        
        if let response = listCard?.response {
            for card in response {
                card.height = self.presenter?.getCellHeightTotal(card: card) ?? 0
            }
        }
        
        tableView.reloadData()
    }
    
    func listCardFailure(message: String?) {
        print("Error: " + (message ?? ""))
    }
    
    
}

