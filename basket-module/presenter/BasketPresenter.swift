//
//  BasketPresenter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.11.2022.
//

import Foundation

class BasketPresenter : ViewToPresenterBasketProtocol {
    var basketInteractor: PresenterToInteractorBasketProtocol?
    var basketView: PresenterToViewBasketProtocol?
    
    func retrieveBasket(user: String) {
        basketInteractor?.retrieveBasket(user: user)
    }
    
    func deleteItemFromBasket(id: Int, user: String) {
        basketInteractor?.deleteItemFromBasket(id: id, user: user)
    }
}

extension BasketPresenter : InteractorToPresenterBasketProtocol {
    func sendDataToPresenter(basketFoodList: Array<BasketFoods>) {
        basketView?.sendDataToView(basketFoodList: basketFoodList)
    }
}
