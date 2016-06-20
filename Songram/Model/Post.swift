//
//  Post.swift
//  Songram
//
//  Created by 千葉 俊輝 on 2016/05/01.
//  Copyright © 2016年 Toshiki Chiba. All rights reserved.
//

import Foundation
import NCMB

class PostManager {
    static let sharedInstance = PostManager()
}


/**
 
 */
class Post: NCMBObject, NSCoding {
    
    class func className() -> String {
        return "Post"
    }
    
    var id: String = "" {
        didSet {
            self.setObject(id, forKey: PostKey.id)
        }
    }
    var userId: String = "" {
        didSet {
            self.setObject(userId, forKey: PostKey.userId)
        }
    }
    var message: String = "" {
        didSet {
            self.setObject(message, forKey: PostKey.message)
        }
    }
    var comments: String = "" {
        didSet {
            self.setObject(comments, forKey: PostKey.comments)
        }
    }
    var songs: String = "" {
        didSet {
            self.setObject(songs, forKey: PostKey.songs)
        }
    }
    var tags: String = "" {
        didSet {
            self.setObject(tags, forKey: PostKey.tags)
        }
    }
    var likeCount: Int = 0 {
        didSet {
            self.setObject(likeCount, forKey: PostKey.likeCount)
        }
    }
    
    
    override init() {
        super.init(className: Post.className())
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(className: Post.className())
        
        if let i = aDecoder.decodeObject(forKey: PostKey.id) as? String {
            self.id = i
            self.setObject(i, forKey: PostKey.id)
        }
        if let u = aDecoder.decodeObject(forKey: PostKey.userId) as? String {
            self.userId = u
            self.setObject(u, forKey: PostKey.userId)
        }
        if let m = aDecoder.decodeObject(forKey: PostKey.message) as? String {
            self.message = m
            self.setObject(m, forKey: PostKey.message)
        }
        if let c = aDecoder.decodeObject(forKey: PostKey.comments) as? String {
            self.comments = c
            self.setObject(c, forKey: PostKey.comments)
        }
        if let s = aDecoder.decodeObject(forKey: PostKey.songs) as? String {
            self.songs = s
            self.setObject(s, forKey: PostKey.songs)
        }
        if let t = aDecoder.decodeObject(forKey: PostKey.tags) as? String {
            self.tags = t
            self.setObject(t, forKey: PostKey.tags)
        }
        if let l = aDecoder.decodeObject(forKey: PostKey.likeCount) as? Int {
            self.likeCount = l
            self.setObject(l, forKey: PostKey.likeCount)
        }
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: PostKey.id)
        aCoder.encode(userId, forKey: PostKey.userId)
        aCoder.encode(message, forKey: PostKey.message)
        aCoder.encode(comments, forKey: PostKey.comments)
        aCoder.encode(songs, forKey: PostKey.songs)
        aCoder.encode(tags, forKey: PostKey.tags)
        aCoder.encode(likeCount, forKey: PostKey.likeCount)
    }
}

struct PostKey {
    static let id: String               = "id"
    static let userId: String           = "userId"
    static let message: String          = "message"
    static let comments: String         = "comments"
    static let songs: String            = "songs"
    static let tags: String             = "tags"
    static let likeCount: String        = "likeCount"
    /*
    static let categoryName: String    = "categoryName"
    static let date: String            = "date"
    static let title: String           = "title"
    static let descri: String          = "descri"
    static let thumbnailUrl: String    = "thumbnailUrl"
    static let videoUrl: String        = "videoUrl"
    static let likeCount: String       = "likeCount"*/
}


