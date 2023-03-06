//
//  HeadLineViewController.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import UIKit

class HeadLineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var userInfoList: HeadLineResponseModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HeadLineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoList?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeadLineTableViewCell
        let data = userInfoList?.articles?[indexPath.row]
        cell.lblName.text = data?.source?.name
        cell.lblTitle.text = data?.title
        cell.lblDate.text = data?.publishedAt
        if let url = URL(string: data?.urlToImage ?? "") {
            if let data = try? Data(contentsOf: url){
                cell.viewImage.image = UIImage(data: data)
            }
            
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = userInfoList?.articles?[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController" ) as! DetailViewController
        vc.articleInfo = selectedData
        self.navigationController?.pushViewController(vc, animated: true)
            
    }
    
}
