//
//  BasketRouter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.11.2022.
//

import Foundation

class BasketRouter: PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketViewController) {
        let presenter = BasketPresenter()
        //View
        ref.basketPresenterObject = presenter
        //Presenter
        ref.basketPresenterObject?.basketInteractor = BasketInteractor()
        ref.basketPresenterObject?.basketView = ref
        //Interactor
        ref.basketPresenterObject?.basketInteractor?.basketPresenter = presenter
    }
}

