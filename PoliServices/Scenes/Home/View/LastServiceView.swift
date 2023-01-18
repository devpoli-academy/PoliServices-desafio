import UIKit

class LastServiceView: UIView {
    
    var serviceNameText: String? {
        didSet {
            serviceNameLabel.text = serviceNameText
        }
    }
    
    var serviceDateText: String? {
        didSet {
            serviceDateLabel.text = serviceDateText
        }
    }
    
    private lazy var nextServiceLabel = CustomLabel(text: "Próximo Serviço",
                                                    size: 16,
                                                    weight: .bold)
    
    private lazy var innerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var serviceNameLabel = CustomLabel(text: "Nome do serviço",
                                                    size: 20,
                                                    weight: .bold,
                                                    textColor: .white)
    
    private lazy var serviceDateTitleLabel = CustomLabel(text: "Data e hora",
                                                         size: 12,
                                                         textColor: .white)
    
    private lazy var serviceDateLabel = CustomLabel(text: "30/11 às 19h",
                                                    size: 12,
                                                    weight: .bold,
                                                    textColor: .white)
    
    private lazy var serviceBookImageView = CustomImageView(systemImageName: "book.fill")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureNextServiceLabel()
        
        configureInnerView()
        
        configureServiceBookImageView()
        
        configureInneViewLabels()
        
        additionalConfiguration()
    }
    
    private func configureNextServiceLabel() {
        
        addSubview(nextServiceLabel)
        
        NSLayoutConstraint.activate([
            nextServiceLabel.topAnchor.constraint(equalTo: topAnchor),
            nextServiceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    private func configureInnerView() {
        
        addSubview(innerView)
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: nextServiceLabel.bottomAnchor, constant: 8),
            innerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            innerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            innerView.heightAnchor.constraint(equalTo: innerView.widthAnchor, multiplier: 9.0 / 21.0)
        ])
    }
    
    private func configureServiceBookImageView() {
        
        innerView.addSubview(serviceBookImageView)
        
        NSLayoutConstraint.activate([
            serviceBookImageView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -4),
            serviceBookImageView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -10),
            serviceBookImageView.heightAnchor.constraint(equalTo: innerView.heightAnchor, multiplier: 0.5),
            serviceBookImageView.widthAnchor.constraint(equalTo: innerView.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureInneViewLabels() {
        
        innerView.addSubview(serviceNameLabel)
        innerView.addSubview(serviceDateLabel)
        innerView.addSubview(serviceDateTitleLabel)
        
        NSLayoutConstraint.activate([
            serviceNameLabel.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 16),
            serviceNameLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 16),
            serviceNameLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -16),
            
            serviceDateLabel.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -16),
            serviceDateLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 16),
            serviceDateLabel.trailingAnchor.constraint(equalTo: serviceBookImageView.leadingAnchor, constant: -16),
            
            serviceDateTitleLabel.bottomAnchor.constraint(equalTo: serviceDateLabel.topAnchor, constant: -4),
            serviceDateTitleLabel.leadingAnchor.constraint(equalTo: serviceDateLabel.leadingAnchor),
            serviceDateTitleLabel.widthAnchor.constraint(equalTo: serviceDateLabel.widthAnchor)
        ])
    }
    
    private func additionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .orange
    }
}
