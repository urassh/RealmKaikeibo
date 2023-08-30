//
//  ViewController.swift
//  RealmKaikeibo
//
//  Created by 浦山秀斗 on 2023/08/30.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController {

    let realm = try! Realm();
    @IBOutlet var tableView: UITableView!
    var items: Array<ShoppingItem> = []
    var selectedCategory: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItem()
        navigationItem.title = selectedCategory.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItem()
        tableView.reloadData()
    }
    
    private func readItem() -> Array<ShoppingItem> {
        Array(realm.objects(ShoppingItem.self).filter("category == %@", selectedCategory!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewItemView" {
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectedCategory!
        }
    }

}

extension ItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        
        return cell
    }
    
    
}

