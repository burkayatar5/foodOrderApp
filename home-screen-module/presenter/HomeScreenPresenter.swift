//
//  HomeScreenPresenter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 20.09.2022.
//

import Foundation

class HomeScreenPresenter : ViewToPresenterHomeScreenProtocol {    
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol?
    var homeScreenView: PresenterToViewHomeScreenProtocol?
    
    func loadFoodList() {
        homeScreenInteractor?.getFoodList()
    }
    func addToBasket(food: Yemekler, orderCount: Int, user: String) {
        homeScreenInteractor?.addToBasket(food: food, orderCount: orderCount, user: user)
    }
}

extension HomeScreenPresenter : InteractorToPresenterHomeScreenProtocol {
    func sendDataToPresenter(foodList: Array<Yemekler>) {
        homeScreenView?.sendDataToView(foodList: foodList)
    }
    func sendResultToPresenter(message: String) {
        homeScreenView?.sendResultToView(message: message)
    }
}
