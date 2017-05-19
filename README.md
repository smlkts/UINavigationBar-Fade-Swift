# MDNavigationBar_swift
UINavigationBar fade inout when scrolling

[简书链接](http://www.jianshu.com/p/659debfe0493)
- 这是一个UIViewController的category，实现当scrollview滚动时其所属UINavigationController的NavigationBar渐隐的效果
- 解决
1.很多第三方库在iOS7以上右滑返回之后就会错乱的问题
2.可以同时存在prompt
3.可以使用image或颜色做导航栏背景

 ![](https://github.com/smlkts/MDNavigationBar_swift/raw/master/01.gif) 
 ![](https://github.com/smlkts/MDNavigationBar_swift/raw/master/02.gif)

 - 用法
```swift
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

```
