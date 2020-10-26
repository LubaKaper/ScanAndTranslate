//
//  ViewController.swift
//  ScanAndTranslate
//
//  Created by Liubov Kaper  on 10/26/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class ScannerViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var transatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func cameraButton(_ sender: UIButton) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
          let alert = UIAlertController(title: "No camera", message: "This device does not support camera.", preferredStyle: .alert)
          let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
          alert.addAction(ok)
          self.present(alert, animated: true, completion: nil)
          return
        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func libraryButton(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            let alert = UIAlertController(title: "no photos", message: "This device does not support photos.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return
        }
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
}

extension ScannerViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // dismiss the picker controller
        dismiss(animated: true)
        
        //guard unwrap imagepicker
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("could not load image")
        }
        // set the picked image to UIImageView
        imageView.image = image
    }
    
}

