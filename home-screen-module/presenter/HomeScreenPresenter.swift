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
}

extension HomeScreenPresenter : InteractorToPresenterHomeScreenProtocol {
    func sendDataToPresenter(foodList: Array<Yemekler>) {
        homeScreenView?.sendDataToView(foodList: foodList)
    }
}
