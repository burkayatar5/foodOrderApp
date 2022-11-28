//
//  FoodsCollectionViewCell.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 21.09.2022.
//

import UIKit

protocol PickerViewProtocol {
    //MARK: - to open picker view when the button is pressed
    func pickerViewButtonPressed(pickerView: UIPickerView)
}
protocol AddToCartProtocol {
    func addToCartButtonPressed(button: UIButton, cell: FoodsCollectionViewCell)
}

class FoodsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var addButton: UIButton!
    
    let itemCount:[String] = ["1","2","3","4","5"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isHidden = true
    }
    
    var buttonProtocol: AddToCartProtocol?
    var pickerViewProtocol: PickerViewProtocol?
    var indexPath: IndexPath?
    
    @IBAction func pickerViewButtomPressed(_ sender: Any) {
        pickerViewProtocol?.pickerViewButtonPressed(pickerView: pickerView!)
    }
    
    // TODO: - Write Necessary Protocol
    @IBAction func addToCartButtonPressed(_ sender: Any) {
        buttonProtocol?.addToCartButtonPressed(button: addButton!, cell: self)
    }
}

extension FoodsCollectionViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemCount.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemCount[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valueSelected = itemCount[row] as String
        itemCountLabel.text = valueSelected
        pickerView.isHidden = true
    }
    
}
