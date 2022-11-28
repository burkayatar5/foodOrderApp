//
//  BasketProtocols.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.11.2022.
//

import Foundation

protocol ViewToPresenterBasketProtocol {
    var basketInteractor:PresenterToInteractorBasketProtocol? {get set}
    var basketView:PresenterToViewBasketProtocol? {get set}
    
    func retrieveBasket(user: String)
    func deleteItemFromBasket(id: Int, user: String)
}

protocol PresenterToInteractorBasketProtocol {
    var basketPresenter:InteractorToPresenterBasketProtocol? {get set}
    
    func retrieveBasket(user: String)
    func deleteItemFromBasket(id: Int, user: String)
}

//Taşıyıcı protocoller
protocol InteractorToPresenterBasketProtocol {
    func sendDataToPresenter(basketFoodList: Array<BasketFoods>)
}

protocol PresenterToViewBasketProtocol {
    func sendDataToView(basketFoodList: Array<BasketFoods>)
}

//Router
protocol PresenterToRouterBasketProtocol {
    static func createModule(ref:BasketViewController)
}
