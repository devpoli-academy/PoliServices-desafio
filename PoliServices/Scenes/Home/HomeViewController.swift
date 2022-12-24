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
        
        configureCurrentDate()
        
        homeViewModel.startTimer()
        
        lastServiceView.alpha = 0
        
        novoBtn.alpha = 0
        
        descriptionLabel.text = "A DevServices é o melhor aplicativo para reservar seu agendamento com serviços. Aqui é um espaço que você consegue reservar um espaço na minha agenda e vamos resolver suas dúvidas.\nSelecione o tipo de atendimento e vamos pra cima!\n\n*Ilustrativo"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeViewModel.getScheduledService()
    }
    
    private func configureCurrentDate() {
        
        homeViewModel.getCurrentDate { [unowned self] date in
            
            self.dateLabel.text = date
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
