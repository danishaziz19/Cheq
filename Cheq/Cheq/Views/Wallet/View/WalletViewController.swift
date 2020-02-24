//
//  WalletViewController.swift
//  Cheq
//
//  Created by Danish Aziz on 20/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit
import iOSDropDown

enum CardCellType: String{
    case cardCell = "cardCell"
    case expenseCell = "expenseCell"
}

class WalletViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var livingExpCollectionView: UICollectionView!
    @IBOutlet weak var dropDown : DropDown!
    
    let presenter: WalletPresenter = WalletPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupCollectionView()
        setupDropDown()
        loadData()
    }
    
    func loadData() {
        presenter.loadCards()
        presenter.loadLivingExpenses()
    }
    
    func setupCollectionView() {
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        
        livingExpCollectionView.dataSource = self
        livingExpCollectionView.delegate = self
        
        presenter.delegate = self
        
        registerCells()
    }
    
    func setupDropDown() {
        
        dropDown.listHeight = 350
        dropDown.optionArray = presenter.getMonths()
        
        dropDown.listWillAppear {
            self.dropDown.resignFirstResponder()
        }
        dropDown.selectedRowColor = UIColor.lightGray
        
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)")
        }
    }
    
    func registerCells() {
        cardCollectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CardCellType.cardCell.rawValue)
        livingExpCollectionView.register(UINib(nibName: "LivingExpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CardCellType.expenseCell.rawValue)
    }
}

extension WalletViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.cardCollectionView {
            return self.presenter.getCardCount()
        } else {
            return self.presenter.getLivingExpenseCount()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.cardCollectionView {
            guard let cell: CardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCellType.cardCell.rawValue, for: indexPath) as? CardCollectionViewCell  else {
                return UICollectionViewCell()
            }
            let source = self.presenter.getCard(row: indexPath.item)
            cell.setCell(card: source)
            return cell
        } else {
            guard let cell: LivingExpCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCellType.expenseCell.rawValue, for: indexPath) as? LivingExpCollectionViewCell  else {
                return UICollectionViewCell()
            }
            let source = self.presenter.getLivingExpense(row: indexPath.item)
            cell.setCell(livingExpense: source)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.cardCollectionView {
            let padding: CGFloat =  20
            let collectionViewSize = collectionView.frame.size.width - padding
            return CGSize(width: collectionViewSize, height: 200)
        } else {
            let padding: CGFloat =  10
            let collectionViewSize = (collectionView.frame.size.width / 2.0) - padding
            return CGSize(width: collectionViewSize, height: 180)
        }
    }
}

extension WalletViewController: WalletPresenterDelegate {
    
    func reload() {
        cardCollectionView.reloadData()
        livingExpCollectionView.reloadData()
    }
}

