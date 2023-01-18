import Foundation

extension Date {
    
    func toStandardString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY HH:mm"
        
        return dateFormatter.string(from: self)
    }
}
