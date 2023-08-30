//
//  NewItemViewController.swift
//  RealmKaikeibo
//
//  Created by 浦山秀斗 on 2023/08/30.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!

    let realm = try! Realm();
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        guard let titleText = titleTextField.text else { return }
        guard let priceText = priceTextField.text else { return }
        let price = Int(priceText) ?? 0
        
        let item = ShoppingItem()
        item.title = titleText
        item.price = price
        item.isMarked = markSwitch.isOn
        item.category = category
        
        createItem(item: item)
        self.dismiss(animated: true)
    }
    
    func createItem(item: ShoppingItem) {
        try! realm.write({
            realm.add(item)
        })
    }
}
