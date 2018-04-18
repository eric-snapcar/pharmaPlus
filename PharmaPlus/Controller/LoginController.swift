//
//  LoginController.swift
//  PharmaPlus
//
//  Created by Eric Hth on 15/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import UIKit

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
    /*
    func saveImage( filepath: String, image : UIImage, _ completion: @escaping (_ metadata_: FIRStorageMetadata?,_ error_: Error?)->Void){
        var data = Data()
        data = UIImageJPEGRepresentation(image, 0.8)!
        // set upload path
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpg"
        let storage = FIRStorage.storage()
        let storageRef = storage.reference()
        storageRef.child(filepath).put(data, metadata: metaData) { (metaData, error) in
            completion(metaData, error)
        }
    }
     */
}
