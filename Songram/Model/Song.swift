//
//  Song.swift
//  Songram
//
//  Created by 千葉 俊輝 on 2016/05/03.
//  Copyright © 2016年 Toshiki Chiba. All rights reserved.
//

import Foundation
import NCMB

class Song: NCMBObject, NSCoding {
    
    class func className() -> String {
        return "Song"
    }
    var id: String = "" {
        didSet {
            self.setObject(id, forKey: SongKey.id)
        }
    }
    var message: String = "" {
        didSet {
            self.setObject(message, forKey: SongKey.message)
        }
    }
    
    override init() {
        super.init(className: Song.className())
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(className: Song.className())
        
        if let i = aDecoder.decodeObject(forKey: SongKey.id) as? String {
            self.id = i
            self.setObject(i, forKey: SongKey.id)
        }
        if let m = aDecoder.decodeObject(forKey: SongKey.message) as? String {
            self.message = m
            self.setObject(m, forKey: SongKey.message)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: SongKey.id)
        aCoder.encode(message, forKey: SongKey.message)
    }
}

struct SongKey {
    static let id: String               = "id"
    static let message: String          = "message"
}

