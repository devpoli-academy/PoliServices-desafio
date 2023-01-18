import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    weak var scheduledServiceDelegate: ScheduledServiceDelegate?
    
    var dateManager: DateManagerProtocol = DateManager()
    
    var customTimer: CustomTimerProtocol = CustomTimer()
    
    func getCurrentDate(_ completion: (String) -> Void) {
        
        dateManager.getCurrentDate { date in
            
            completion(date)
        }
    }
    
    func getDescriptionLabel(_ completion: (String) -> Void) {
        
        let descriptionText = DescriptionModel.description
        
        completion(descriptionText)
    }
    
    func startTimer() {
        
        customTimer.startTimer { [weak self] in
            
            guard let self = self else { return }
            
            self.getScheduledService()
        }
    }
}

extension HomeViewModel: ScheduledServiceProtocol {
    
    func getScheduledService() {
    
        let currentDate = Date()
        
        let serviceDateInteger = UserDefaults.standard.double(forKey: ServiceKeys.serviceDate.rawValue)
        
        let serviceDate = Date(timeIntervalSince1970: TimeInterval(serviceDateInteger))
        
        let hasService = serviceDate >= currentDate
        
        if hasService {
            guard let serviceName = UserDefaults.standard.string(forKey: ServiceKeys.serviceName.rawValue) else { return }

            let service = ServiceModel(
                serviceDate: serviceDate.toStandardString(),
                serviceName: serviceName
            )
            
            scheduledServiceDelegate?.didGetScheduledService(service: service)
        } else {
            UserDefaults.standard.removeObject(forKey: ServiceKeys.serviceDate.rawValue)
            UserDefaults.standard.removeObject(forKey: ServiceKeys.serviceName.rawValue)
            
            scheduledServiceDelegate?.noScheduledService()
        }
    }
}
