//
//  ListVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/01.
//

import UIKit

import SnapKit

class ListVC: UIViewController {
    //MARK: - Properties
    let backButton = UIButton()
    let collectionViewFlowLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        let cellWidth = UIScreen.main.bounds.width
        var cellHeight = UIScreen.main.bounds.height
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    var topLabel = UILabel()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
    //MARK: - IBOutlet
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configUI()
        setupCollectionView()
    }
    
    //MARK: - IBAction
    
    
    //MARK: - Custom Method
    private func setupLayout() {
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(collectionView)
        
        backButton.snp.makeConstraints { make in
            /// top -> leading -> bottom -> trailing
            make.top.equalToSuperview().offset(48)
            make.leading.equalToSuperview().offset(9)
            make.width.height.equalTo(36)
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(57)
            make.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(181)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
    }
    
    private func configUI() {
        backButton.setImage(UIImage(named: "backBtn"), for: .normal)
        
        topLabel.text = "한식"
        topLabel.textAlignment = .center
    }

    private func setupCollectionView() {
//        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionViewFlowLayout
        
        collectionView.setupCollectionViewNib(nib: ListCVC.identifier)
//        collectionView.register(ListCVC.self, forCellWithReuseIdentifier: "ListCVC")
        print("CVC 아직 안보여")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .darkGray
        
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: false)
    }
}


// MARK: - UICollectionViewDataSource
extension ListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCVC.identifier, for: indexPath) as? ListCVC else { return UICollectionViewCell() }
        
//        cell.backgroundColor = .systemPurple
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

// MARK: - UICollectionViewDelegate
extension ListVC: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
    }
}

extension UICollectionView {
    func setupCollectionViewNib(nib: String) {
        let customNib = UINib(nibName: nib, bundle: nil)
        self.register(customNib, forCellWithReuseIdentifier: nib)
    }
}
