//
//  Detail.swift
//  AppPogodka
//
//  Created by MacBook on 06.06.2021.
//

import SwiftUI

struct Detail: View {
    @State var veee: ViewController
@State var networkWeatherManager = NetworkWeatherManager()
//     networkWeatherManage.onCompletion = { [weak self] currentWeather in
//        guard let self = self else { return }
//        self.updateInterfaceWith(weather: currentWeather)
//   }
  
    var body: some View {
        List {
            
//        Text("\(veee.descriptionLabel)")
    }
        
    }
    
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(veee: ViewController())
    }
}
