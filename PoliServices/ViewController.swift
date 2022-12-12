//
//  ViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lastServiceView: UIView!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var serviceDateLabel: UILabel!
    @IBOutlet weak var novoBtn: UIButton!

    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        lastServiceView.alpha = 0
        novoBtn.alpha = 0
        descriptionLabel.text = "A DevServices é o melhor aplicativo para reservar seu agendamento com serviços. Aqui é um espaço que você consegue reservar um espaço na minha agenda e vamos resolver suas dúvidas.\nSelecione o tipo de atendimento e vamos pra cima!\n\n*Ilustrativo"
        initTimer()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupService()
    }

    private func setupService() {
        let currentDate = Date()
        let serviceDateInteger = UserDefaults.standard.integer(forKey: "service_date")
        let serviceDate = Date(timeIntervalSince1970: TimeInterval(serviceDateInteger))
        let hasService = serviceDate >= currentDate
        if hasService {
            let serviceName = UserDefaults.standard.string(forKey: "service_name")

            serviceNameLabel.text = serviceName
            serviceDateLabel.text = serviceDate.formatted(
                date: .numeric,
                time: .shortened
            )
        }else{
            UserDefaults.standard.removeObject(forKey: "service_date")
            UserDefaults.standard.removeObject(forKey: "service_name")
        }

        UIView.animate(withDuration: 0.3) {
            self.lastServiceView.alpha = hasService ? 1 : 0
            self.lastServiceView.isHidden = !hasService
            self.novoBtn.alpha = hasService ? 0 : 1
            self.novoBtn.isHidden = hasService
        }

        dateLabel.text = currentDate.formatted(
            date: .long,
            time: .omitted
        )
    }

    @IBAction func onRequestNewServiceDidTap(_ sender: Any) {
        performSegue(withIdentifier: "showNewService", sender: nil)
    }

    private func initTimer(){
        let now: Date = Date()
        let calendar: Calendar = Calendar.current
        let currentSeconds: Int = calendar.component(.second, from: now)
        let timer = Timer(
            fire: now.addingTimeInterval(Double(60 - currentSeconds + 1)),
            interval: 60,
            repeats: true,
            block: { (t: Timer) in
                self.setupService()
            })
        RunLoop.main.add(timer, forMode: .default)
        self.timer = timer
    }

}
