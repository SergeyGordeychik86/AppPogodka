//
//  CurrencyValute.swift
//  AppPogodka
//
//  Created by MacBook on 12.06.2021.
//

import Foundation
    
struct Currency : Codable {
    let date : String?
    let cur_Abbreviation : String?
    let cur_OfficialRate : Double?
    let cur_Symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case cur_OfficialRate = "Cur_OfficialRate"
        case date = "Date"
        case cur_Abbreviation = "Cur_Abbreviation"
        case cur_Symbol = "Cur_Symbol"
    }
}

