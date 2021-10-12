//
//  StartGifViewController.swift
//  AppPogodka
//
//  Created by MacBook on 29.05.2021.
//

import UIKit

class StartGifViewController: UIViewController {

    @IBOutlet weak var imageGiv: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageIconPogoda: UIImageView!
    @IBOutlet weak var imageIconValute: UIImageView!
    
    @IBOutlet weak var labelValute: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
    var audioPlay = StartMusic()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageIconPogoda.layer.cornerRadius = 12
        imageIconValute.layer.cornerRadius = 12
        imageGiv.loadGif(name: "Дождь3")
        audioPlay.audioStartRain().self
        navigationController?.setNavigationBarHidden(true, animated: false)
        animOutOne()
        animateClouds()
    }
    
    @IBAction func buttonStartGrom(_ sender: UIButton) {
        destination()
        audioPlay.audioStartGrom()
//        performSegue(withIdentifier: "ShowPogoda", sender: nil)
           
}
    
    func animOutOne() -> Bool {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.8
        
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = Float.greatestFiniteMagnitude
      startButton.layer.add(pulse, forKey: nil)
        return true
    }
    
    
    func animateClouds() -> Bool {
        UIImageView.animate(withDuration: 10,
                            delay: 0,
                            options: [.curveLinear,    .allowAnimatedContent],
                            animations: {
                                self.imageIconPogoda.frame.origin.x = -500
                                self.imageIconValute.frame.origin.x = 700
                                self.labelValute.frame.origin.x = 700
//                                      transform.d = 23
                            })
        UIImageView.animate(withDuration: 60,
                            delay: 20,
                            options: [.curveLinear,    .allowAnimatedContent],
                            animations: {
                                
                                self.imageIconPogoda.transform.d = 5
//                                self.imageIconPogoda.transform.ty = 200
                                self.imageIconValute.transform.d = 5
//                                self.imageIconValute.transform.ty = 200
                                self.labelValute.transform.d = 5
//                                      transform.d = 23
                            })
        UIImageView.animate(withDuration: 60,
                            delay: 30,
                            options: [.curveLinear,    .allowAnimatedContent],
                            animations: {
                                
//                                self.imageIconPogoda.transform.d = 5
                                self.imageIconPogoda.transform.ty = 100
//                                self.imageIconValute.transform.d = 5
                                self.imageIconValute.transform.ty = 100
//                                self.labelValute.transform.d = 5
                                self.labelValute.transform.ty = 100
//                                      transform.d = 23
                            })
        
        UIImageView.animate(withDuration: 60,
                            delay: 50,
                            options: [.curveLinear,    .allowAnimatedContent],
                            animations: {
                                
                              
                                self.labelTitle.transform.d = 5
                                  
                            })

        return true
    }
    
    func destination() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:"ViewController") as? ViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let vc = segue.destination as? ViewController else {return}
//
//
//    }
}
    
    



