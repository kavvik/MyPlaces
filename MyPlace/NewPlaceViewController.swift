//
//  NewPlaceViewController.swift
//  MyPlace
//
//  Created by a.koziukin on 23.11.2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
     var imageIsChanged = false
    
    
    @IBOutlet var placeName: UITextField!
    @IBOutlet var imagePlace: UIImageView!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var placeLocation: UITextField!
    @IBOutlet var placeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
    }
    
    // MARK: Tabel View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let cameraIcon = UIImage(named: "camera")
            let photoIcon = UIImage(named: "photo")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    
    func saveNewPlace() {
        
        
        
 var image: UIImage?
        
        image = imagePlace.image
        if imageIsChanged {
            image = imagePlace.image
        } else {
            image = UIImage(named: "imagePlaceholder")
        }
        
        let imageData = image?.pngData()
        let newPlace = Place(name: placeName.text!,
                             location: placeLocation.text,
                             type: placeType.text,
                             imageData: imageData)
        StorageManager.saveObject(newPlace)

    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: Text field delegate
extension NewPlaceViewController: UITextFieldDelegate {
    
    
    
    //скрываем клавиатуру по нажатию на Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc private func textFieldChanged() {

        if placeName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

// MARK: Work with image
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(sourse:UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePlace.image = info[.editedImage] as? UIImage
        imagePlace.contentMode = .scaleAspectFill
        imagePlace.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true)
        
        
    }
}


