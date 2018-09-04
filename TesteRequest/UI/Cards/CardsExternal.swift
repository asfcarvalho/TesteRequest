//
//  CardsExternal.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation

open class CardsExternal {
    
    public init() {}
    
    public func GetListCards(callBack: @escaping (String?, String?) -> Void) {
//        CardsPresenter.listCards(callBack: callBack)
        callBack("teste","123")
    }
    
}
