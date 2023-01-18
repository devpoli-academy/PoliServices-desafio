import Foundation

protocol DateManagerProtocol {
    
    func getCurrentDate(onComplete: (String) -> Void)
}

class DateManager: DateManagerProtocol {

    func getCurrentDate(onComplete: (String) -> Void) {
                
        let formattedCurrentDate = Date().getStandardCurrentDateString()
        
        onComplete(formattedCurrentDate)
    }
}
