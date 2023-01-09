//
//  SelectDateViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 01/12/22.
//

import UIKit

class SelectDateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var salvar: UIBarButtonItem!

    var servico: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.minimumDate = Date()
        
        datePicker.date = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
    }

    @IBAction func clicou(_ sender: Any) {
        
        UserDefaults.standard.set(datePicker.date.timeIntervalSince1970,
                                  forKey: ServiceKeys.serviceDate.rawValue)
        
        UserDefaults.standard.set(servico,
                                  forKey: ServiceKeys.serviceName.rawValue)
        
        dismiss(animated: true)
    }
}
