//
//  StartMusic.swift
//  AppPogodka
//
//  Created by MacBook on 28.05.2021.
//

import UIKit
import AVFoundation

class  StartMusic {
    var audio = AVAudioPlayer()
    
    func audioPlayer() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "DetailPogoda", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    
    func audioStartRain() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "RainStart", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    
    func audioStartGrom() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Raskat-groma", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    
    func audioButtomDetail() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "ButtomDetail", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
}
    

