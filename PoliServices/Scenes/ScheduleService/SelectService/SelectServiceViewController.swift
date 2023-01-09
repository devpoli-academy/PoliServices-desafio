//
//  SelectServiceViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import UIKit

class SelectServiceViewController: UIViewController {

    private lazy var selectServiceView: SelectServiceView = {
        let view = SelectServiceView()
        
        view.configureCollectionView(delegate: self, dataSource: self)
        
        return view
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!

    var nome: String?
    
    override func loadView() {
        
        view = selectServiceView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        
        title = "Novo Serviço"
        
        let leftBarButtomItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(didTapCancelButton)
        )
        
        navigationItem.leftBarButtonItem = leftBarButtomItem
    }
    
    @objc private func didTapCancelButton() {
        
        dismiss(animated: true)
    }

    @IBAction func onCancelDidTap(_ sender: Any) {
        dismiss(animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        (segue.destination as! SelectDateViewController).servico = nome
    }
}

extension SelectServiceViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            nome = "Código"
        } else if indexPath.row == 1 {
            nome = "Carreira"
        } else if indexPath.row == 2 {
            nome = "Entrevista"
        } else if indexPath.row == 3 {
            nome = "Feedback"
        }
        
        performSegue(withIdentifier: "dataServico", sender: nil)
    }
}

extension SelectServiceViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCollectionViewCell.identifier,
                                                      for: indexPath) as! ServiceCollectionViewCell

        switch indexPath.row {
            
        case 0:
            cell.serviceNameText = "Código"
            cell.serviceImageName = "pencil.slash"
            cell.serviceImageColor = .cyan
            
        case 1:
            cell.serviceNameText = "Carreira"
            cell.serviceImageName = "graduationcap.circle.fill"
            cell.serviceImageColor = .green
            
        case 2:
            cell.serviceNameText = "Entrevista"
            cell.serviceImageName = "books.vertical.fill"
            cell.serviceImageColor = .magenta
            
        case 3:
            cell.serviceNameText = "Feedback"
            cell.serviceImageName = "scribble.variable"
            cell.serviceImageColor = .brown
            
        default:
            cell.serviceNameText = ""
            cell.serviceImageName = ""
            cell.serviceImageColor = .black
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
}

extension SelectServiceViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
}
