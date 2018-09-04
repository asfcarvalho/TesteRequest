//
//  CardsPresenter.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation
import UIKit

protocol CardsPresenterDelegate {
    func listCardSuccess(listCard: CardResponse?)
    func listCardFailure(message: String?)
}

public class CardsPresenter {
    
    var Delegate: CardsPresenterDelegate?
    
    //MARK: busca todos os cards ou detalhe
    func listCards(uri: String, callBack: @escaping (CardResponse?, String?) -> Void) {
        GetCardsFetch(uri: uri).get(success: { (object, message) in
            if let result = object as? [String: Any] {
                if let resultCards = CardResponse(JSON: result) {
                    if resultCards.baseStatus?.success == true {
                        callBack(resultCards, nil)
                        self.Delegate?.listCardSuccess(listCard: resultCards)
                    }else{
                        callBack(nil, resultCards.baseStatus?.message)
                        self.Delegate?.listCardFailure(message: resultCards.baseStatus?.message)
                    }
                }else{
                    callBack(nil, "Erro ao listar cards")
                    self.Delegate?.listCardFailure(message: "Erro ao listar cards")
                }
            }else{
                callBack(nil, "Erro ao listar cards")
                self.Delegate?.listCardFailure(message: "Erro ao listar cards")
            }
        }) { (object, message) in
            callBack(nil, message ?? "Erro ao listar cards")
            self.Delegate?.listCardFailure(message: message ?? "Erro ao listar cards")
        }
    }
    
    func listCards(uri: String) {
        GetCardsFetch(uri: uri).get(success: { (object, message) in
            if let result = object as? [String: Any] {
                if let resultCards = CardResponse(JSON: result) {
                    if resultCards.baseStatus?.success == true {
                        self.Delegate?.listCardSuccess(listCard: resultCards)
                    }else{
                        self.Delegate?.listCardFailure(message: resultCards.baseStatus?.message)
                    }
                }else{
                    self.Delegate?.listCardFailure(message: "Erro ao listar cards")
                }
            }else{
                self.Delegate?.listCardFailure(message: "Erro ao listar cards")
            }
        }) { (object, message) in
            self.Delegate?.listCardFailure(message: message ?? "Erro ao listar cards")
        }
    }
    
    //MARK: Esconde o card
    func dissmisCard(uri: String, callBack: @escaping (DismissResponse?, String?) -> Void) {
        PutCardFetch(uri: uri).put(success: { (object, message) in
            if let result = object as? [String: Any] {
                if let resultDismiss = DismissResponse(JSON: result) {
                    if resultDismiss.baseStatus?.success == true {
                        callBack(resultDismiss, nil)
                    }else{
                        callBack(nil, resultDismiss.baseStatus?.message)
                    }
                }else{
                    callBack(nil, "Erro ao listar card")
                }
            }else{
                callBack(nil, "Erro ao listar card")
            }
        }) { (object, message) in
            callBack(nil, message ?? "Erro ao esconder card")
        }
    }
    
    
    //MARK: retorna a altura total da celula
    func getCellHeightTotal(card: Card?) -> CGFloat {
        
        var height: CGFloat = 0
        
        if let metadata = card?.metadata {
            for item in metadata {
                height += getCellHeight(type: (item.type ?? ""))
            }
        }
        
        return height
    }
    
    //MARK: retorna a altura das subcelula
    func getCellHeight(type: String) -> CGFloat {
        
        if type == CardTypeEnum.Title.type() {
            return 74
        }else if type == CardTypeEnum.Text.type() {
            return 44
        }else if type == CardTypeEnum.Video.type() {
            return 194
        }
        
        return 0
    }
}
