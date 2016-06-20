//
//  User.swift
//  Songram
//
//  Created by 千葉 俊輝 on 2016/05/03.
//  Copyright © 2016年 Toshiki Chiba. All rights reserved.
//

import Foundation
import NCMB

class UserManager {
    static let sharedInstance = UserManager()
}

class User: NCMBObject, NSCoding {
    
    class func className() -> String {
        return "User"
    }
    var id: String = "" {
        didSet {
            self.setObject(id, forKey: UserKey.id)
        }
    }
    var name: String = "" {
        didSet {
            self.setObject(name, forKey: UserKey.name)
        }
    }
    var introduction: String = "" {
        didSet {
            self.setObject(introduction, forKey: UserKey.introduction)
        }
    }
    var thumbnailUrl: String = "" {
        didSet {
            self.setObject(thumbnailUrl, forKey: UserKey.thumbnailUrl)
        }
    }
    
    override init() {
        super.init(className: User.className())
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(className: User.className())
        
        if let i = aDecoder.decodeObject(forKey: UserKey.id) as? String {
            self.id = i
            self.setObject(i, forKey: UserKey.id)
        }
        if let n = aDecoder.decodeObject(forKey: UserKey.name) as? String {
            self.name = n
            self.setObject(n, forKey: UserKey.name)
        }
        if let intro = aDecoder.decodeObject(forKey: UserKey.introduction) as? String {
            self.introduction = intro
            self.setObject(intro, forKey: UserKey.introduction)
        }
        if let thumbnail = aDecoder.decodeObject(forKey: UserKey.thumbnailUrl) as? String {
            self.thumbnailUrl = thumbnail
            self.setObject(thumbnail, forKey: UserKey.thumbnailUrl)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: UserKey.id)
        aCoder.encode(name, forKey: UserKey.name)
        aCoder.encode(introduction, forKey: UserKey.introduction)
        aCoder.encode(thumbnailUrl, forKey: UserKey.thumbnailUrl)
    }
}

struct UserKey {
    static let id: String               = "id"
    static let name: String             = "name"
    static let introduction: String     = "introduction"
    static let thumbnailUrl: String     = "thumbnailUrl"
}


