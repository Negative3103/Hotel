//
//  ImagesDataProvider.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 12/09/23.
//

import UIKit
import SkeletonView

final class ImagesDataProvider: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets
    weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.showAnimatedSkeleton()
        }
    }
    
    //MARK: = Atteibutes
    weak var viewController: UIViewController?
    internal var items = [String]() {
        didSet {
            if !items.isEmpty { collectionView.hideSkeleton() }
            collectionView.reloadData()
        }
    }
    
    //MARK: = Lifecycles
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? ImagesCollectionViewCell else { return UICollectionViewCell() }
        cell.imgView.setImage(with: items[indexPath.row])
        return cell
    }
    
    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width , height: collectionView.bounds.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let vc = viewController as? HotelViewController else { return }
        let offSet = scrollView.contentOffset.x/scrollView.bounds.width
        vc.view().pageControl.progress = CGFloat(offSet)
    }
}

//MARK: - SkeletonCollectionViewDataSource
extension ImagesDataProvider: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return ImagesCollectionViewCell.defaultReuseIdentifier
    }
}
