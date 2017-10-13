//
//  DetailViewController.swift
//  TroutTracker
//
//  Created by Kaley Groskreutz on 7/19/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var dateField: UITextField!
    @IBOutlet var typeField: UITextField!
    @IBOutlet var sizeField: UITextField!
    @IBOutlet var flyField: UITextField!
    @IBOutlet var commentsField: UITextField!
    @IBOutlet var imageField: UIImageView!
    @IBOutlet var locationField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var flyLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        // place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    var item: Item! {
        didSet {
            navigationItem.title = item.title
        }
    }
    var imageStore: ImageStore!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 5
        sizeLabel.layer.masksToBounds = true
        sizeLabel.layer.cornerRadius = 5
        typeLabel.layer.masksToBounds = true
        typeLabel.layer.cornerRadius = 5
        flyLabel.layer.masksToBounds = true
        flyLabel.layer.cornerRadius = 5
        notesLabel.layer.masksToBounds = true
        notesLabel.layer.cornerRadius = 5
        locationLabel.layer.masksToBounds = true
        locationLabel.layer.cornerRadius = 5
        
        dateField.text = item.dateCaught
        typeField.text = item.type
        sizeField.text = item.size
        flyField.text = item.fly
        commentsField.text = item.comments
        locationField.text = item.location
        
        // get the item key
        let key = item.itemKey
        
        // if there is an associated image with the item, display it on the image view
        let imageToDisplay = imageStore.image(forKey: key)
        imageField.image = imageToDisplay
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // clear first responder
        view.endEditing(true)
        
        // save changes to item
        item.type = typeField.text ?? ""
        item.size = sizeField.text ?? ""
        item.fly = flyField.text ?? ""
        item.dateCaught = dateField.text ?? ""
        item.comments = commentsField.text ?? ""
        item.location = locationField.text ?? ""
        item.setTitle()
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // get picked image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // store the image in the image store for the items key
        imageStore.setImage(image, forKey: item.itemKey)
        
        // put that image on the screen in the image view
        imageField.image = image
        
        // take the image picker off the screen, you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
}
