//
//  NovoServicoViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import Foundation
import UIKit

class NovoServiceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    var nome: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onCancelDidTap(_ sender: Any) {
        dismiss(animated: true)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceItem", for: indexPath) as! ServiceCollectionViewCell

        if indexPath.row == 0 {
            cell.title.text = "Código"
            cell.imageView.image = UIImage(systemName: "pencil.slash")
            cell.imageView.tintColor = .cyan
        } else if indexPath.row == 1 {
            cell.title.text = "Carreira"
            cell.imageView.image = UIImage(systemName: "graduationcap.circle.fill")
            cell.imageView.tintColor = .green
        } else if indexPath.row == 2 {
            cell.title.text = "Entrevista"
            cell.imageView.image = UIImage(systemName: "books.vertical.fill")
            cell.imageView.tintColor = .magenta
        } else if indexPath.row == 3 {
            cell.title.text = "Feedback"
            cell.imageView.image = UIImage(systemName: "scribble.variable")
            cell.imageView.tintColor = .brown
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! SelectDateViewController).servico = nome
    }

}
