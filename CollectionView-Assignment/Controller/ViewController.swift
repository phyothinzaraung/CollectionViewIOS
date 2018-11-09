//
//  ViewController.swift
//  CollectionView-Assignment
//
//  Created by Phyo Thinzar Aung on 11/4/18.
//  Copyright © 2018 padc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        
        
        registerCell()
    }
    
    func registerCell(){
        CellRegisterUtil.registerCell(nibName: "AdsCollectionViewCell", collectionView: mainCollectionView)
        CellRegisterUtil.registerCell(nibName: "PopularBooksCollectionViewCell", collectionView: mainCollectionView)
        CellRegisterUtil.registerCell(nibName: "ArticlesCollectionViewCell", collectionView: mainCollectionView)
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1 {
            return 1
        }else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as! AdsCollectionViewCell
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularBooksCollectionViewCell", for: indexPath) as! PopularBooksCollectionViewCell
            cell.delegate = self
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCollectionViewCell", for: indexPath) as! ArticlesCollectionViewCell
            return cell
        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let navigationcontroller = self.storyboard?.instantiateViewController(withIdentifier: "AdsViewController") as! UINavigationController
            self.present(navigationcontroller, animated: true, completion: nil)
        }else if indexPath.section == 1 {
            let navigationcontroller = self.storyboard?.instantiateViewController(withIdentifier: "AdsViewController") as! UINavigationController
            self.present(navigationcontroller, animated: true, completion: nil)
        }else if indexPath.section == 2{
            let navigationcontroller = self.storyboard?.instantiateViewController(withIdentifier: "AdsViewController") as! UINavigationController
            self.present(navigationcontroller, animated: true, completion: nil)
        }
    }
}

extension ViewController : PopularBookDelegate {
    func seeMoreTap() {
        //tap like
        let navigationcontroller = self.storyboard?.instantiateViewController(withIdentifier: "AdsViewController") as! UINavigationController
        self.present(navigationcontroller, animated: true, completion: nil)
    }
    
    
}
