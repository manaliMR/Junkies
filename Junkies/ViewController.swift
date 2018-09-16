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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func FoodplaceOne(_ sender: Any) {
        // TimHortons
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
    @IBAction func FoodplaceTwo(_ sender: Any) {
        // McDonalds
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
    @IBAction func FoodplaceThree(_ sender: Any) {
        // Subway
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
    @IBAction func FoodplaceFour(_ sender: Any) {
        // Burrito
        
        performSegue(withIdentifier: "maps", sender: self)
    }
    
}


