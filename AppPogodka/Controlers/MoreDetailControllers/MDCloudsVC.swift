//
//  MDCloudsVC.swift
//  AppPogodka
//
//  Created by MacBook on 10.06.2021.
//

import UIKit

class MDCloudsVC: UIViewController {

    @IBOutlet weak var imageClouds: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage()
    }
    

    func downloadImage() {
        let imageSource = "https://www.vseznaika.org/wp-content/uploads/2016/04/pic-00955.jpg"
        if let url = URL(string: imageSource) {
            URLSession.shared.dataTask(with: url) { (data, responce, error) in
                if let error = error {
                    print(error)
                } else {
                    if let data = data,
                       let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageClouds.image = image
                        }
                    }
                }
            }.resume()
        }
        
        
    }


}
