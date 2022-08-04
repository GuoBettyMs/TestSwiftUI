//
//  TableCellView.swift
//  TastMode WatchKit Extension
//
//  Created by gbt on 2022/7/28.
//

import SwiftUI

extension AnyTransition {
    
    // MARK: asymmetric 复合过渡动画，使用不同的过渡进行插入和删除动画
    static var moveAndFade: AnyTransition {
        
        .move(edge: .trailing).combined(with: .opacity)         //同一侧滑入和滑出
//        .asymmetric(
//            insertion: .move(edge: .trailing).combined(with: .opacity),     //右移出现
//            removal: .scale.combined(with: .opacity)        //缩小消失
//        )

    }
}


//容器(VStack,HStack,ZStack)中的每个View都有它的alignment guide
struct TableCellView: View {
    
    // TableCellView 为子组件，TableView 为父组件，使用Binding 可对其创建双向连接
    // 父组件存在状态属性（ @StateObject var tableData），子组件需要使用 @Binding 装饰器来修改子组件中的属性，从而能够处理用户交互逻辑进行页面刷新
    @Binding var item: Item
    @Binding var items: [Item]
    
    var typeImg: String{
        switch item.typeName{
        case "K4":
            return "Watch-RedBtn"
        default:
            if item.state == "Offine" {
                return "Watch-UnBtn"
            }else{
                return "Watch-SearchBtn"
            }   
        }
    }

    
    var body: some View {

        ZStack{
            //渐变
//            LinearGradient(gradient: .init(colors: [Color(uiColor: .blue),Color(uiColor: .blue)]), startPoint: .leading, endPoint: .trailing)

            // MARK: delete item
            //在设计对齐相关的ui的时候，是对一组(group)中的多个view进行考虑的
            //alignment guide描述的是views之间的位置关系，如果该值和Container Alignment的参数不匹配，则不会生效
            //frame alignment guide 表示(VStack,HStack,ZStack)中views的对齐方式，把views看作一个整体进行布局
            HStack{

                Spacer()        //分隔符，即创建一个没有内容的自适应视图，该视图会展开以将图像和文本推送到堆栈的右侧
                
                if item.isSwiped{
                    Button(action:  {
                        withAnimation(.easeIn){
                            deleteItem()
                        }
                    }){
                        Image(typeImg)
                            .resizable()            //自动拉伸缩放
    //                        .resizable(capInsets: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 1), resizingMode: .stretch)         //调整图像大小以适应其空间的模式，capInsets指示 SwiftUI 不调整大小的图像部分的插入值；resizingMode指调整图像大小的模式。
                            .aspectRatio(contentMode: .fit)        //fill指通过缩放图像以填充整个视图来将图像填充到可用空间，从而在任何轴上都没有空白空间，fit指通过缩放图像以适应沿一个轴的视图大小来显示整个图像，可能会沿另一轴留下空白空间
                            .frame(maxWidth: 60 ,maxHeight: .infinity, alignment: .trailing)          //删除按钮整体右对齐
                            .cornerRadius(15)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(maxWidth: 60, maxHeight: .infinity, alignment: .trailing)          //删除按钮整体右对齐
                    .transition(.moveAndFade)           //过渡动画，右滑进入
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)

            
            // MARK: tableCellView
            HStack(spacing: 10){
                Image(item.img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)

//                //按钮计数器
//                Button(action: {
//                    item.state += 1
//                }, label: {
//                    Image(item.img)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 50, height: 50)
//                }).buttonStyle(PlainButtonStyle())

                //内部view向左对齐
                VStack(alignment: .leading) {
                    Text(item.typeName)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .allowsTightening(true)
                    

                    Text(item.userName)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .lineLimit(1)                   //文本最大行数为1
                        .allowsTightening(true)         //指示字符间距是否应收紧以使文本适合可用空间


//                    Text(getState(value: item.state))
//                        .font(.system(size: 16))
//                        .foregroundColor(.white)
//                        .lineLimit(1)
//                        .allowsTightening(true)
                    Text(item.state)
                        .font(.system(size: 16))
                        .foregroundColor(item.state == "Offine" ? .orange : .white)
                        .lineLimit(1)
                        .allowsTightening(true)
                }

            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 90, alignment: .leading)           //机型图片和文本 整体左对齐
            .padding()           //此视图的外边距增加相等填充量
            .contentShape(Rectangle())          //使用矩形来渲染视图
//            .background(RoundedCornersView(color: Color("BG"), topLeft: 15, topRight: 15, bottomLeft: 15, bottomRight: 15))
//            .background(Color(UIColor.blue))
            .background(Color("BG"))
            .cornerRadius(15)
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
   
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        
        
    }
    
    // MARK: 移动距离
    func onChanged(value: DragGesture.Value){
        if value.translation.width < 0{
            if item.isSwiped{
                item.offset = value.translation.width - 60
            }else{
                item.offset = value.translation.width
            }
        }
    }

    // MARK: 移动停止时的距离
    func onEnd(value: DragGesture.Value){
        
        withAnimation(.easeOut){
            if value.translation.width < 0{
                //UIScreen.main.bounds.width / 2
                if -value.translation.width > 300 {
                    item.offset = -400
                    deleteItem()
                    
                }else if -item.offset > 50{     //item向左移动
                    item.isSwiped = true
                    item.offset = -60
                    
                    //延时一定时间后item向右移动
                    withAnimation(.easeOut(duration: 1).delay(1)){
                        item.isSwiped = false
                        item.offset = 0
                    }
                    
                }else{
                    item.isSwiped = false
                    item.offset = 0
                }
            }else{
                item.isSwiped = false           //item向右移动
                item.offset = 0
            }
        }
    }
    
    // MARK: 删除
    func deleteItem(){
        items.removeAll { (item) -> Bool in
            return self.item.id == item.id
        }
    }

    // MARK: float 转换为 string
    func getState(value: Float) -> String {
        
        let format = NumberFormatter()
    //    format.numberStyle = .currency
        format.numberStyle = .none
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }

}
