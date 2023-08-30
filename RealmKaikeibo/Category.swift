//
//  Category.swift
//  RealmKaikeibo
//
//  Created by 浦山秀斗 on 2023/08/30.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var title: String = ""
}
