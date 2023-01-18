//
//  String+Date.swift
//  PoliServices
//
//  Created by Personal on 17/01/23.
//

import Foundation

extension Date {
    
    func toStandardString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY HH:mm"
        
        return dateFormatter.string(from: self)
    }
}
