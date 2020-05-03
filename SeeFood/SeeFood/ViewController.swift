//
//  ViewController.swift
//  SeeFood
//
//  Created by ryo on 2020/05/02.
//  Copyright © 2020 ryo. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstResultLabel: UILabel!
    @IBOutlet weak var secondResultLabel: UILabel!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        firstResultLabel.text = "take a photo"
        
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("UIImageをCIImageに変換できませんでした。")
            }
            
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("画像を処理できませんでした。")
            }
            
            if let firstResult = results.first {
                let firstIndebtfier = String(firstResult.identifier)
                let firstConfidence = (round(firstResult.confidence * 1000) / 10)
                self.firstResultLabel.text = ("\(firstIndebtfier):\(firstConfidence)%")
            }
            
            let secondResult: VNClassificationObservation = results[1]
            let secondIndebtfier = String(secondResult.identifier)
            let secondConfidence = (round(secondResult.confidence * 1000) / 10)
            self.secondResultLabel.text = ("\(secondIndebtfier):\(secondConfidence)%")
            
            print("===============================")
            print(results[0])
            print("===============================")
            print(results[1])
            print("===============================")
            print(results[2])
            print("===============================")
            print(results[3])


        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
}
