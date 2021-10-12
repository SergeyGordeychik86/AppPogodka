//
//  ViewModel.swift
//  AppPogodka
//
//  Created by MacBook on 12.06.2021.
//

import Foundation

protocol ViewModelDelegate: class {
    
    func reloadTableView()
    func showError(error: String)
}

class ViewModel {
    private var nationalCurrencyArray: [Currency] = []
    private var delegate: ViewModelDelegate
    
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getCurrencyCount() -> Int {
        return nationalCurrencyArray.count
    }
    
    func getData() {
        CurrencyModel.getData(closure: { (currency) in
            self.nationalCurrencyArray = currency
            self.delegate.reloadTableView()
        })
    }
    
    func getItem(row: Int) -> Currency {
        return nationalCurrencyArray[row]
    }
    
    func findSymbolAndImageName(currencyCode: String) -> (cur_Symbol: String, cur_FlagImageName: String) {
        var countryArray = [(cur_Abr: String, cur_Symbol: String, cur_FlagImageName: String)]() // массив кортежей для нахождения имени картинки и символа по аббревиатуре
        countryArray.append(("USD", "$", "usa"))
        countryArray.append(("EUR", "€", "eu"))
        countryArray.append(("GBP", "£", "uk"))
        for country in countryArray {
            if country.cur_Abr == currencyCode {
                return (country.cur_Symbol ,country.cur_FlagImageName)
            }
        }
        return ("", "")
    }

}
