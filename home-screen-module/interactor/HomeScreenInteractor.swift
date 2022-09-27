//
//  HomeScreenInteractor.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 20.09.2022.
//

import Foundation
import Alamofire

class HomeScreenInteractor : PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol?
    
    func getFoodList() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            
            if let data = response.data {
                do{
                    let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                    if let foodList = apiResponse.yemekler {
                        self.homeScreenPresenter?.sendDataToPresenter(foodList: foodList)
                        print()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}

//post : webservis bizden değer göndermemizi ister
//get : istemez
