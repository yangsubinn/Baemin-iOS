//
//  ListVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/01.
//

import UIKit
import SnapKit

//enum MenuStatus: Int {
//
//
//}

class ListVC: UIViewController {
    
    private lazy var categoriesCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(categoriesCVC.self, forCellWithReuseIdentifier: categoriesCVC.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    private var indicatorBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .black

        return view
    }()
    
    private lazy var alignCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .cyan
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(alignCVC.self, forCellWithReuseIdentifier: alignCVC.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()
    
    private lazy var listCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(ListCVC.self, forCellWithReuseIdentifier: ListCVC.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    //MARK: - Properties
    let backButton = UIButton()
//    let collectionViewFlowLayout: UICollectionViewLayout = {
//        let layout = UICollectionViewFlowLayout()
//        let cellWidth = UIScreen.main.bounds.width
//        var cellHeight = UIScreen.main.bounds.height
//        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//        layout.minimumLineSpacing = 0
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.scrollDirection = .horizontal
//        return layout
//    }()
    
    var categoryLabel = UILabel()
    var alignLabel = UILabel()
    
    let categories = ["한식", "분식", "카페·디저트", "돈까스·회·일식", "치킨", "피자", "아시안·양식", "중국집", "족발·보쌈", "야식", "찜·탕", "도시락", "패스트푸드"]
    let listLabels = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    let aligns = ["배달 빠른 순", "배달팁 낮은 순", "기본순", "주문 많은 순", "별점 높은 순", "가까운 순"]
    let categoriesCellLineSpacing: CGFloat = 20.0
    
    var topLabel = UILabel()
//    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
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
        
//        view.addSubviews([backButton, topLabel])
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(listCollectionView)
        view.addSubview(categoriesCollectionView)
        view.addSubview(alignCollectionView)
        view.addSubview(indicatorBarView)
        
        let labelSize = calcCategoryLabelSize(text: categories[0])
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.leading.equalToSuperview().offset(9)
            make.width.height.equalTo(36)
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(57)
            make.centerX.equalToSuperview()
        }
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        indicatorBarView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom)
            make.leading.equalToSuperview().offset(categoriesCellLineSpacing)
            make.width.equalTo(labelSize.width + 10)
            make.height.equalTo(4)
        }
        
        alignCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(listCollectionView.snp.top)
        }
        
        listCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(181)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func calcCategoryLabelSize(text: String) -> CGSize {
        categoryLabel.text = text
        categoryLabel.sizeToFit()

        return categoryLabel.bounds.size
    }
    
    func calcAlignLabelSize(text: String) -> CGSize {
        alignLabel.text = text
        alignLabel.sizeToFit()

        return alignLabel.bounds.size
    }
    
    private func configUI() {
        backButton.setImage(UIImage(named: "backBtn"), for: .normal)
        
        topLabel.text = "한식"
        topLabel.textAlignment = .center
    }

    private func setupCollectionView() {
//        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        collectionView.collectionViewLayout = collectionViewFlowLayout
//
        listCollectionView.setupCollectionViewNib(nib: ListCVC.identifier)
        alignCollectionView.setupCollectionViewNib(nib: alignCVC.identifier)
        categoriesCollectionView.setupCollectionViewNib(nib: categoriesCVC.identifier)
////        collectionView.register(ListCVC.self, forCellWithReuseIdentifier: "ListCVC")
//        print("CVC 아직 안보여")
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        collectionView.isPagingEnabled = true
//        collectionView.backgroundColor = .darkGray
//
        let indexPath = IndexPath(item: 0, section: 0)
        listCollectionView.scrollToItem(at: indexPath, at: .right, animated: false)
    }
    
}


// MARK: - UICollectionViewDataSource
extension ListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return listLabels.count
            
        case alignCollectionView:
            return aligns.count
        
        case listCollectionView:
            return listLabels.count
            
        default:
            return listLabels.count
        
        }
        
//        return listLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            guard  let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: categoriesCVC.identifier, for: indexPath) as? categoriesCVC else { return UICollectionViewCell() }
            
            cell.backgroundColor = .brown
            cell.categoryLabel.text = categories[indexPath.item]
            
            return cell
            
        case alignCollectionView:
            guard let cell = alignCollectionView.dequeueReusableCell(withReuseIdentifier: alignCVC.identifier, for: indexPath) as? alignCVC else { return UICollectionViewCell() }
            cell.backgroundColor = .clear
            cell.alignLabel.text = aligns[indexPath.item]
        
            return cell
        
        case listCollectionView:
            guard let cell = listCollectionView.dequeueReusableCell(withReuseIdentifier: ListCVC.identifier, for: indexPath) as? ListCVC else { return UICollectionViewCell() }
            
            cell.listLabel.text = listLabels[indexPath.item]
            cell.backgroundColor = .systemPurple
            
            return cell
            
        default:
            return UICollectionViewCell()
        
        }
//        guard let cell = listCollectionView.dequeueReusableCell(withReuseIdentifier: ListCVC.identifier, for: indexPath) as? ListCVC else { return UICollectionViewCell() }
//
//        cell.listLabel.text = listLabels[indexPath.item]
//
////        cell.backgroundColor = .systemPurple
//
//        return cell
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let size = calcLabelSize(text: categories[indexPath.row])
//
//        if collectionView == categoriesCollectionView {
//            print("-----------")
//            print("\(size.width), \(size.height)")
////            return CGSize(width: size.width + 10, height: size.height + 26)
//            return CGSize(width: size.width + 10, height: view.frame.height)
//        }
//        let height = UIScreen.main.bounds.height - (size.height + 26 + 3 + view.safeAreaInsets.top)
////        return CGSize(width: UIScreen.main.bounds.width, height: floor(height))
//
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
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

extension ListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoriesCollectionView {
            return 30 //10
        } else if collectionView == alignCollectionView {
            return 40
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == categoriesCollectionView {
            return UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        } else if collectionView == alignCollectionView {
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        }
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoriesCollectionView:
            let size = calcCategoryLabelSize(text: categories[indexPath.row])
            return CGSize(width: size.width + 10, height: size.height + 26)
            
        case alignCollectionView:
            let size = calcAlignLabelSize(text: aligns[indexPath.row])
            return CGSize(width: size.width + 10, height: size.height + 26)
            
        default:
            let size = calcCategoryLabelSize(text: categories[indexPath.row])
            let height = UIScreen.main.bounds.height - (size.height + 26 + 3 + view.safeAreaInsets.top)
            return CGSize(width: UIScreen.main.bounds.width, height: floor(height))
        }
        
//        let size = calcCategoryLabelSize(text: categories[indexPath.row])
//
//        if collectionView == categoriesCollectionView {
//            return CGSize(width: size.width + 10, height: size.height + 26)
//        }
//        let height = UIScreen.main.bounds.height - (size.height + 26 + 3 + view.safeAreaInsets.top)
//        return CGSize(width: UIScreen.main.bounds.width, height: floor(height))
    }
}
