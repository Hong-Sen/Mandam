//
//  CommunityRowView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/21.
//

import SwiftUI

struct CommunityRowView: View {
    @ObservedObject var op : OpinionList = OpinionList()
    @State var isPressLike: Bool = false
    var index: Int = 0
    
    var body: some View {
        VStack{
            HStack{
                Text(op.opinionList[index].age.rawValue)
                Text(" / ")
                Text(op.opinionList[index].relationship.rawValue)
                Spacer()
            }
            
            Spacer()
                .frame(width: 10, height: 30, alignment: .center)
            
            HStack{
                Text(op.opinionList[index].opinion)
//                    .font(.system(weight: .bold))
                Spacer()
                Button {
                    isPressLike = !isPressLike
                    op.updateLikeCnt(day: op.opinionList[index].timestamp)
                } label: {
                    Image(systemName: isPressLike ? "hand.thumbsup.fill" : "hand.thumbsup")
                }
                Text("\(op.opinionList[index].like)")

            }
        }
        .padding()
        .background(.regularMaterial)
    }
}

struct CommunityRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityRowView()
    }
}
