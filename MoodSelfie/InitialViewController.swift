//
//  InitialViewController.swift
//  MoodSelfie
//
//  Created by Vijaya Madhavi on 14/11/18.
//  Copyright © 2018 Vijaya Madhavi. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var moodNumberLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.isEnabled = false
        
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
      moodNumberLabel.text = String(lroundf(slider.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let displayVC = segue.destination as! DisplayViewController
            displayVC.moodNumberText = moodNumberLabel.text!
            displayVC.displayImage = imageView.image!
        }
    }
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        addButton.isEnabled = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetView(_ sender: UIStoryboardSegue) {
        if sender.source is DisplayViewController {
            imageView.image = nil
            moodNumberLabel.text = ""
        }
    }
}

