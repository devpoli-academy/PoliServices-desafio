import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ServiceCollectionViewCell"
    
    var serviceImageName: String? {
        didSet {
            
            guard let serviceImageName = serviceImageName else { return }
            serviceImageView.image = UIImage(named: serviceImageName)?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    var serviceImageColor: UIColor? {
        didSet {
            serviceImageView.tintColor = serviceImageColor ?? .black
        }
    }
    
    var serviceNameText: String? {
        didSet {
            serviceNameLabel.text = serviceNameText ?? "-"
        }
    }
    
    private lazy var serviceImageView = CustomImageView()
    
    private lazy var serviceNameLabel = CustomLabel(
        text: "Service Name",
        size: 20,
        weight: .bold,
        alignment: .center
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCollectioViewCell()
        
        additionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectioViewCell() {
        
        contentView.addSubview(serviceImageView)
        contentView.addSubview(serviceNameLabel)
        
        NSLayoutConstraint.activate([
            serviceImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            serviceImageView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            serviceImageView.widthAnchor.constraint(equalToConstant: 60),
            serviceImageView.heightAnchor.constraint(equalToConstant: 60),
            
            serviceNameLabel.topAnchor.constraint(equalTo: serviceImageView.bottomAnchor, constant: 12),
            serviceNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            serviceNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            serviceNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    private func additionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func configure(with selectService: SelectServicesModel) {
        
        serviceNameText = selectService.name
        serviceImageName = selectService.systemImageName.rawValue
        serviceImageColor = selectService.imageColor.toUIColor()
    }
}
