//
//  DestinationData.swift
//  AppPogodka
//
//  Created by MacBook on 14.08.2021.
//

import Foundation
import UIKit

struct Destination {
    var dest = ViewController()
    init? (destinationData: DestinationData) {
        dest.feelsLikeLabel.text = destinationData.feelsLike
        dest.visibilityLabel.text = destinationData.visibility
    }
}

struct DestinationData  {
    
    var feelsLike = ""
    var visibility = ""
    var sunrise = ""
    var sunset = ""
    var minTemp = ""
    var maxTemp = ""
    var pressure = ""
    var humidity = ""
    
    var iconName = UIImage()
    var speedWind = ""
    var degWind = ""
    var gustWind = ""
    var all = ""

}
