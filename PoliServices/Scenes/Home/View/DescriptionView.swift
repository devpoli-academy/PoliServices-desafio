import UIKit

class DescriptionView: UIView {
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    private lazy var descriptionTitleLabel = CustomLabel(text: "Sobre nós",
                                                size: 16,
                                                weight: .bold)
    
    private lazy var descriptionLabel = CustomLabel(text: "Descrição",
                                                size: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureLabels()
        
        additionalConfiguration()
    }
    
    private func configureLabels() {
        
        addSubview(descriptionTitleLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionTitleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionTitleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
    }
    
    private func additionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        
        layer.cornerRadius = 8
    }
}
