import Foundation

class SelectDateViewModel: SelectDateViewModelProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    var delegate: SelectDateViewDelegate?
    
    var serviceName: String
    
    init(serviceName: String) {
        self.serviceName = serviceName
    }
    
    func saveService(name: String, date: TimeInterval) {
        
        let scheduledService = ScheduledServiceModel(name: name, date: date)
        
        userDefaults.set(scheduledService.name,
                         forKey: ServiceKeys.serviceName.rawValue)
        
        userDefaults.set(scheduledService.date,
                         forKey: ServiceKeys.serviceDate.rawValue)
        
        delegate?.didSaveService()
    }
}
