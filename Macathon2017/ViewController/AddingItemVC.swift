//
//  AddingItemVC.swift
//  Macathon2017
//
//  Created by Nam Phung on 11/11/2017.
//  Copyright © 2017 Duc Le. All rights reserved.
//

extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

import UIKit

class AddingItemVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var servingTextField: UITextField!
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var serviceButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    
    private var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        itemImageView.isUserInteractionEnabled = true
        itemImageView.addGestureRecognizer(tapGestureRecognizer)
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        addDoneButtonOnKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError()
        }
        itemImageView.image = pickedImage
        
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        // Get all info and create a new item to the database
        guard let itemName = itemTextField.text else {
            fatalError()
        }
        guard let time = timeTextField.text else {
            fatalError()
        }
        guard let location = locationButton.currentTitle else {
            fatalError()
        }
        guard let address = addressTextField.text else {
            fatalError()
        }
        guard let price = priceTextField.text else {
            fatalError()
        }
        guard let servings = servingTextField.text else {
            fatalError()
        }
        guard let image = itemImageView.image else {
            fatalError()
        }
        // Scale down the image, because Realm cannot store image larger than 16MB
        let scale_down_image = image.resized(toWidth: 500)
        guard let imageData = UIImagePNGRepresentation(scale_down_image!) else {
            fatalError()
        }
        
        
        var type: ItemType
        var service: ServiceType
        
        switch typeButton.currentTitle! {
        case "Entree":
            type = .entree
        case "Desert":
            type = .desert
        default:
            type = .appertizer
        }
        
        switch serviceButton.currentTitle! {
        case "Pick up":
            service = .pick_up
        case "Eat in":
            service = .eat_in
        default:
            service = .delivery
        }
        
        let newItem = Item(itemName: itemName, price: Double(price)!, location: location, address: address, type: type.rawValue, expectedNumOfServings: Int(servings)!, serviceType: service.rawValue, itemImage: imageData as NSData, time: time)
        itemManager.addNewItem(item: newItem!)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func typeButtonTouched(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Type selection", message: "Please choose the type of your item", preferredStyle: .alert)
        // Here we need to retrieve the data from server to get the list of types of item
        for type in ItemType.allItemTypes {
            let typeAction = UIAlertAction(title: type.rawValue, style: .default, handler: {(actionSender) in
                sender.setTitle(type.rawValue, for: .normal)
            })
            alertController.addAction(typeAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(actionSender) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func serviceButtonTouched(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Service selection", message: "Please choose the type of your item", preferredStyle: .alert)
        // Here we need to retrieve the data from server to get the list of types of item
        for type in ServiceType.allServiceType {
            let typeAction = UIAlertAction(title: type.rawValue, style: .default, handler: {(actionSender) in
                sender.setTitle(type.rawValue, for: .normal)
            })
            alertController.addAction(typeAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(actionSender) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func locationButtonTouched(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Location", message: "Choose a location", preferredStyle: .alert)
        // Here we need to retrieve the data from server to get the list of locations
        let listLocations = ["Macalester", "Saint Paul", "Mineapollis"]
        for location in listLocations {
            let locationAction = UIAlertAction(title: location, style: .default, handler: {(actionSender) in
                sender.setTitle(location, for: .normal)
            })
            alertController.addAction(locationAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(actionSender) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        // Here to server also needs to provide us the corresponding list of item of the chosen location
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Adds the done button to the number pad.
    // Source URL: http://stackoverflow.com/questions/28338981/how-to-add-done-button-to-numpad-in-ios-8-using-swift
    private func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.itemTextField.inputAccessoryView = doneToolbar
        self.timeTextField.inputAccessoryView = doneToolbar
        self.servingTextField.inputAccessoryView = doneToolbar
        self.priceTextField.inputAccessoryView = doneToolbar
        self.addressTextField.inputAccessoryView = doneToolbar
    }
    
    // Gets rid of the number pad when the user hits "Done"
    @objc public func doneButtonAction() {
        self.itemTextField.resignFirstResponder()
        self.timeTextField.resignFirstResponder()
        self.servingTextField.resignFirstResponder()
        self.priceTextField.resignFirstResponder()
        self.addressTextField.resignFirstResponder()
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
