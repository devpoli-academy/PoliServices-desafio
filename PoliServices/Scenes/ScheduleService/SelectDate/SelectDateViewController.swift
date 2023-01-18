//
//  SelectDateViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 01/12/22.
//

import UIKit

class SelectDateViewController: UIViewController {

    private lazy var selectDateView = SelectDateView()

    var serviceName: String?

    override func loadView() {

        view = selectDateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()        
    }
    
    private func configureNavigationBar() {
        
        title = "Novo Serviço"
        
        let rightBarButtomItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(didTapSaveButton)
        )
        
        navigationItem.rightBarButtonItem = rightBarButtomItem
    }
    
    @objc private func didTapSaveButton() {
        
        UserDefaults.standard.set(selectDateView.timeIntervalSince1970,
                                  forKey: ServiceKeys.serviceDate.rawValue)
        
        UserDefaults.standard.set(serviceName,
                                  forKey: ServiceKeys.serviceName.rawValue)
        
        dismiss(animated: true)
    }
}
