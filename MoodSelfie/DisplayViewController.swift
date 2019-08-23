//
//  DisplayViewController.swift
//  MoodSelfie
//
//  Created by Vijaya Madhavi on 14/11/18.
//  Copyright © 2018 Vijaya Madhavi. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var moodNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var moodNumberText: String = ""
    var displayImage = UIImage()
    let todaysDate = Date()
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        displayImageView.image = displayImage
        moodNumberLabel.text = moodNumberText
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        dateLabel.text = formatter.string(from: todaysDate)
        
    }
    
    // Save the picture to camera roll
    
    @IBAction func savePhoto(_ sender: AnyObject) {
        
       toolbar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let resultImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(resultImage, nil, nil, nil)
        
        let controller = UIAlertController(title: "", message: "Photo saved.", preferredStyle: .actionSheet)
        
        let popover = controller.popoverPresentationController
        popover?.sourceView = view
        popover?.sourceRect = CGRect(x: 32, y: 32, width: 64, height: 64)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            action in self.navigationController?.popViewController(animated: true)
        }
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
    
}
