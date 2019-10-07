//
//  addPhotoEntryViewController.swift
//  photoJournal
//
//  Created by hildy abreu on 10/7/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import UIKit

class addPhotoEntryViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        savedPhotos()
        
    }
    
    @IBOutlet weak var photoTextView: UITextView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    

    
    @IBAction func photoLibraryPressed(_ sender: UIBarButtonItem) {
        let image = UIImagePickerController()
        image.delegate = self

        image.sourceType = UIImagePickerController.SourceType.photoLibrary

        self.present(image, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            photoImageView.image = image
        } else {
            print("Error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
func savedPhotos(){
guard let photoDescriptionText = photoTextView.text else {return}

    guard let image = photoImageView.image else { return}
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
    let newPhoto = Photo(description: photoDescriptionText, image: imageData, date: Photo.getDate(), id: Photo.getIDForNewPhoto())
    
    do {
            try? PhotosPersistenceHelper.manager.savePhoto(photo: newPhoto)
        }

        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }


}
