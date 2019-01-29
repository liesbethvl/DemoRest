//
//  LoginViewController.swift
//  DemoRest
//
//  Created by mobapp11 on 29/01/2019.
//  Copyright © 2019 mobapp11. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var switchRemember: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //opvragen waarden uit de settings
        let settings = UserDefaults.standard
        textFieldUser.text = settings.string(forKey: "pref_username")
        textFieldPassword.text = settings.string(forKey: "pref_password")
        
        switchRemember.setOn (settings.bool(forKey: "pref_remember"), animated: true)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(textFieldUser.text!.count >= 6 && textFieldPassword.text!.count >= 4) {
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settings = UserDefaults.standard
        if switchRemember.isOn {
            //waarde naar de settings wegschrijven
            settings.set(textFieldUser, forKey: "pref_username")
            settings.set(textFieldPassword, forKey: "pref_password")
        } else {
            settings.set(false, forKey: "pref_remember")
            settings.set("", forKey: "pref_username")
            settings.set("", forKey: "pref_password")
        }
    }
    
    
    
    
    
}
