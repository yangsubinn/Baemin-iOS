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
    let categories = ["한식", "분식", "돈까스·회·일식", "치킨", "피자", "아시안·양식", "중국집", "족발·보쌈", "야식", "찜·탕", "도시락", "카페·디저트", "패스트푸드"]
    let listLabels = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    let aligns = ["배달 빠른 순", "배달팁 낮은 순", "기본순", "주문 많은 순", "별점 높은 순", "가까운 순"]
    let categoriesCellLineSpacing: CGFloat = 20.0
    
    var categoryLabel = UILabel()
    var alignLabel = UILabel()
    var topLabel = UILabel()
    
    private lazy var categoriesCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(categoriesCVC.self, forCellWithReuseIdentifier: categoriesCVC.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    private var indicatorBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 2

        return view
    }()
    
    private lazy var alignCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
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
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(ListCVC.self, forCellWithReuseIdentifier: ListCVC.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configUI()
        setupCollectionView()
    }

    //MARK: - Custom Method
    private func setupLayout() {
        
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
    
    func wrapAndGetCell(viewColtroller: UIViewController, cell: ListCVC) -> ListCVC {
        viewColtroller.view.tag = ListCVC.SUBVIEW_TAG
        cell.contentView.addSubview(viewColtroller.view)

        /// 코드 쇽샥..
        /// 다른 UIViewController, PageViewController 등의 컨테이너 뷰컨에서 다른 UIViewController가 추가, 삭제된 후에 호출된다.
        /// 인자로 부모 뷰컨을 넣어서 호출해줌..
        /// 자식 뷰컨이 부모 뷰컨으로부터 추가, 삭제되는 상황에 반응할 수 있도록.

        viewColtroller.didMove(toParent: self)
        return cell
    }
    
    private func configUI() {
        view.backgroundColor = .white
        backButton.setImage(UIImage(named: "backBtn"), for: .normal)
        
        topLabel.text = "한식"
        topLabel.textAlignment = .center
        topLabel.textColor = .black
    }

    private func setupCollectionView() {
        listCollectionView.setupCollectionViewNib(nib: ListCVC.identifier)
        alignCollectionView.setupCollectionViewNib(nib: alignCVC.identifier)
        categoriesCollectionView.setupCollectionViewNib(nib: categoriesCVC.identifier)

        let indexPath = IndexPath(item: 0, section: 0)
        listCollectionView.scrollToItem(at: indexPath, at: .right, animated: false)
        categoriesCollectionView.scrollToItem(at: indexPath, at: .right, animated: false)
    }
    
    func scrollToCategory(to index: Int) {
        categoriesCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        collectionView(categoriesCollectionView, didSelectItemAt: IndexPath(row: index, section: 0))
    }
}


// MARK: - UICollectionViewDataSource
extension ListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categories.count
            
        case alignCollectionView:
            return aligns.count
        
        case listCollectionView:
            return listLabels.count
            
        default:
            return listLabels.count
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            guard  let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: categoriesCVC.identifier, for: indexPath) as? categoriesCVC else { return UICollectionViewCell() }
            
            cell.backgroundColor = .clear
            cell.categoryLabel.text = categories[indexPath.item]
            
            return cell
            
        case alignCollectionView:
            guard let cell = alignCollectionView.dequeueReusableCell(withReuseIdentifier: alignCVC.identifier, for: indexPath) as? alignCVC else { return UICollectionViewCell() }
            cell.backgroundColor = .clear
            cell.alignLabel.text = aligns[indexPath.item]
        
            return cell
        
        case listCollectionView:
            guard let cell = listCollectionView.dequeueReusableCell(withReuseIdentifier: ListCVC.identifier, for: indexPath) as? ListCVC else { return UICollectionViewCell() }
            
            cell.backgroundColor = .white

            return cell
            
        default:
            return UICollectionViewCell()
        
        }
    }
}

// MARK: - UICollectionViewDelegate
extension ListVC: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let idx = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        scrollToCategory(to: idx)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            listCollectionView.isPagingEnabled = false
            listCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            listCollectionView.isPagingEnabled = true
            
            categoriesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            topLabel.text = categories[indexPath.item]

            guard let cell = categoriesCollectionView.cellForItem(at: indexPath) as? categoriesCVC else { return }
            
            print("------------------------------------------------")
            print("indexPath.item: \(categories[indexPath.item])")
            print(categories.firstIndex(of: categories[indexPath.item]) ?? 0)
            
            var index = categories.firstIndex(of: categories[indexPath.item]) ?? 0
            
            if index < 3 {
                indicatorBarView.snp.remakeConstraints { make in
                    make.top.equalTo(cell.snp.bottom).inset(15)
                    make.leading.equalTo(cell.snp.leading)
                    make.width.equalTo(cell.snp.width)
                    make.height.equalTo(3)
                }
            } else if index > 10 {
                indicatorBarView.snp.remakeConstraints { make in
                    make.top.equalTo(cell.snp.bottom).inset(15)
                    make.leading.equalTo(cell.snp.leading)
                    make.width.equalTo(cell.snp.width)
                    make.height.equalTo(3)
                }
            } else {
                indicatorBarView.snp.remakeConstraints { make in
                    make.top.equalTo(cell.snp.bottom).inset(15)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(cell.snp.width)
                    make.height.equalTo(3)
                }
            }

            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
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
            return 20
        } else if collectionView == alignCollectionView {
            return 40
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == categoriesCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)            
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
    }
}
