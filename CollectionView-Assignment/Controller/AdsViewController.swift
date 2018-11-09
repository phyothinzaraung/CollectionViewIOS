//
//  AdsViewController.swift
//  CollectionView-Assignment
//
//  Created by Phyo Thinzar Aung on 11/5/18.
//  Copyright © 2018 padc. All rights reserved.
//

import UIKit

class AdsViewController: UIViewController {

    @IBOutlet weak var tblAdsDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblAdsDetails.delegate = self
        self.tblAdsDetails.dataSource = self
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AdsViewController : UITableViewDelegate {
    
}

extension AdsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdsDetailsTableViewCell", for: indexPath) as! AdsDetailsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
