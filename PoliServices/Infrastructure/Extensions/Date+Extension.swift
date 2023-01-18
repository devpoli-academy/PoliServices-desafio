import Foundation

extension Date {
    
    func toStandardString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY HH:mm"
        
        return dateFormatter.string(from: self)
    }
    
    func getStandardCurrentDateString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale(identifier: "pt_BR")
        
        return dateFormatter.string(from: self)
    }
}
