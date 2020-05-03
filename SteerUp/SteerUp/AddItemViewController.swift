//
//  AddItemViewController.swift
//  SteerUp
//
//  Created by user169235 on 4/26/20.
//  Copyright © 2020 roxaelenei. All rights reserved.
//

import UIKit
import CoreData

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    
    @IBOutlet weak var isRenewableSwitch: UISwitch!
    
    @IBOutlet weak var expireDatePicker: UIDatePicker!
    
    @IBOutlet weak var saveEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expireDatePicker.isHidden = true;
        
        saveEventButton.layer.cornerRadius = 10;
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    
    @IBAction func onStateChanged(_ sender: UISwitch) {
        if(isRenewableSwitch.isOn)
        {
            expireDatePicker.isHidden = false;
        }
        else{
            expireDatePicker.isHidden = true;
        }
    }
    
    @IBAction func saveEvent(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Events", in: context)
        
        let newEvent = NSManagedObject(entity: entity!, insertInto: context)
        
        
        newEvent.setValue(UUID(), forKey: "id")
        newEvent.setValue(self.titleTextField.text, forKey: "title")
        newEvent.setValue(self.descriptionTextField.text, forKey:  "eventDescription")
        //newEvent.setValue("", forKey: "photo")
        newEvent.setValue(self.eventDatePicker.date, forKey: "eventDate")
        newEvent.setValue(self.isRenewableSwitch.isOn, forKey: "isRenewable")
        if(self.isRenewableSwitch.isOn)
        {
            newEvent.setValue(self.expireDatePicker.date, forKey: "expireDate")
        }
        do {
            try context.save()
            let alert = UIAlertController(title: "Saved event", message: "This event was added to your log", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.resetView()
            
            self.present(alert, animated: true)
        } catch {
            let alert = UIAlertController(title: "Something went wrong", message: "Please try again later ... :(", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    
    func resetView(){
        self.titleTextField.text = ""
        self.descriptionTextField.text = ""
        self.eventDatePicker.setDate(Date(), animated: false)
        self.isRenewableSwitch.isOn = false
        self.expireDatePicker.setDate(Date(), animated: false)
    }
    
}
