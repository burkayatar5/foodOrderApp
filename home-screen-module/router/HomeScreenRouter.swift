//
//  HomeScreenRooter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 20.09.2022.
//

import Foundation

class HomeScreenRouter : PresenterToRouterHomeScreenProtocol {
    static func createModule(ref: HomeScreenViewController) {
        let presenter = HomeScreenPresenter()
        //View
        ref.homeScreenPresenterObject = presenter
        //Presenter
        ref.homeScreenPresenterObject?.homeScreenInteractor = HomeScreenInteractor()
        ref.homeScreenPresenterObject?.homeScreenView = ref
        //Interactor
        ref.homeScreenPresenterObject?.homeScreenInteractor?.homeScreenPresenter = presenter
    }
}
