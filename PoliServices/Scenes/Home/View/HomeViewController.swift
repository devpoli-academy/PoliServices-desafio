//
//  HomeViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    private let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        
        view.serviceButtonAction = { [unowned self] in
            
            self.didTapNewServiceButton()
        }
        
        return view
    }()
    
    override func loadView() {

        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getScheduledService()
    }
    
    private func configureView() {
        
        configureCurrentDate()
        
        configureDescriptionLabel()
        
        viewModel.startTimer()
    }
    
    private func configureCurrentDate() {
        
        viewModel.getCurrentDate { [unowned self] currentDate in
            
            self.homeView.dateLabelText = currentDate
        }
    }
    
    private func configureDescriptionLabel() {
        
        viewModel.getDescriptionLabel { [unowned self] descriptionText in
            
            self.homeView.descriptionText = descriptionText
        }
    }
    
    private func didTapNewServiceButton() {
        
        let selectServiceNavigationController = selectServiceNavigationControllerFactory()
        
        show(selectServiceNavigationController, sender: self)
    }
    
    func selectServiceNavigationControllerFactory() -> UINavigationController {
        
        let selectServiceViewModel = SelectServiceViewModel()
        
        let selectServiceViewController = SelectServiceViewController(viewModel: selectServiceViewModel)
        
        selectServiceViewModel.delegate = selectServiceViewController
        
        let selectServiceNavigationController = UINavigationController(rootViewController: selectServiceViewController)
        selectServiceNavigationController.modalPresentationStyle = .fullScreen
        
        return selectServiceNavigationController
    }
}

extension HomeViewController: ScheduledServiceDelegate {
    
    func didGetScheduledService(service: ServiceModel) {
        
        homeView.serviceNameText = service.serviceName
        homeView.serviceDateText = service.serviceDate
        
        homeView.configureServiceView(hasService: true)
    }
    
    func noScheduledService() {
        
        homeView.configureServiceView(hasService: false)
    }
}
