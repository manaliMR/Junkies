//
//  ViewController.swift
//  Junkies
//
//  Created by Manali Rami on 2018-09-12.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FoodplaceOne(_ sender: Any) {
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
    @IBAction func FoodplaceTwo(_ sender: Any) {
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
    @IBAction func FoodplaceThree(_ sender: Any) {
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
    @IBAction func FoodplaceFour(_ sender: Any) {
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
}

