//
//  CollectionViewController.swift
//  demo
//
//  Created by Jason on 2020/11/30.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

let bgcolor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

let kScreenHeight = UIScreen.main.bounds.size.height

let kScreenWidth = UIScreen.main.bounds.size.width

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController {

    var selectedCell: CollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    
    var selectedCellFrame: CGRect = .zero
    var afterRect: CGRect = .zero

    var dataSource: [CellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")

        dataSource = [
            .init(image: #imageLiteral(resourceName: "7"), title: "Seychelles"),
            .init(image: #imageLiteral(resourceName: "1"), title: "Königssee"),
            .init(image: #imageLiteral(resourceName: "3"), title: "Zanzibar"),
            .init(image: #imageLiteral(resourceName: "7"), title: "Serengeti"),
            .init(image: #imageLiteral(resourceName: "4"), title: "Castle"),
            .init(image: #imageLiteral(resourceName: "2"), title: "Kyiv"),
            .init(image: #imageLiteral(resourceName: "turtlerock"), title: "Munich"),
            .init(image: #imageLiteral(resourceName: "1"), title: "Lake")
        ]
        
        collectionView.reloadData()
        collectionView.backgroundColor = bgcolor
        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.configure(dataSource[indexPath.item])
    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0,1:
            push(indexPath: indexPath)
        default:
            pushs(indexPath: indexPath)
        }
        return
        
        let height = kScreenWidth / 2 * 3

        afterRect = CGRect(x: 0, y: 0, width: kScreenWidth, height: height)

        selectedCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        selectedCellImageViewSnapshot = selectedCell?.snapshotView(afterScreenUpdates: false)
        if let cell = selectedCell {
            selectedCellFrame = cell.convert(cell.bounds, to: self.view)
        }
        let firstView = self.navigationController?.view.snapshotView(afterScreenUpdates: true)
        let vc = SecondViewController.init(selectedCellSnapshot: selectedCellImageViewSnapshot!, cellSelectedRect: selectedCellFrame, cellAfterRect: afterRect, selectedImage: (selectedCell?.imageView)!, firstView: firstView!)
        vc.data = dataSource[indexPath.row]
        self.present(vc, animated: true, completion: nil)

    }
    
    func push(indexPath: IndexPath) {
        //        UIAlertAction
        //        UIAlertViewStyle
        var style: UIAlertController.Style = .alert
        switch indexPath.row {
        case 0:
            style = .alert
        default:
            style = .actionSheet
        }

        let vc = UIAlertController.init(title: "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle", message: "messagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessage", preferredStyle: style)
        let cance = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        let sure = UIAlertAction.init(title: "设置", style: .default, handler: nil)
        let other = UIAlertAction.init(title: "其他", style: .destructive, handler: nil)
        vc.addAction(cance)
        vc.addAction(sure)
//        vc.addAction(other)
        present(vc, animated: true, completion: nil)

    }
    
    func pushs(indexPath: IndexPath) {
        var title: String = ""
        var message: String = ""
        var vc: AlertViewController

        switch indexPath.row {
        case 2:
            title = "标题"
            message = "描述"
            vc = AlertViewController.init(title: title, message: message, preferredStyle: .alert)
        case 3:
            title = "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"
            message = "描述"
            vc = AlertViewController.init(title: title, message: message, preferredStyle: .alert)
        case 4:
            title = "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"
            message = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
            vc = AlertViewController.init(title: title, message: message, preferredStyle: .actionSheet)
        case 5:
            title = ""
            message = "描述"
            vc = AlertViewController.init(title: title, message: message, preferredStyle: .alert)
        default:
            let message1 = NSMutableAttributedString.init(string: "免费使用\n", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: UIColor(hex: 0x333333)])
            let count1 = NSAttributedString.init(string: "\(10)", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: UIColor(hex: 0xE9302D)])
            message1.append(count1)
            let message2 = NSAttributedString.init(string: "次，", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: UIColor(hex: 0x333333)])
            message1.append(message2)
            let vipMessage = NSAttributedString.init(string: "开通VIP无限使用", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: UIColor(hex: 0xE9302D)])
            message1.append(vipMessage)
            vc = AlertViewController.init(customMessage: message1, preferredStyle: .alert)
        }
        let canse = AlertAction.init(title: "取消", style: .cancel, handler: nil)
        let sure = AlertAction.init(title: "确定", style: .default, handler: nil)
        vc.addAction(canse)
        vc.addAction(sure)
        present(vc, animated: true, completion: nil)
    }
    
}
