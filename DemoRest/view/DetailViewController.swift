//
//  DetailViewController.swift
//  DemoRest
//
//  Created by mobapp11 on 29/01/2019.
//  Copyright © 2019 mobapp11. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var textViewBody: UITextView!
    
    var post:UserPost?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = post!.title
        textViewBody.text = post!.body
        
        let username = PostParser.userById(userId: post!.userId)
        labelUsername.text = username
        
       //title in navbar aanpassen
        self.title = post!.title
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
