//
//  DetailViewController.swift
//  AppPogodka
//
//  Created by MacBook on 31.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var citiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageChange: UIImageView!
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    
    @IBOutlet weak var buttonCell: UIButton!
    @IBOutlet weak var buttonCellTemp: UIButton!
    @IBOutlet weak var buttonCellTempTwo: UIButton!
    @IBOutlet weak var buttonCellThree: UIButton!
    
    @IBOutlet weak var buttonCellFour: UIButton!
    @IBOutlet weak var buttonCellFive: UIButton!
    @IBOutlet weak var buttonCellSix: UIButton!
    @IBOutlet weak var buttonCellSeven: UIButton!
    @IBOutlet weak var buttonCellEight: UIButton!
    @IBOutlet weak var buttonCellNine: UIButton!
    
    @IBOutlet weak var imageCloudAnime: UIImageView!
    
    @IBOutlet weak var detailValuteButton: UIButton!
    
var networkWeatherManager = NetworkWeatherManager()
    var audioPlay = DetailMusic()
    var city: String!
    var sunsetTwo: String!
    var sunriseTwo: String!
    var descriptionWeather: String!
    var temperature: String!
    
    var feelsLike = ""
    var visibility = ""
    var minTemp = ""
    var maxTemp = ""
    var pressure = ""
    var humidity = ""
    var iconName = ""
    var speedWind = ""
    var degWind = ""
    var gustWind = ""
    var all = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateClouds()
        detailValuteButton.layer.cornerRadius = 15
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
            
    }
        
//        networkWeatherManager.onCompletion = { [weak self] destinationData in
//            guard let self = self else { return }
//            self.updateInterfaceWith(weather: destinationData)
//        }
        self.networkWeatherManager.fetchCurrentWeather(forCity: "Minsk")
//        "\(town.cityLabel)"
    }
    
    // Music Button
    @IBAction func buttonCellAct(_ sender: Any) {
       audioPlay.audioDetailFeelsLike()

    }

    @IBAction func buttonCellClouds(_ sender: Any) {
        audioPlay.audioDetailClouds()
    }
    
    @IBAction func buttonCellPressure(_ sender: Any) {
        audioPlay.audioDetailPressure()
    }
    @IBAction func buttonCellHumidity(_ sender: Any) {
        audioPlay.audioDetailHumidity()
    }
    @IBAction func buttonCellSpeedWind(_ sender: Any) {
        audioPlay.audioDetailSpeedWind()
    }
    
    @IBAction func buttonCellDegWind(_ sender: Any) {
        audioPlay.audioDetailDegWind()
    }
    @IBAction func buttonCellGustWind(_ sender: Any) {
        audioPlay.audioDetailGustWind()
    }
    
    @IBAction func buttomCellValute(_ sender: Any) {
        audioPlay.audioDetailKursValute()
    }
    
    @IBAction func buttonCellEnd(_ sender: Any) {
        audioPlay.audioDetailEnd()
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            
            self.citiLabel.text = self.city
            self.descriptionLabel.text = self.descriptionWeather
            self.sunrise.text = self.sunriseTwo
            self.sunset.text = self.sunsetTwo
            self.temperatureLabel.text = self.temperature + "\(simbolGradus)"
            self.imageChange.image = UIImage(systemName:weather.systemIconNameString)
            self.buttonCell.setTitle("Ощущается как \(self.feelsLike). Подробнее", for: .normal)
            self.buttonCellTemp.setTitle("Минимальная температура \(self.minTemp). Подробнее", for: .normal)
            self.buttonCellTempTwo.setTitle("Максимальная температура \(self.maxTemp). Подробнее", for: .normal)
            self.buttonCellThree.setTitle("Облачность: \(weather.allAppString). Подробнее", for: .normal)
            self.buttonCellFour.setTitle("Атмосферное давление \(self.pressure)Подробнее", for: .normal)
            self.buttonCellFive.setTitle("Влажность \(self.humidity). Подробнее", for: .normal)
            self.buttonCellSix.setTitle("Скорость ветра \(weather.speedWindString). Подробнее", for: .normal)
            self.buttonCellSeven.setTitle("Направление ветра \(weather.degWindString). Подробнее", for: .normal)
            self.buttonCellEight.setTitle("Порыв ветра \(weather.gustWindString). Подробнее", for: .normal)
            self.buttonCellNine.setTitle("Видимость \(self.visibility). Подробнее", for: .normal)
            //            self.labelMaxTemp.text = weather.maxTempString
            //            self.labelMinTemp.text = weather.minTempString
        }
     }
    
    func animateClouds() -> Bool {
        UIImageView.animate(withDuration: 20,
                            delay: 0,
                            options: [.curveLinear, .autoreverse,  .repeat, .allowAnimatedContent],
                            animations: {
                                self.imageCloudAnime.frame.origin.x = 5
                                
                            })
        return true
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let mdvc = segue.destination as? MDFeelsLikeVC else {return}
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }
    
      
        



 
}
