//
//  ViewController.swift
//  图片轮播Demo
//
//  Created by liuhang on 17/6/14.
//  Copyright © 2017年 liuhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var leftImageView: UIImageView = UIImageView()
    var centerImageView: UIImageView = UIImageView()
    var rightImageView: UIImageView = UIImageView()
    var iamges:[String] = ["image0","image1","image2","image3"]
    var currentImageIndex = 0
    
    
    //MARK: 懒加载
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.delegate = self
        self.view.addSubview(scroll)
        return scroll
    }()
        override func viewDidLoad() {
        super.viewDidLoad()
            scrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: 300)
            
            leftImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300)
            leftImageView.image = UIImage(named: iamges[(currentImageIndex+iamges.count-1) % iamges.count])
            
            centerImageView.frame = CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 300)
            centerImageView.image = UIImage(named: iamges[currentImageIndex])
            rightImageView.frame = CGRect(x: self.view.frame.size.width * 2, y: 0, width: self.view.frame.size.width, height: 300)
            rightImageView.image = UIImage(named: iamges[(currentImageIndex+iamges.count+1) % iamges.count])
            
            scrollView.addSubview(leftImageView)
            scrollView.addSubview(centerImageView)
            scrollView.addSubview(rightImageView)
            
            scrollView.contentOffset.x = scrollView.frame.size.width
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //左滑
        if scrollView.contentOffset.x == 0 {
            scrollView.contentOffset.x = scrollView.frame.size.width
            currentImageIndex = (currentImageIndex+iamges.count - 1) % iamges.count
            leftImageView.image = UIImage(named: iamges[(currentImageIndex-1+iamges.count) % iamges.count])
            centerImageView.image = UIImage(named: iamges[currentImageIndex])
            rightImageView.image = UIImage(named: iamges[(currentImageIndex+1+iamges.count) % iamges.count])
            
            return
        }
        //右滑
        if scrollView.contentOffset.x == (scrollView.frame.size.width*2) {
            scrollView.contentOffset.x = scrollView.frame.size.width
            currentImageIndex = (currentImageIndex+iamges.count + 1) % iamges.count
            leftImageView.image = UIImage(named: iamges[(currentImageIndex-1+iamges.count) % iamges.count])
            centerImageView.image = UIImage(named: iamges[currentImageIndex])
            rightImageView.image = UIImage(named: iamges[(currentImageIndex+1+iamges.count) % iamges.count])
            
            return
        }
    }
}

