//
//  CardTypeEnum.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 04/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation


enum CardTypeEnum: String {
    case Title = "TITLE"
    case Text = "TEXT"
    case Video = "VIDEO"
    
    func type() -> String {
        return self.rawValue
    }
    
}
