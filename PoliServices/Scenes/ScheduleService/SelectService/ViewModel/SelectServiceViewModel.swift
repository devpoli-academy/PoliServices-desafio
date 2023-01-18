class SelectServiceViewModel: SelectServiceViewModelProtocol {
    
    var services: SelectServices = []
    
    weak var delegate: SelectServiceViewDelegate?
    
    func getServices() {
        
        services.append(createSelectService(name: "Código",
                                            systemImageName: .pencil,
                                            imageColor: .cyan))
        
        services.append(createSelectService(name: "Carreira",
                                            systemImageName: .graduationCap,
                                            imageColor: .green))
        
        services.append(createSelectService(name: "Entrevista",
                                            systemImageName: .books,
                                            imageColor: .magenta))
        
        services.append(createSelectService(name: "Feedback",
                                            systemImageName: .scribble,
                                            imageColor: .brown))
        
        delegate?.didGetSelectServices()
    }
}
