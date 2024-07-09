//
//  ViewController.swift
//  NetTwoView
//
//  Created by Marat Fakhrizhanov on 09.07.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!
    
    var dogImage = Dog(fileSizeBytes: 000, url: "press button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingJSON()
        fetchImage()
    }

    
    
    @IBAction func buttonPressed() {
        parsingJSON()
        fetchImage()
        
    }
    
    func parsingJSON() {
        
        guard let url = URL(string: "https://random.dog/woof.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print( error?.localizedDescription ?? " No error description ")
                return
            }
            do {
                self.dogImage = try JSONDecoder().decode(Dog.self, from: data)
            } catch let error {
                print( error.localizedDescription)
            }
        }.resume()
    }
    
    
    func fetchImage() {
        guard let url = URL(string: dogImage.url) else { return }
        let urlAdress = dogImage.url
        urlLabel.text = urlAdress
             URLSession.shared.dataTask(with: url) { data, response, error in
                 guard let data = data, let response = response else {
                     print(error?.localizedDescription ?? "No error description")
                     return
                 }
                 
                 print(response)
                 
                 guard let image = UIImage(data: data) else { return }
                 
                 DispatchQueue.main.async {
                     self.imageView.image = image
                     
                 }
             }.resume()
         }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sizeVC = segue.destination as? SizeViewController else { return }
        
        sizeVC.doggy = dogImage
    }
    
    
    
    
    
    
}

