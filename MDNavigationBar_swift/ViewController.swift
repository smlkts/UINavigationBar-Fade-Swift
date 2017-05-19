//
//  ViewController.swift
//  MDNavigationBar_swift
//
//  Created by 张雁军 on 2017/5/18.
//  Copyright © 2017年 smlkts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "点击空白push到下一个页面"
        self.navigationItem.prompt = "I'm prompt"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = DemoViewController.init(style: .plain)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

