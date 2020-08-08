//
//  CalendarViewController.swift
//  TodoApp
//
//  Created by Risa Kojima on 2020/01/26.
//  Copyright © 2020 Kojima Lisa. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var dateLabel:UILabel!
    @IBOutlet var prevButton:UIButton!
    @IBOutlet var nextButton:UIButton!
    @IBOutlet var myCollectionView:UICollectionView!
    
    let now = Date()
    var cal = Calendar.current
    let dateFormatter = DateFormatter()
    var components = DateComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        cal.locale = Locale(identifier: "ja")
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/M"
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
        calculation()
        myCollectionView.backgroundColor = .black
    }
    
    func calculation() {
        let firstDayOfMonth = cal.date(from: components)
        dateLabel.text = dateFormatter.string(from: firstDayOfMonth!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 37
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!)
        
        //weekdayAdding: 1日が何曜日かで変わるindexPath.rowに加える値
        let weekdayAdding = 2 - firstWeekday
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)?.count
        //1日〜月末まで表示し、余ったCellは空白にする
        if (indexPath.row + weekdayAdding) >= 1 && (indexPath.row + weekdayAdding) <= daysCountInMonth! {
            cell.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            let label = UILabel()
            label.font = UIFont(name: "YuNa-FONT", size: 16)
            label.text = "\(indexPath.row + weekdayAdding)"
            label.sizeToFit()
            //label.center = cell.contentView.center
            label.frame = CGRect(x: 8, y: 4, width: label.frame.width, height: label.frame.height)
            cell.contentView.addSubview(label)
        } else {
            cell.backgroundColor = .none
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let myBoundSize: CGFloat = UIScreen.main.bounds.size.width
        let cellSize : CGFloat = myBoundSize / 7.5
        return CGSize(width: cellSize, height: cellSize * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //<前月 を押した時のAction
    @IBAction func myActionPrev(){
        components.month = components.month! - 1
        calculation()
        myCollectionView.reloadData()
    }
    
    //次月> を押した時のAction
    @IBAction func myActionNext(){
        components.month = components.month! + 1
        calculation()
        myCollectionView.reloadData()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
