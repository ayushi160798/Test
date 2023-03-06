//
//  DetailViewController.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    @IBOutlet weak var imgView: UIImageView!
    
    var articleInfo: Article?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        lblTitle.text = articleInfo?.title
        lblName.text = articleInfo?.source?.name
        lblDate.text = articleInfo?.publishedAt
        lblDescription.text = articleInfo?.description
        if let url = URL(string: articleInfo?.urlToImage ?? "") {
            if let data = try? Data(contentsOf: url){
                imgView.image = UIImage(data: data)
            }
        }
    }
}
