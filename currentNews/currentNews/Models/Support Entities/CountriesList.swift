//
//  CountriesList.swift
//  currentNews
//
//  Created by Lewis on 14.06.2022.
//

import Foundation

enum CountriesListISOCode: String, CaseIterable {
    
    case unitedArabEmirates = "ae"
    case argentina = "ar"
    case austria = "at"
    case australia = "au"
    case belgium = "be"
    case bulgaria = "bg"
    case brazil = "br"
    case canada = "ca"
    case switzerland = "ch"
    case china = "cn"
    case columbia = "co"
    case cuba = "cu"
    case czech = "cz"
    case germany = "de"
    case egypt = "eg"
    case france = "fr"
    case greatBritain = "gb"
    case greece = "gr"
    case hongKong = "hk"
    case hungary = "hu"
    case indonesia = "id"
    case ireland = "ie"
    case israel = "il"
    case italy = "it"
    case japan = "jp"
    case korea = "kr"
    case lithuania = "lt"
    case latvia = "lv"
    case marocco = "ma"
    case mexico = "mx"
    case malaysia = "my"
    case nigeria = "ng"
    case netherlands = "nl"
    case norway = "no"
    case newZeland = "nz"
    case philippines = "ph"
    case poland = "pl"
    case portugal = "pt"
    case romania = "ro"
    case serbia = "rs"
    case russia = "ru"
    case saudiArabia = "sa"
    case sweden = "se"
    case singapore = "sg"
    case slovenia = "si"
    case slovakia = "sk"
    case thailand = "th"
    case turkey = "tr"
    case taiwan = "tw"
    case ukraine = "ua"
    case usa = "us"
    case venezuela = "ve"
    case southAfrica = "za"
    
    func getCountryName() -> String {
        switch self {
        case .unitedArabEmirates:
            return "United Arab Emirates"
        case .argentina:
            return "Argentina"
        case .austria:
            return "Austria"
        case .australia:
            return "Australia"
        case .belgium:
            return "Belgium"
        case .bulgaria:
            return "Bulagia"
        case .brazil:
            return "Brazil"
        case .canada:
            return "Canada"
        case .switzerland:
            return "Switzerland"
        case .china:
            return "China"
        case .columbia:
            return "Columbia"
        case .cuba:
            return "Cuba"
        case .czech:
            return "Czech Republic"
        case .germany:
            return "Germany"
        case .egypt:
            return "Egypt"
        case .france:
            return "France"
        case .greatBritain:
            return "Great Britain"
        case .greece:
            return "Greece"
        case .hongKong:
            return "Hong Kong"
        case .hungary:
            return "Hungary"
        case .indonesia:
            return "Indonesia"
        case .ireland:
            return "Ireland"
        case .israel:
            return "Israel"
        case .italy:
            return "Italy"
        case .japan:
            return "Japan"
        case .korea:
            return "Korea"
        case .lithuania:
            return "Lithuania"
        case .latvia:
            return "Latvia"
        case .marocco:
            return "Marocco"
        case .mexico:
            return "Mexico"
        case .malaysia:
            return "Malaysia"
        case .nigeria:
            return "Nigeria"
        case .netherlands:
            return "Netherlands"
        case .norway:
            return "Norway"
        case .newZeland:
            return "New Zeland"
        case .philippines:
            return "Philippines"
        case .poland:
            return "Poland"
        case .portugal:
            return "Portugal"
        case .romania:
            return "Romania"
        case .serbia:
            return "Serbia"
        case .russia:
            return "Russia"
        case .saudiArabia:
            return "Saudi Arabia"
        case .sweden:
            return "Sweden"
        case .singapore:
            return "Singapore"
        case .slovenia:
            return "Slovenia"
        case .slovakia:
            return "Slovakia"
        case .thailand:
            return "Thailand"
        case .turkey:
            return "Turkey"
        case .taiwan:
            return "Taiwan"
        case .ukraine:
            return "Ukraine"
        case .usa:
            return "United States"
        case .venezuela:
            return "Venezuella"
        case .southAfrica:
            return "South Africa"
        }
    }
}
