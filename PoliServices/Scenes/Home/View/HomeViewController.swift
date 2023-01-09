//
//  HomeViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView: HomeView = {
        let view = HomeView()
        
        view.serviceButtonAction = { [unowned self] in
            
            self.didTapNewServiceButton()
        }
        
        return view
    }()
    
    private lazy var homeViewModel: HomeViewModelProtocol = {
        let viewModel = HomeViewModel()
        
        viewModel.scheduledServiceDelegate = self

        return viewModel
    }()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lastServiceView: UIView!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var serviceDateLabel: UILabel!
    @IBOutlet weak var novoBtn: UIButton!

    override func loadView() {

        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeViewModel.getScheduledService()
    }
    
    private func configureView() {
        
        configureCurrentDate()
        
        configureDescriptionLabel()
        
        homeViewModel.startTimer()
    }
    
    private func configureCurrentDate() {
        
        homeViewModel.getCurrentDate { [unowned self] currentDate in
            
            self.homeView.dateLabelText = currentDate
        }
    }
    
    private func configureDescriptionLabel() {
        
        homeViewModel.getDescriptionLabel { [unowned self] descriptionText in
            
            self.homeView.descriptionText = descriptionText
        }
    }
    
    private func didTapNewServiceButton() {
        
        performSegue(withIdentifier: "showNewService", sender: nil)
    }
    
    @IBAction func onRequestNewServiceDidTap(_ sender: Any) {
        
        performSegue(withIdentifier: "showNewService", sender: nil)
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
