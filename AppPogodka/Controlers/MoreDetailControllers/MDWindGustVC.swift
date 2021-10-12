//
//  MDWindGustVC.swift
//  AppPogodka
//
//  Created by MacBook on 10.06.2021.
//

import UIKit

class MDWindGustVC: UIViewController {

    @IBOutlet weak var imageWindGust: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadImage()
    }
    

    func downloadImage() {
        let imageSource = "https://gubdaily.ru/wp-content/uploads/2019/10/veter.jpg"
        if let url = URL(string: imageSource) {
            URLSession.shared.dataTask(with: url) { (data, responce, error) in
                if let error = error {
                    print(error)
                } else {
                    if let data = data,
                       let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageWindGust.image = image
                        }
                    }
                }
            }.resume()
        }
        
        
    }

}
