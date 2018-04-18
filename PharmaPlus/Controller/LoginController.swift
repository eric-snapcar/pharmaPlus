//
//  LoginController.swift
//  PharmaPlus
//
//  Created by Eric Hth on 15/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import UIKit
import FirebaseStorage
class LoginController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: fileprivate
    fileprivate var imagePicker = UIImagePickerController()
    // MARK: @IBOutle
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func onTapLoginButton(_ sender: Any) {
        present(imagePicker, animated: true) {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) {
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
        }
        dismiss(animated: true) {
        }
    }
    // MARK: private
 
    func saveImage( filepath: String, image : UIImage ){
        var data = Data()
        data = UIImageJPEGRepresentation(image, 0.8)!
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imageStorageRef = storageRef.child("image")
        imageStorageRef.putData(data, metadata: metadata) { (metaData, error) in
 
        }
    }
 
}
