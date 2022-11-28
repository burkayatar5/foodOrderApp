//
//  FoodDetailRouter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 22.09.2022.
//

import Foundation

class FoodDetailRouter : PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailViewController) {
        let presenter = FoodDetailPresenter()
        //View
        ref.foodDetailPresenterObject = presenter
        //Presenter
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
        ref.foodDetailPresenterObject?.foodDetailView = ref
        //Interactor
        ref.foodDetailPresenterObject?.foodDetailInteractor?.foodDetailPresenter = presenter
    }
}
