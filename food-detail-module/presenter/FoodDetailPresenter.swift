//
//  FoodDetailPresenter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 22.09.2022.
//

import Foundation

class FoodDetailPresenter : ViewToPresenterFoodDetailProtocol {
    var foodDetailInteractor: PresenterToInteractorFoodDetailProtocol?
    
    var foodDetailView: PresenterToViewFoodDetailProtocol?
    
    func addToBasket(food: Yemekler, orderCount: Int, user: String) {
        foodDetailInteractor?.addToBasket(food: food, orderCount: orderCount, user: user)
    }
    
}

extension FoodDetailPresenter : InteractorToPresenterFoodDetailProtocol {
    func sendDataToPresenter(message: String) {
        foodDetailView?.sendDataToView(message: message)
    }
}
