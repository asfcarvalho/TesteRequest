//
//  CardTableViewCell.swift
//  NACardSDK
//
//  Created by Marcelo Dias on 30/08/18.
//  Copyright © 2018 Natura. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    var card: Card?
    var height: CGFloat = 0
    var presenter: CardsPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        presenter = CardsPresenter()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "header")
        self.tableView.register(UINib.init(nibName: "TextTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "text")
        self.tableView.register(UINib.init(nibName: "VideoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "video")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTable(card: Card?) {
        self.card = card
        
        self.height = card?.height ?? 0
        
        
        self.tableView.reloadData()
    }
    
}

//MARK: Table view data source
extension CardTableViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return card?.metadata?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let metadata = card?.metadata?[indexPath.row]
        
        if metadata?.type == CardTypeEnum.Title.type() {
            let title = tableView.dequeueReusableCell(withIdentifier: "header") as? HeaderTableViewCell
            return title ?? UITableViewCell()
        }
        
        if metadata?.type == CardTypeEnum.Text.type() {
            let text = tableView.dequeueReusableCell(withIdentifier: "text") as? TextTableViewCell
            return text ?? UITableViewCell()
        }
        
        if metadata?.type == CardTypeEnum.Video.type() {
            let video = tableView.dequeueReusableCell(withIdentifier: "video") as? VideoTableViewCell
            return video ?? UITableViewCell()
        }
            
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.presenter?.getCellHeight(type: (card?.metadata?[indexPath.row].type ?? "")) ?? 0
    }
}

//MARK: Table view delegate
extension CardTableViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
