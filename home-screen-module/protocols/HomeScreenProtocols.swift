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
}

protocol PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter:InteractorToPresenterHomeScreenProtocol? {get set}
    
    func getFoodList()
    
}

//Taşıyıcı protocoller
protocol InteractorToPresenterHomeScreenProtocol {
    func sendDataToPresenter(foodList:Array<Yemekler>)
}

protocol PresenterToViewHomeScreenProtocol {
    func sendDataToView(foodList:Array<Yemekler>)
}

//Router
protocol PresenterToRouterHomeScreenProtocol {
    static func createModule(ref:HomeScreenViewController)
}

