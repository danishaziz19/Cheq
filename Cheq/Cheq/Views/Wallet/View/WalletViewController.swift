//
//  WalletViewController.swift
//  Cheq
//
//  Created by Danish Aziz on 20/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit

enum CardCellType: String{
    case cardCell = "cardCell"
}

class WalletViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadCollectionView()
    }
    
    func loadCollectionView() {
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        self.registerCells()
        cardCollectionView.reloadData()
    }
    
    func registerCells(){
        cardCollectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CardCellType.cardCell.rawValue)
    }
    
}

extension WalletViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        guard let cell: CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCellType.cardCell.rawValue, for: indexPath) as? CardCollectionViewCell  else {
                    return UICollectionViewCell()
        }
       // let source = self.magazines[indexPath.item]
       // cell.setCell(source: source)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize, height: 200)
        
    }
}
