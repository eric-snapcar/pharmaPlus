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
    fileprivate var email : String? {
        get{
            return emailTextField?.text
        }
    }
    // MARK: @IBOutle
    @IBOutlet weak var testButton: UIButton!
    @IBAction func testButtonTapped(_ sender: Any) {
        print("Test")
        testButtonTapped()
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func onTapLoginButton(_ sender: Any) {
        if let text = emailTextField.text, !text.isEmpty{
            present(imagePicker, animated: true) {
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    // MARK: UIImagePickerControllerDelegate
    func testButtonTapped() {
        /*
        functions.httpsCallable("addMessage").call(["text": inputField.text]) { (result, error) in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                }
                // ...
            }
            if let text = (result?.data as? [String: Any])?["text"] as? String {
                self.resultField.text = text
            }
        }
        */
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) {
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            addCarteVitale(email: email, image: image)
        }
        dismiss(animated: true) {
        }
    }
    // MARK: private
    
    func addCarteVitale( email : String?, image : UIImage ){
        let carteVitaleRef = FirebaseService.reference().child("carte_vitale").childByAutoId()
        let imageStoragePath = "carte_vitale/" + carteVitaleRef.key
        saveImage(filepath: imageStoragePath, image: image)
        carteVitaleRef.setValue(["email":email,"file_path":imageStoragePath])
    }
    func saveImage( filepath: String, image : UIImage ){
        var data = Data()
        data = UIImageJPEGRepresentation(image, 0.8)!
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imageStorageRef = storageRef.child(filepath)
        imageStorageRef.putData(data, metadata: metadata) { (metaData, error) in
            print(metaData)
            print(error)
        }
    }
 
}
