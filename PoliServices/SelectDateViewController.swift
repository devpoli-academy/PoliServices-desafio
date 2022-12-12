//
//  SelectDateViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 01/12/22.
//

import Foundation
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
        UserDefaults.standard.set(datePicker.date.timeIntervalSince1970, forKey: "service_date")
        UserDefaults.standard.set(servico, forKey: "service_name")
        dismiss(animated: true)
    }

}
