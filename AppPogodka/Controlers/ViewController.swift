//
//  ViewController.swift
//  AppPogodka
//
//  Created by MacBook on 26.05.2021.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bigTemperatureLabel: UILabel!
    @IBOutlet weak var DetailButtonOUT: UIButton!
    
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var labelMaxTemp: UILabel!
    @IBOutlet weak var labelMinTemp: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var speedWindLabel: UILabel!
    @IBOutlet weak var degWindLabel: UILabel!
    @IBOutlet weak var gustWindLabel: UILabel!
    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var iconNameImage: UIImageView!
    
    //    MARK:-Cloud
    @IBOutlet weak var imageCloudOne: UIImageView!
    @IBOutlet weak var imageCloudTwo: UIImageView!
    @IBOutlet weak var imageCloudThree: UIImageView!
    @IBOutlet weak var imageCloudfour: UIImageView!
    @IBOutlet weak var imageBirdOne: UIImageView!
    
    @IBOutlet weak var buttonDetail: UIButton!
    
    
    var networkWeatherManager = NetworkWeatherManager()
    var audioPlay = StartMusic()
//    var destinationData = DestinationData(feelsLike: "")

    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageBirdOne.loadGif(name: "Птица")
        audioPlay.audioPlayer()
        animOutOne()
        animateClouds()
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
           
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "Minsk")
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
   
    @IBAction func searchTownButton(_ sender: UIButton) {
        self.presentAlertSearchAlertC(withTitle: "Введите название города", message: nil, style: .alert) { [unowned self] city in
            
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }
    }
    
   
    @IBAction func detailStartButton(_ sender: UIButton) {
        destination()
        audioPlay.audioButtomDetail()
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {

        self.cityLabel.text = weather.cityName
        self.bigTemperatureLabel.text = weather.temperatureString + "\(simbolGradus)"
        self.descriptionLabel.text = weather.descriptionForecast
        self.countryLabel.text = weather.countryApp
           
            self.feelsLikeLabel.text = weather.feelslikeTemperatureString
            self.labelMaxTemp.text = weather.maxTempString
            self.labelMinTemp.text = weather.minTempString
            self.sunsetLabel.text = weather.sunsetString
            self.sunriseLabel.text = weather.sunriseString
            self.visibilityLabel.text = weather.visibilityAppString
            self.pressureLabel.text = weather.pressureString
            self.humidityLabel.text = weather.humidityString
            self.speedWindLabel.text = weather.speedWindString
            self.degWindLabel.text = weather.degWindString
            self.gustWindLabel.text = weather.gustWindString
            self.allLabel.text = weather.allAppString
            self.iconNameImage.image = UIImage(systemName:weather.systemIconNameString)
//            self.labelDt.text = weather.dateDtString
//            self.labelMaxTemp.text = weather.maxTempString
//            self.labelMinTemp.text = weather.minTempString
           
//            self.sunsetLabel.text = weather.sunsetString
//            self.sunriseLabel.text = weather.sunriseString
//            self.labelTime.text = weather.dateDtString
//            self.labelTFOut.text = "На данный момент в городе \(weather.cityName)  темрература воздуха составляет \(weather.temperatureString),\n Видимость составляет \(weather.visibilityAppString)метров,  \(weather.mainString)  \(weather.degWindString) \(weather.bases) "
//            \(weather.precipitationString)  \(weather.visibilityAppString)
      }
        
        

    }
    
  
        
    
    func animOutOne() -> Bool {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.8
        
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = Float.greatestFiniteMagnitude
      DetailButtonOUT.layer.add(pulse, forKey: nil)
        imageCloudfour.alpha = pulse.mass
        imageCloudTwo.alpha = pulse.mass
        return true
    }
    
    func animateClouds() -> Bool {
        UIImageView.animate(withDuration: 50,
                            delay: 0,
                            options: [.curveLinear, .autoreverse,  .repeat, .allowAnimatedContent],
                            animations: {
                                self.imageCloudOne.frame.origin.x = 500
                                
                            })
        UIImageView.animate(withDuration: 50,
                            delay: 0,
                            options: [.curveEaseIn, .autoreverse, .repeat],
                            animations: {
                              self.imageCloudTwo.frame.origin.x = 700
                                self.imageCloudThree.frame.origin.x = 400
                            })
        UIImageView.animate(withDuration: 50,
                            delay: 0,
                            options: [.curveEaseIn, .autoreverse, .repeat],
                            animations: {
                              
                                self.imageCloudfour.frame.origin.x = 700
                                
                            })
        UIImageView.animate(withDuration: 15,
                            delay: 5,
                            options: [.curveEaseIn,  .repeat],
                            animations: {
                              
                                self.imageBirdOne.frame.origin.x = 700 
                               
                            })
        
        return true
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard  let dvc = segue.destination as? DetailViewController else {return}
//        dvc.city = cityLabel.text
//         dvc.descriptionWeather = descriptionLabel.text
//         dvc.temperature = bigTemperatureLabel.text
//     }
    func destination() {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController else { return }
        detailViewController.city = cityLabel.text
        detailViewController.descriptionWeather = descriptionLabel.text
        detailViewController.temperature = bigTemperatureLabel.text
        detailViewController.feelsLike = feelsLikeLabel.text! 
        detailViewController.sunriseTwo = sunriseLabel.text
        detailViewController.sunsetTwo = sunsetLabel.text
        detailViewController.visibility = visibilityLabel.text!
        detailViewController.minTemp = labelMinTemp.text!
        detailViewController.maxTemp = labelMaxTemp.text!
        detailViewController.pressure = pressureLabel.text!
        detailViewController.humidity = humidityLabel.text!
//        detailViewController.iconName = iconNameImage.
        detailViewController.speedWind = speedWindLabel.text!
        detailViewController.degWind = degWindLabel.text!
        detailViewController.gustWind = gustWindLabel.text!
        detailViewController.all = allLabel.text!
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    }

