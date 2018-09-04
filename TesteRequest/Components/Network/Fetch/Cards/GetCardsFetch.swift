//
//  GetCardsFetch.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation

class GetCardsFetch: GetRequest {
    
    init(uri: String) {
        super.init(endpoint: uri)
    }
    
    func get(success: anyObjectResponse?, failure: defaultResponse? = nil) {
        super.get().responseJSON { request in
            if request.result.isSuccess {
                success?(request.result.value, "Cards listados com sucesso")
            }else{
                failure?("Erro", "Erro ao listar cards")
            }
        }
    }
}
