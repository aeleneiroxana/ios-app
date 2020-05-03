//
//  EventsCollectionViewController.swift
//  SteerUp
//
//  Created by user169235 on 5/3/20.
//  Copyright © 2020 roxaelenei. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "EventCell"

private var dbData: [NSManagedObject]!


class EventsCollectionViewController: UICollectionViewController {
    
    var filterCode = 0
    var oddCellColor : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var format = ""
        if filterCode == 1{
            format = "isRenewable = 1"
        }
        if filterCode == 2{
            format = "isRenewable = 0"
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
        
        let sortDescriptor = NSSortDescriptor(key:"eventDate", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        request.returnsObjectsAsFaults = false
        if format != "" {
            let predicate = NSPredicate(format: format)
            request.predicate = predicate
        }
        do{
            dbData = try context.fetch(request) as? [NSManagedObject]
        }
        catch{
            print("Failed")
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dbData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if indexPath.row.isMultiple(of: 2) == false{
            
            cell.backgroundColor = UIColor.init(red: 201/255, green: 206/255, blue: 232/255, alpha: 1)
        }
        
        // Configure the cell
        if let titleLabel = cell.viewWithTag(100) as? UILabel {
            titleLabel.text = dbData[indexPath.row].value(forKey: "title") as? String
        }
        if let descriptionLabel = cell.viewWithTag(101) as? UILabel {
            descriptionLabel.text = dbData[indexPath.row].value(forKey: "eventDescription") as? String
        }
        if let dateLabel = cell.viewWithTag(102) as? UILabel {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            let eventDate = dbData[indexPath.row].value(forKey: "eventDate") as! Date
            let strDate = dateFormatter.string(from: eventDate)
            dateLabel.text =  strDate
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
