//
//  WrappedLayoutView.swift
//  TastMode WatchKit Extension
//
//  Created by gbt on 2022/7/29.
//

import SwiftUI

struct TestWrappedLayoutView: View {
    let w: CGFloat = 350.0
    var texts: [String]

    var body: some View {
        self.generateContent(in: w)
    }

    private func generateContent(in w: CGFloat) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.texts, id: \.self) { t in
                self.item(for: t)
                    .padding([.trailing, .bottom], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                     
                        if (abs(width - d.width) > w)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if t == self.texts.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if t == self.texts.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }

    func item(for text: String) -> some View {
        Text(text)
            .padding([.leading, .trailing], 8)
            .frame(height: 30)
            .font(.subheadline)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(15)
            .onTapGesture {
                print("你好啊")
        }
    }
}
