//
//  PutCardsFetch.swift
//  NACardSDK
//
//  Created by Marcelo Dias on 03/09/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation

class PutCardFetch: PutRequest {
    
    init(uri: String) {
        super.init(endpoint: uri)
    }
    
    func put(success: anyObjectResponse?, failure: defaultResponse? = nil) {
        super.put().responseJSON { request in
            if request.result.isSuccess {
                success?(request.result.value, "Card escondido com sucesso")
            }else{
                failure?("Erro", "Erro ao esconder card")
            }
        }
    }
}
