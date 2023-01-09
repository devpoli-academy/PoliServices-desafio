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
    
    var serviceNameText: String? {
        didSet {
            lastServiceView.serviceNameText = serviceNameText
        }
    }
    
    var serviceDateText: String? {
        didSet {
            lastServiceView.serviceDateText = serviceDateText
        }
    }
    
    var serviceButtonAction: (() -> Void)?
    
    private lazy var welcomeLabel = CustomLabel(text: "Bem-Vindo ao DevServices",
                                                size: 32,
                                                weight: .bold)
    
    private lazy var currentDateLabel = CustomLabel(text: "1 de janeiro de 2023",
                                                    size: 13,
                                                    weight: .thin,
                                                    textColor: .darkGray)
    
    private lazy var descriptionView = DescriptionView()
    
    private lazy var dividerView = CustomDividerView()
    
    private lazy var serviceStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 22
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var lastServiceView: LastServiceView = {
        let view = LastServiceView()
        
        view.alpha = 0
        
        return view
    }()
    
    private lazy var newServiceButton: CustomButton = {
        let button = CustomButton(title: "Solicitar novo serviço")
        
        button.alpha = 0
        button.action = { [unowned self] in
            
            self.serviceButtonAction?()
        }
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        
        configureServiceStackView()
        
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
    
    private func configureServiceStackView() {
        
        addSubview(serviceStackView)
        serviceStackView.addArrangedSubview(lastServiceView)
        serviceStackView.addArrangedSubview(newServiceButton)
        
        NSLayoutConstraint.activate([
            serviceStackView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 32),
            serviceStackView.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            serviceStackView.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor)
        ])
    }
    
    func configureServiceView(hasService: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            
            UIView.animate(withDuration: 0.3) {
                self?.lastServiceView.alpha = hasService ? 1 : 0
                self?.lastServiceView.isHidden = hasService ? false : true

                self?.newServiceButton.alpha = hasService ? 0 : 1
                self?.newServiceButton.isHidden = hasService ? true : false
            }
        }
    }
}
