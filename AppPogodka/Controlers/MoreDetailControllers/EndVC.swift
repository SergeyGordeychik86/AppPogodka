//
//  EndVC.swift
//  AppPogodka
//
//  Created by MacBook on 12.08.2021.
//

import UIKit

class EndVC: UIViewController {
    
    @IBOutlet weak var myDescriptionLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        animate(newText: " Hello, my name is Sergey Gordeychik and I am IOS developer.This application was made by me when I graduated from the IT school. In this application, I have combined the weather API and currency exchange rates. It took about a month to develop this application, exclusively in the evenings.You know, I wanted to make an unusual application. In it, I used the AVAudioPlayer method, and added music to the application for some actions (soundtracks from the movie Chappy). I also added animation to the starting controllers: flying clouds, a flying bird (it was made from a picture, GIF format.). I also added sound effects to some buttons", characterDelay: 0.03)
        
                
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func animate(newText: String, characterDelay: TimeInterval) {

        DispatchQueue.main.async {

            self.myDescriptionLabel.text = ""
            
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(Int(index))) {
                    self.myDescriptionLabel.text?.append(character)
                }
            }
        }
    

}
}

