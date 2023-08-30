//
//  CategoryViewController.swift
//  RealmKaikeibo
//
//  Created by 浦山秀斗 on 2023/08/30.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var categories: Array<Category> = []
    var selectedCategory: Category? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate   = self
        categories = readCategory()
        // Do any additional setup after loading the view.
    }
    
    private func readCategory() -> Array<Category>{
        Array(realm.objects(Category.self))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemView" {
            let itemViewController = segue.destination as! ItemViewController
            itemViewController.selectedCategory = self.selectedCategory!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        categories = readCategory()
        tableView.reloadData()
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        cell.textLabel?.text = categories[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "toItemView", sender: nil)
    }
    
    
}
