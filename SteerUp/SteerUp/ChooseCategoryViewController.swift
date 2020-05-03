//
//  ChooseCategoryViewController.swift
//  SteerUp
//
//  Created by user169235 on 4/26/20.
//  Copyright © 2020 roxaelenei. All rights reserved.
//

import UIKit

class ChooseCategoryViewController: UIViewController {
    
    @IBOutlet weak var allEventsButton: UIButton!
    
    @IBOutlet weak var renewedEventsButton: UIButton!
    
    @IBOutlet weak var oneTimeEventsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        allEventsButton.layer.cornerRadius = 10;
        renewedEventsButton.layer.cornerRadius = 10;
        oneTimeEventsButton.layer.cornerRadius = 10;
        
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
