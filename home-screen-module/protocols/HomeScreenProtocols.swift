//
//  HomeScreenProtocols.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 20.09.2022.
//

import Foundation

protocol ViewToPresenterHomeScreenProtocol {
    var homeScreenInteractor:PresenterToInteractorHomeScreenProtocol? {get set}
    var homeScreenView:PresenterToViewHomeScreenProtocol? {get set}
    
    func loadFoodList()
    func addToBasket(food: Yemekler, orderCount: Int, user: String)
}

protocol PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter:InteractorToPresenterHomeScreenProtocol? {get set}
    
    func getFoodList()
    func addToBasket(food: Yemekler, orderCount: Int, user: String)
    
}

//Taşıyıcı protocoller
protocol InteractorToPresenterHomeScreenProtocol {
    func sendDataToPresenter(foodList:Array<Yemekler>)
    func sendResultToPresenter(message: String)
}

protocol PresenterToViewHomeScreenProtocol {
    func sendDataToView(foodList:Array<Yemekler>)
    func sendResultToView(message: String)
}

//Router
protocol PresenterToRouterHomeScreenProtocol {
    static func createModule(ref:HomeScreenViewController)
}

