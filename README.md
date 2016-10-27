# testAnim



动画技术：

1.UIView上的动画：
	1.通过显式调用的方式：
		[UIview beginAnimation]
		[UIView commitAnimation]
		期间可设代理,动画时间回调函数，过渡速度曲线，是否自动反向，过渡效果等
		[UIView setAnimationDuration]
		[UIView setAnimationDelegate]
		[UIView setAnimationDidStopSelector]
		[UIview setAnimationCurve]
		[UIView setAnimationRepeatAutoreserves]
		[UIView setAnimationTransition]
		
	2.通过块方式：
		[UIView animationWithDuration]
	
	3.普通提交方式过渡动画
		[UIView setAnimationTransition:]
		
	4.针对过渡动画专门设计的两个函数(4.0以后)
		[UIView transitionWithView]
		[UIView transitionFromView]
		
		
2.Layer上的动画：
	1.显式增加的普通方式：
		CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:]
		[layer addAnimation:anim]
		可以设置持续时间，from,to值，重复次数
		
	2.关键桢动画：
		1.通过普通方式：
			CAKeyframeAnimation *anim =[CAKeyframeAnimation animationWithKeyPath]
			anim.values = []
			anim.keyTimes = []
			[layer addAnimation:anim]
			
		2.通过path的方式增加动画：
			CAKeyframeAnimation *anim =[CAKeyframeAnimation animationWithKeyPath]
			[anim setPath]
			[layer addAnimation:anim]
			
	3.动画组，可以使多个动画同时运行
			CAAnimationGroup* group = [CAAnimationGroup animation];
			group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, nil];
			[myLayer addAnimation:group forKey:@"BorderChanges"];
			
	4.渐变动画
		CATransition* transition = [CATransition animation];
		transition.type = kCATransitionPush;
		[myView1.layer addAnimation:transition forKey:@"transition"];

3.ViewController切换时的动画：
	1.普通切换：需要实现UIViewControllerAnimatedTransitioning协议
	2.模态切换：需要实现UIViewControllerTransitioningDelegate协议
	
4.力学和运动效果
	请参考UIDynamicAnimator,UIInteerpolatingMotionEffect类
