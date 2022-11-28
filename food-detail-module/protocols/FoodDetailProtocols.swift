//
//  FoodDetailProtocols.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 22.09.2022.
//

import Foundation

//TODO: Sepete Ekle
//TODO: Eklenen Yemekleri Sepette Göster

protocol ViewToPresenterFoodDetailProtocol {
    var foodDetailInteractor:PresenterToInteractorFoodDetailProtocol? {get set}
    var foodDetailView:PresenterToViewFoodDetailProtocol? {get set}
    
    func addToBasket(food: Yemekler, orderCount: Int, user: String)
}

protocol PresenterToInteractorFoodDetailProtocol {
    var foodDetailPresenter:InteractorToPresenterFoodDetailProtocol? {get set}
    
    func addToBasket(food: Yemekler, orderCount: Int, user: String)
    
}

//Taşıyıcı protocoller
protocol InteractorToPresenterFoodDetailProtocol {
    func sendDataToPresenter(message: String)
}

protocol PresenterToViewFoodDetailProtocol {
    func sendDataToView(message: String)
}

//Router
protocol PresenterToRouterFoodDetailProtocol {
    static func createModule(ref:FoodDetailViewController)
}
