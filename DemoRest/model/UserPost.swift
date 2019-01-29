//
//  UserPost.swift
//  DemoRest
//
//  Created by mobapp11 on 29/01/2019.
//  Copyright © 2019 mobapp11. All rights reserved.
//

import Foundation

class UserPost {
    
    var id:Int
    var userId:Int
    var title:String
    var body:String
    
    init(id:Int, userId:Int, title:String, body:String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        
    }
    
}
