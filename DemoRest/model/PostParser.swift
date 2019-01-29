//
//  PostParser.swift
//  DemoRest
//
//  Created by mobapp11 on 29/01/2019.
//  Copyright © 2019 mobapp11. All rights reserved.
//

import Foundation

class PostParser {
    
    static func getAllPosts () -> [UserPost]{
        //op welk adres staat de data?
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")!
        //starten lege array
        var posts = [UserPost]()
        //indien iets faalt zoals geen verbinding, verkeerde data, ...
        do {
            //ruwe data van url binnenhalen
            let data = try Data.init(contentsOf: url)
            //voorlopige test, komt er iets binnen?
            print(data)
            //data start met een array, data laten omzetten naar array van objecten (NSObject is root element van alles)
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            
            //array overlopen
            for item in jsonArray {
                //value for key, geeft een generiek object terug, moeten we nog casten
                let id = item.value(forKey: "id") as! Int
                let userId = item.value(forKey : "userId") as! Int
                let title = item.value(forKey : "title") as! String
                let body = item.value(forKey : "body") as! String
                
                let currentPost = UserPost.init(id: id, userId: userId, title: title, body: body )
                
                //posts += currentPost kan ook
                posts.append(currentPost)
            }
            
            
        } catch {
            print (" \'t werkt niet")
        }
        
        return posts
        
    }
    
    static func userById(userId:Int) -> String {
        
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/users/\(userId)")!
        
        do{
            let data = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: data) as! NSObject
            let userName = jsonObject.value(forKey: "username") as! String
            return userName
            
        } catch {
            return "404 Not Found"
        }
    }
    
    
}


