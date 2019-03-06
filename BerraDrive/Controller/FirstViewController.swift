//
//  FirstViewController.swift
//  BerraDrive
//
//  Created by George on 11/15/18.
//  Copyright © 2018 Tyler Harriott. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController{
    
    //Variables
    @IBOutlet weak var currentLabel: UILabel!
    var count : Int = 0
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        if count == 0 {
            currentLabel.text = UserDefaults.standard.string(forKey: "FloorKey")
            let tabbar = tabBarController as! MyTabBarController
            
            if let coding = UserDefaults.standard.string(forKey: "FloorKey"){
                tabbar.theValue = coding
            }
            count = count + 1
        }
            
        else {
            let tabbar = tabBarController as! MyTabBarController
            currentLabel.text = tabbar.theValue
        }
        
    }
 
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    
    
    
}
