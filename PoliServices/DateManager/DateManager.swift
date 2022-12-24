import Foundation

protocol DateManagerProtocol {
    
    func getcurrentDate(onComplete: (String) -> Void)
}

class DateManager: DateManagerProtocol {

    func getcurrentDate(onComplete: (String) -> Void) {
        
        let formattedCurrentDate = Date().formatted(
            date: .long,
            time: .omitted
        )
        
        onComplete(formattedCurrentDate)
    }
}
