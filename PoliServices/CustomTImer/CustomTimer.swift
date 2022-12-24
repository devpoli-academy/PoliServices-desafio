import Foundation

protocol CustomTimerProtocol {
    
    func startTimer(action: @escaping () -> Void)
}

class CustomTimer: CustomTimerProtocol {
    
    var timer: Timer?
    
    func startTimer(action: @escaping () -> Void) {
        
        let now: Date = Date()
        
        let calendar: Calendar = Calendar.current
        
        let currentSeconds: Int = calendar.component(.second, from: now)
        
        let timer = Timer(
            fire: now.addingTimeInterval(Double(60 - currentSeconds + 1)),
            interval: 60,
            repeats: true,
            block: { _ in
                
                action()
            }
        )
        
        RunLoop.main.add(timer, forMode: .default)
        
        self.timer = timer
    }
}
