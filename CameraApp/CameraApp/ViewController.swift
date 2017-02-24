//
//  ViewController.swift
//  CameraApp
//
//  Created by Manish Kumar on 26/12/16.
//  Copyright © 2016 appface. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var displayImage: UIImageView!
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cameraAction(_ sender: UIButton) {
        
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
        
        picker.allowsEditing = true
            picker.sourceType = .camera
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            picker.cameraCaptureMode = .photo
            present(picker, animated: true, completion: nil)
            picker.cameraDevice  = .front
            picker.showsCameraControls = true
           // picker.cameraDevice = .rear
            _ = picker.cameraOverlayView
        
        }else{
                let alert = UIAlertController(title: "Camera status", message: "Not available", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    

    @IBAction func galleryAction(_ sender: UIButton) {
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        //picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
   
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let choseImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        displayImage.contentMode = .scaleAspectFit
        displayImage.image = choseImage
        dismiss(animated: true, completion: nil)
    }

}

