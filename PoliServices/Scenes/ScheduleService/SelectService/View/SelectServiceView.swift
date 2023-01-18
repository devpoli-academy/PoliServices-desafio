import UIKit

class SelectServiceView: UIView {
    
    private lazy var selectServiceCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let layout = UICollectionViewFlowLayout()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: ServiceCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureSelectServiceCollectionView()
        
        additionalConfiguration()
    }
    
    private func configureSelectServiceCollectionView() {
        
        addSubview(selectServiceCollectionView)
        
        NSLayoutConstraint.activate([
            selectServiceCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            selectServiceCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            selectServiceCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),
            selectServiceCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func additionalConfiguration() {
        
        backgroundColor = .mainBackground
    }
    
    func configureCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        selectServiceCollectionView.delegate = delegate
        selectServiceCollectionView.dataSource = dataSource
    }
    
    func updateSelectServicesCollectionView() {
        
        selectServiceCollectionView.reloadData()
    }
}
