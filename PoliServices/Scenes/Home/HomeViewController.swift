//
//  HomeViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import UIKit

class HomeViewController: UIViewController {

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
        
        lastServiceView.alpha = 0
        
        novoBtn.alpha = 0
    }
    
    private func configureCurrentDate() {
        
        homeViewModel.getCurrentDate { [unowned self] currentDate in
            
            self.dateLabel.text = currentDate
        }
    }
    
    private func configureDescriptionLabel() {
        
        homeViewModel.getDescriptionLabel { [unowned self] descriptionText in
            
            self.descriptionLabel.text = descriptionText
        }
    }
    
    @IBAction func onRequestNewServiceDidTap(_ sender: Any) {
        
        performSegue(withIdentifier: "showNewService", sender: nil)
    }
}

extension HomeViewController: ScheduledServiceDelegate {
    
    func didGetScheduledService(service: ServiceModel) {
        
        DispatchQueue.main.async {
            
            UIView.animate(withDuration: 0.3) {
                self.lastServiceView.alpha = 1
                self.lastServiceView.isHidden = false
                
                self.novoBtn.alpha = 0
                self.novoBtn.isHidden = true
            }
        }
    }
    
    func noScheduledService() {
        
        DispatchQueue.main.async {
            
            UIView.animate(withDuration: 0.3) {
                self.lastServiceView.alpha = 0
                self.lastServiceView.isHidden = true
                
                self.novoBtn.alpha = 1
                self.novoBtn.isHidden = false
            }
        }
    }
}
