//
//  DemoViewController.swift
//  MDNavigationBar_swift
//
//  Created by 张雁军 on 2017/5/18.
//  Copyright © 2017年 smlkts. All rights reserved.
//

import UIKit

class DemoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Title"
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.rowHeight = 60
        
        let header = UIImageView.init(image: UIImage.init(named: "img"))
        header.contentMode = .scaleAspectFill
        self.tableView.tableHeaderView = header
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 12
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationBarBackgroundColor = UIColor.white
        //pick one
        self.navigationBarBackgroundImage = UIImage.init(named: "barimg")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.fd_recoverNavigationBar()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        // 设置临界值 超过多少才开始渐隐/显示
        let threshold: CGFloat = 0
        // 设置完全透明/不透明需要滑动的距离
        //头部正好滑动到底部与导航栏底部对齐的时候 导航栏完全不透明
        let statusBarHeight = UIApplication.shared.statusBarFrame.height;
        let navigationBarHeight = self.navigationController?.navigationBar.bounds.height;
        let scrollHeight: CGFloat = (self.tableView.tableHeaderView?.bounds.height)! - statusBarHeight - navigationBarHeight!
        if offsetY > threshold {
            let alpha = min(1, (offsetY - threshold) / scrollHeight)
            self.fd_setNavigationBarAlpha(alpha: alpha)
        } else {
            self.fd_setNavigationBarAlpha(alpha: 0)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
