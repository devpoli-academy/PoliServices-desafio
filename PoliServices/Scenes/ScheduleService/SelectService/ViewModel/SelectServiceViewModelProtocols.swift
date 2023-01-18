protocol SelectServiceViewModelProtocol: AnyObject, SelectServiceCreator {
    
    var services: SelectServices { get }
    
    var delegate: SelectServiceViewDelegate? { get set }
    
    func getServices()
}

protocol SelectServiceViewDelegate: AnyObject {
    
    func didGetSelectServices()
}

protocol SelectServiceCreator {
    
    func createSelectService(name: String, systemImageName: SystemImageName, imageColor: CustomColor) -> SelectServicesModel
}

extension SelectServiceCreator {
    
    func createSelectService(name: String, systemImageName: SystemImageName, imageColor: CustomColor) -> SelectServicesModel {
        
        let selectServiceModel = SelectServicesModel(name: name,
                                                     systemImageName: systemImageName,
                                                     imageColor: imageColor)
        
        return selectServiceModel
    }
}

