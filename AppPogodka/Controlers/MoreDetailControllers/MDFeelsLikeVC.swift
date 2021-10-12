//
//  MDFeelsLikeVC.swift
//  AppPogodka
//
//  Created by MacBook on 10.06.2021.
//

import UIKit

class MDFeelsLikeVC: UIViewController {

    @IBOutlet weak var imageFeelsLike: UIImageView!
    
//    var networkImage = NetworkImageManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage()
    }
          
    
    
    
    
    func downloadImage() {
        let imageSource = "https://bracatus.com/wp-content/uploads/2020/08/balcony-2798760.jpg"
        if let url = URL(string: imageSource) {
            URLSession.shared.dataTask(with: url) { (data, responce, error) in
                if let error = error {
                    print(error)
                } else {
                    if let data = data,
                       let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageFeelsLike.image = image
                        }
                    }
                }
            }.resume()
        }
        
        
    }
    
        
    

}
    







    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
