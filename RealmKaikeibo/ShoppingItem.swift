//
//  ShoppingItem.swift
//  RealmKaikeibo
//
//  Created by 浦山秀斗 on 2023/08/30.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
    @Persisted var category: Category?
}
