//
//  ButtonOptionsTableViewCell.swift
//  NACardSDK
//
//  Created by Ruan Gustavo on 30/08/18.
//  Copyright © 2018 Natura. All rights reserved.
//

import UIKit

class ButtonOptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonMaybe: UIButton!
    @IBOutlet weak var buttonOk: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
