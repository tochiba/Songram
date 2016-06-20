//
//  Tag.swift
//  Songram
//
//  Created by 千葉 俊輝 on 2016/05/03.
//  Copyright © 2016年 Toshiki Chiba. All rights reserved.
//

import Foundation
import NCMB

class Tag: NCMBObject, NSCoding {
    
    class func className() -> String {
        return "Tag"
    }
    var id: String = "" {
        didSet {
            self.setObject(id, forKey: TagKey.id)
        }
    }
    var name: String = "" {
        didSet {
            self.setObject(name, forKey: TagKey.name)
        }
    }
    
    override init() {
        super.init(className: Tag.className())
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(className: Tag.className())
        
        if let i = aDecoder.decodeObject(forKey: TagKey.id) as? String {
            self.id = i
            self.setObject(i, forKey: TagKey.id)
        }
        if let n = aDecoder.decodeObject(forKey: TagKey.name) as? String {
            self.name = n
            self.setObject(n, forKey: TagKey.name)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: TagKey.id)
        aCoder.encode(name, forKey: TagKey.name)
    }
}

struct TagKey {
    static let id: String            = "id"
    static let name: String          = "name"
}
