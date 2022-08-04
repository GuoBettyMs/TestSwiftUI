

//官方图标下载地址  https://developer.apple.com/sf-symbols/
/**
 .resizable() to resize the image and adjust to the .frame() dimensions
 .frame() to set its width/height
 .clipShape() to set a clipping shape
 .border() to set the color of the border
 .overlay() to layer another view in front of it
 .aspectRatio() to set the aspect ratio
 .clipped() to cut off the image outside of the frame
 */

import SwiftUI

struct TestImageView: View {
    var body: some View {
        List{
            createSystemImage()
            createBasicImageEffect()
            createImageBlur()
            createImageBrightness()
            createImageColor()
            createImageColorMultiply()
            createImageContrast()

            createImageColorRotation()
            createImageSaturation()
            createImageGrayColor()
        }
    }
    
    /// 系统图标 系统图标可以设置对应的字体
    func createSystemImage() -> some View {
        VStack(alignment: .leading, spacing: 5){
            Text("系统图标").padding(.bottom)
            HStack{
                Image(systemName: "square.and.arrow.up").foregroundColor(.primary)
                    .font(.system(.largeTitle))

                Image(systemName: "sun.min").foregroundColor(.red).font(.system(size: 30))

                Image(systemName: "timelapse")
                    .foregroundColor(.green)
                    .font(.system(size: 30))
                
                Image(systemName: "figure.stand.line.dotted.figure.stand")
                    .foregroundColor(.pink)
                    .font(.system(size: 30))

                Image(systemName: "person.2.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 40))
                
                Image(systemName: "person.crop.circle")
                    .foregroundColor(.primary)
                    .font(.system(size: 40))
            }
        }
    }
    
    func createBasicImageEffect() -> some View {
        VStack(alignment:.leading){
            Text("基本圆角 阴影设置")
            HStack{
                Image("user_header_1")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                
                Image("user_header_2")
                    .resizable()
                    .cornerRadius(5)
                    .border(.red,width: 3)
                    .aspectRatio(1, contentMode: .fit)
                
                Image("user_header_1")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                    .border(.red,width: 3)
                //resizable 自动缩放
                //frame必须在resizable之后调用 否则设置无效
                //aspectRatio 可以设置宽高比和图片的填充模式
                //clipShape 对图片进行裁剪 设置为圆形 矩形等
                //overlay 添加其他layer 到图片上
            }
            HStack{
                Image("user_header_1")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.blue,lineWidth: 5))
                    .overlay(Text("❤️"), alignment: .bottom)
                
                Image("user_header_2")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                    .shadow(color: .blue, radius: 5, x: 2, y: 0)
                    .overlay(Image(systemName: "snowflake").foregroundColor(.red).font(.system(size: 20)), alignment: .topLeading)
                
                Image("user_header_1")
                    .resizable()
                    .cornerRadius(5)
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(color: .primary, radius: 5, x: 0, y: 2)
            }
        }
    }
    
    /// 模糊处理
    func createImageBlur() -> some View {
        VStack(alignment: .leading){
            /// blur 设置模糊 半径越大 模糊效果越明显 opaque是否透明
            Text("模糊效果")
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .blur(radius: 1)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .blur(radius: 2)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .blur(radius: 3,opaque: true)
            }

        }
    }
    
    /// 亮度处理
    func createImageBrightness() -> some View {
        /// 设置图片亮度 负值 变黑 正值 变亮
        VStack(alignment: .leading){
            Text("亮度设置")
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .brightness(0.2)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .brightness(0.3)
            }
        }
    }
    
    /// 颜色反转
    func createImageColor() -> some View {
        VStack(alignment: .leading){
            Text("颜色反转")
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
            }
            
            /// 设置图片亮度 负值 变黑 正值 变亮
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .colorInvert()
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .colorInvert()
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .colorInvert()
            }

        }
    }
    
    /// 颜色偏向设置
    func createImageColorMultiply() -> some View {
        VStack(alignment: .leading){
            Text("颜色偏向设置")
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
            }
            
            /// 设置图片亮度 负值 变黑 正值 变亮
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .colorMultiply(.red)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .colorMultiply(.blue)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .colorMultiply(.pink)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .cornerRadius(5)
                    .colorMultiply(.yellow)
            }

        }
    }
    
    /// 颜色乘差设置
    func createImageContrast() -> some View {
        VStack(alignment: .leading){
            Text("颜色乘差设置")
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .contrast(-1)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .contrast(-0.5)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .contrast(1)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .contrast(1.5)
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .contrast(2)
            }
        }
    }
    
    /// 颜色旋转
    /// 色调旋转效果很根据您指定的角度移动视图中的所有颜色，
    /// 如果将色调旋转 360 度，则和原色一样
    func createImageColorRotation() -> some View {
        VStack(alignment: .leading){
            Text("颜色旋转设置")
            HStack{
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .hueRotation(Angle.degrees(45))
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .hueRotation(Angle.degrees(90))
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .hueRotation(Angle.degrees(120))
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .hueRotation(Angle.degrees(150))
                
                Image("user_header_1")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .hueRotation(Angle.degrees(270))
            }
        }
    }
    
    /// 增加颜色饱和度
    /// 参数值大于 1 时，增加色彩的饱和度，参数值等于 1 时，饱和度和原色相同，
    /// 参数值为 0 时，会清除图形里面的彩色信息，仅包含灰度信息
    func createImageSaturation() -> some View {
        VStack(alignment: .leading){
            Text("增加颜色饱和度")
            HStack{
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .saturation(0)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .saturation(1)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .saturation(2)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .saturation(10)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .saturation(20)
            }
        }
    }
    
    /// 灰度值设置
    /// 参数量：灰度的强度从 0.0 到小于 1.0。接近 0.0 的值颜色更鲜艳，而接近 1.0 的值颜色较少
    func createImageGrayColor() -> some View {
        VStack(alignment: .leading){
            Text("灰度值设置")
            HStack{
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .grayscale(0)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .grayscale(1)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .grayscale(2)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .grayscale(10)
                
                Image("user_header_2")
                    .resizable()
                    .aspectRatio(3/4.0, contentMode: .fit)
                    .grayscale(20)
            }
        }
    }
}
