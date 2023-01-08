protocol HomeViewModelProtocol: ScheduledServiceProtocol {
    
    var dateManager: DateManagerProtocol { get }
    
    var customTimer: CustomTimerProtocol { get }
    
    func getCurrentDate(_ completion: (String) -> Void)
    
    func getDescriptionLabel(_ completion: (String) -> Void)
    
    func startTimer()
}


protocol ScheduledServiceProtocol {
    
    var scheduledServiceDelegate: ScheduledServiceDelegate? { get }
    
    func getScheduledService()
}

protocol ScheduledServiceDelegate: AnyObject {
    
    func didGetScheduledService(service: ServiceModel)
    
    func noScheduledService()
}
