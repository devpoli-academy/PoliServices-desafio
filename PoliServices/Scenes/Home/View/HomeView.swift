import UIKit

class HomeView: UIView {
    
    var dateLabelText: String? {
        didSet {
            currentDateLabel.text = dateLabelText
        }
    }
    
    var descriptionText: String? {
        didSet {
            descriptionView.descriptionText = descriptionText
        }
    }
    
    private lazy var welcomeLabel = CustomLabel(text: "Bem-Vindo ao DevServices",
                                                size: 32,
                                                weight: .bold)
    
    private lazy var currentDateLabel = CustomLabel(text: "1 de janeiro de 2023",
                                                    size: 13,
                                                    weight: .thin,
                                                    textColor: .darkGray)
    
    private lazy var descriptionView = DescriptionView()
    
    private lazy var dividerView = CustomDividerView()
    
    private lazy var lastServiceView = LastServiceView()
    
    private lazy var newServiceButton = CustomButton(title: "Solicitar novo serviço")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureWelcomeLabel()
        
        configureCurrentDateLabel()
        
        configureDescriptionView()
        
        configureDividerView()
        
        
        
        
//        configureLastServiceView()
//        configureNewServiceButton()
        
        
        
        additionalConfiguration()
    }
    
    private func configureWelcomeLabel() {
        
        addSubview(welcomeLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            welcomeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            welcomeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),
        ])
    }
    
    private func configureCurrentDateLabel() {
        
        addSubview(currentDateLabel)
        
        NSLayoutConstraint.activate([
            currentDateLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            currentDateLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
        ])
    }
    
    private func configureDescriptionView() {
        
        addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 32),
            descriptionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            descriptionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
        ])
    }
    
    private func configureDividerView() {
        
        addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 32),
            dividerView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func additionalConfiguration() {
        
        backgroundColor = .mainBackground
    }
    
    func configureLastServiceView() {
        
        addSubview(lastServiceView)
        
        NSLayoutConstraint.activate([
            lastServiceView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 32),
            lastServiceView.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            lastServiceView.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor)
        ])
    }
    
    func removeLastServiceView() {
        
        lastServiceView.removeFromSuperview()
    }
    
    func configureNewServiceButton() {
        
        addSubview(newServiceButton)
        
        NSLayoutConstraint.activate([
            newServiceButton.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 32),
            newServiceButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            newServiceButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor)
        ])
    }
    
    func removeNewServiceButton() {
        
        newServiceButton.removeFromSuperview()
    }
}
