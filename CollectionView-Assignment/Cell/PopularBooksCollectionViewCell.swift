//
//  PopularBooksCollectionViewCell.swift
//  CollectionView-Assignment
//
//  Created by Phyo Thinzar Aung on 11/4/18.
//  Copyright © 2018 padc. All rights reserved.
//

import UIKit

protocol PopularBookDelegate {
    func seeMoreTap ()
}

class PopularBooksCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblPopularBooks: UILabel!
    @IBOutlet weak var collectionViewPopularBooks: UICollectionView!
    @IBOutlet weak var btnSeeMore: UIButton!
    
    var delegate : PopularBookDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionViewPopularBooks.delegate = self
        self.collectionViewPopularBooks.dataSource = self
        
        CellRegisterUtil.registerCell(nibName: "BookCollectionViewCell", collectionView: collectionViewPopularBooks)
        
        //tap like
        btnSeeMore.isUserInteractionEnabled = true
        btnSeeMore.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.seemoreTap(gesture:))))
    }
    
    @objc func  seemoreTap(gesture: UIGestureRecognizer) {
        delegate?.seeMoreTap()
    }

}

extension PopularBooksCollectionViewCell : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewPopularBooks.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        return cell
    }
    
    
}

extension PopularBooksCollectionViewCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 90, height: 120
        )
    }
}
