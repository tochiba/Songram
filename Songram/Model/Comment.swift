//
//  Comment.swift
//  Songram
//
//  Created by 千葉 俊輝 on 2016/05/03.
//  Copyright © 2016年 Toshiki Chiba. All rights reserved.
//

import Foundation
import NCMB

class Comment: NCMBObject, NSCoding {
    
    class func className() -> String {
        return "Comment"
    }
    var id: String = "" {
        didSet {
            self.setObject(id, forKey: CommentKey.id)
        }
    }
    var message: String = "" {
        didSet {
            self.setObject(message, forKey: CommentKey.message)
        }
    }
    
    override init() {
        super.init(className: Comment.className())
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(className: Comment.className())
        
        if let i = aDecoder.decodeObject(forKey: CommentKey.id) as? String {
            self.id = i
            self.setObject(i, forKey: CommentKey.id)
        }
        if let m = aDecoder.decodeObject(forKey: CommentKey.message) as? String {
            self.message = m
            self.setObject(m, forKey: CommentKey.message)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: CommentKey.id)
        aCoder.encode(message, forKey: CommentKey.message)
    }
}

struct CommentKey {
    static let id: String               = "id"
    static let message: String          = "message"
}

