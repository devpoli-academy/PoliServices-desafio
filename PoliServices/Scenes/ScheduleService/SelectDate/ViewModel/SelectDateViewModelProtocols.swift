import Foundation

protocol SelectDateViewModelProtocol {
    
    var delegate: SelectDateViewDelegate? { get set }
    
    var serviceName: String { get }
    
    func saveService(name: String, date: TimeInterval)
}

protocol SelectDateViewDelegate: AnyObject {
    
    func didSaveService()
}
