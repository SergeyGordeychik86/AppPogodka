//
//  DetailMusic.swift
//  AppPogodka
//
//  Created by MacBook on 09.06.2021.
//

import UIKit
import AVFoundation

class  DetailMusic {
    var audio = AVAudioPlayer()
    
    func audioDetailClouds() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Clouds", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    func audioDetailDegWind() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "DegWind", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    func audioDetailFeelsLike() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "FeelsLike", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    func audioDetailGustWind() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "GustWind", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    
    func audioDetailHumidity() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Humidity", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    
    func audioDetailPressure() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Pressure", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    func audioDetailSpeedWind() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "SpeedWind", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    
    func audioDetailEnd() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "End", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    func audioDetailKursValute() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "KursValute", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }


}
