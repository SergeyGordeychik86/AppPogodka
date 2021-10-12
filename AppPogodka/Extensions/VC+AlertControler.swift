//
//  VC+AlertControler.swift
//  AppPogodka
//
//  Created by MacBook on 28.05.2021.
//

import UIKit


extension ViewController {
    func presentAlertSearchAlertC(withTitle title: String?, message: String?, style: UIAlertController.Style,  complitionHandler: @escaping (String) -> Void)  {
        let ac = UIAlertController(title: title, message: message , preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San-Francesko", "Moscow", "New-York", "Стамбул", "America", "Украина", "Польша"]
            tf.placeholder = cities.randomElement()
    }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
                
                let city = cityName.split(separator: " ").joined(separator: "%20")
                complitionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
