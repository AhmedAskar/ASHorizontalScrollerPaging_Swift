# ASHorizontalScrollerPaging_Swift
========================
A very simple control to display some screens for the first launch of your application or as an Image Gallery


![ASHorizontalScrollerPaging_Swift](https://github.com/AhmedAskar/ASHorizontalScrollerPaging_Swift/blob/master/Shoot2.png)


To use the ASHorizontalScrollerPaging please do the following:

# Usage

Add the following lines of code to your ViewDidLoad:
```
//set ScrollView Height
self.viewHeight = self.view.height * 0.6
self.scroller = ASHorizontalScroller(frame: CGRectMake(VIEWS_OFFSET, VIEW_PADDING_DEFAULT, self.view.width, viewHeight))
self.scroller.dataSource = self
self.scroller.delegate = self
self.scroller.scrollWidth = self.view.frame.size.width
self.scroller.scrollHeight = viewHeight
self.view!.addSubview(scroller)

```

Then check the sample you will find what you need

# Note
You can display this sample eighter with images or colors

# License

This code is licensed under the terms of the MIT License.

[@AhmedAskar](https://www.linkedin.com/in/ahmed-askar-8a093244?trk=hp-identity-photo)
