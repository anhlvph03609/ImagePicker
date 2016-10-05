//
//  ViewController.swift
//  UIDemo
//
//  Created by Anh Lê Việt on 10/3/16.
//  Copyright © 2016 Anh Lê Việt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var imagePicked: UIImageView!
    
    @IBOutlet weak var txtImageURL: UITextField!
    
    @IBAction func loadImageFromURL(_ sender: AnyObject) {
        let url:NSURL = NSURL(string: txtImageURL.text!)!
        let dt:NSData = NSData(contentsOf : url as URL)!
        
        imagePicked.image = UIImage(data : dt as Data)
        
          }
    
       let imagePicker = UIImagePickerController()
    
       @IBAction func takePic(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
                   }
          }
    
    @IBAction func selectImage(_ sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)

}
    
   
    
    @IBAction func btnSave(_ sender: AnyObject) {
        let alert = UIAlertController()
        alert.title = "Save"
        alert.message = "Do you want to save this photo rewerwe? "
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:  {(action: UIAlertAction!) in
            let imageData = UIImageJPEGRepresentation(self.imagePicked.image!, 1)
            let compressedJPGImage = UIImage(data: imageData!)
            UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
            let alertView = UIAlertView()
            alertView.title = "Save image"
            alertView.message = "Save image Successfully!"
            alertView.addButton(withTitle: "OK")
            alertView.show()
        }))
        alert.addAction(UIAlertAction(title : "No", style: .default, handler :{(action: UIAlertAction!) in
            
            
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
                imagePicked.contentMode = UIViewContentMode.scaleAspectFit
                imagePicker.delegate = self
                       
              
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        imagePicked.image = selectedImage
        
        dismiss(animated: true, completion: nil)
        //Dismiss the picker.
        
    }
    
      func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

  
}

