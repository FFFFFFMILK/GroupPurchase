# GroupPurchase
itcast, 控件练手：UITableView，自定义 xib cell，UIScrollView，UIpageControl

项目练习：团购页面

练习重点：

UI 布局：
1. 图片轮播器
2. tableview 使用自定义的 xib cell

代码构建顺序：

1. 构建 tableview
2. xib 构建 tableviewcell
3. 构建相应的 model 存放数据
4. 完成 tableview 的 datasource 相关的代理方法 
5. 构建图片轮播器：ScrollView + PageControl，作为 tableview 的 headerview
6. 构建底部【加载更多】按钮：作为 footerView

代码知识点：

1. xib 的载入需要从 NSBundle 中取出：
    GroupFooterView *footerView = [[[NSBundle mainBundle]loadNibNamed:@"GroupFooterView" owner:nil options:nil]firstObject];

2. 使用 xib 自定义 tableviewcell：
	在 xib 中设置重用标识符

3. 使用 GCD 延迟执行代码

4. tableview 插入新行
	[_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];

5. tableview 滚动到最后一行
	[_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

6. 设置 pagecontrol
	设置当前页
	设置小圆点的两种颜色
	设置共有多少页

7. 设置 scrollview
	设置代理
	开启分页模式
	关闭水平拉条
	设置 contentSize 

8. 关联 pagecontrol 和 scrollview
	-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    	_pageControl.currentPage = scrollView.contentOffset.x / self.frame.size.width;
	}

9. UIActivityIndicatorView 的使用
	加载小菊花：开启动画 startAnimating 和停止动画 stopAnimating

10. 当把 view 单独抽离出来之后，如果有涉及到其他控件的代码，最好不要引入各种变量自己实现，而应该是设置一个协议，让控制器去实现细节

