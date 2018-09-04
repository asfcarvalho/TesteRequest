//
//  TableViewController.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 03/09/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation
import UIKit

public protocol NATableViewControllerDelegate {
    func selectRow(card: Card?)
    func initLoading()
    func endLoading()
}

public class NATableViewController: UITableView {
    
    var presenter: CardsPresenter?
    var listCard: CardResponse?
    public var Delegate: NATableViewControllerDelegate?
    var uri: String?
    
    //MARK: Init with presenter
    public init(uri: String, frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        print("frame: \(frame)")
        self.uri = uri
        self.delegate = self
        self.dataSource = self
        self.register(UINib.init(nibName: "CellTesteCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
    }
    
    //MARK: Init with presenter
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setupTableView()
    }
    
    public func setupTableView() {
        presenter = CardsPresenter()
        presenter?.Delegate = self
        Delegate?.initLoading()
        
        self.presenter?.listCards(uri: self.uri ?? "")
    }
}

//MARK: Table View Data Source
extension NATableViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let list = listCard?.response {
            Delegate?.selectRow(card: list[indexPath.row])
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("list count: " + (listCard?.response?.count ?? 0).description)
        return listCard?.response?.count ?? 0
    }
}

//MARK: Table View Delegate
extension NATableViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.dequeueReusableCell(withIdentifier: "cell") as? CellTesteCell {
            print("cell success")
            return cell
        }else {
            print("cell failure")
            return UITableViewCell()
        }
//        if let cell = self.dequeueReusableCell(withIdentifier: "cell") as? CardTableViewCell {
//            cell.setupTable(card: listCard?.response?[indexPath.row])
//            return cell
//        }else {
//            return UITableViewCell()
//        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: Cards Presenter delegate
extension NATableViewController: CardsPresenterDelegate {
    func listCardSuccess(listCard: CardResponse?) {
        self.listCard = listCard
        self.reloadData()
        Delegate?.endLoading()
    }
    
    func listCardFailure(message: String?) {
        print("Error: " + (message ?? "Erro lista card"))
        Delegate?.endLoading()
    }
}
