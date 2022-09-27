//
//  HomeScreenViewController.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 19.09.2022.
//

import UIKit
import Kingfisher

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var foodListCollectionView: UICollectionView!
    
    var foodList = [Yemekler]()
    var homeScreenPresenterObject:ViewToPresenterHomeScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodListCollectionView.delegate = self
        foodListCollectionView.dataSource = self
        
        setCollectionViewDesign(with: foodListCollectionView)
        
        HomeScreenRouter.createModule(ref: self)
        //TODO: Change later to something that makes sense!
        self.navigationItem.title = "Hello"
    }
    
   //MARK: - is this part necessary? 
    override func viewWillAppear(_ animated: Bool) {
        homeScreenPresenterObject?.loadFoodList()
        //Anasayfaya dönüldüğünde sayfamıza tüm kişileri getirecek.
    }
    
    func setCollectionViewDesign(with collectionView: UICollectionView){
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 8
        design.minimumLineSpacing = 8
        
        let width = UIScreen.main.bounds.width
        let itemWidth = (width - 30) / 2
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.9)
        
        collectionView.collectionViewLayout = design
    }
}

extension HomeScreenViewController: PresenterToViewHomeScreenProtocol {
    func sendDataToView(foodList: Array<Yemekler>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.foodListCollectionView.reloadData()
        }
    }
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, PickerViewProtocol {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foodList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodsCollectionViewCell
        
        KingFisherSingelton.sharedInstance.getImage(imageName: food.yemek_resim_adi!, imageView: cell.foodImageView)
        cell.foodNameLabel.text = food.yemek_adi!
        cell.foodPriceLabel.text = "\(food.yemek_fiyat!)₺"
        cell.pickerView.reloadAllComponents()
                
        cell.pickerViewProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedFood = foodList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: selectedFood)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let food = sender as? Yemekler {
                let goToVC = segue.destination as! FoodDetailViewController
                goToVC.foodDetail = food
            }
        }
    }
    
    func pickerViewButtonPressed(pickerView: UIPickerView) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }else {
            pickerView.isHidden = true
        }
    }
    
}
