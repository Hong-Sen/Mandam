//
//  CommunityRowView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/21.
//

import SwiftUI

struct CommunityRowView: View {
//    @ObservedObject var op : OpinionList = OpinionList()
    var op: Opinion = Opinion(age: .teenager, relationship: .friend, opinion: "너 mbti가 어떻게 돼?", like: 3)
    @State var isPressLike: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Text(op.age.rawValue)
                Text(" / ")
                Text(op.relationship.rawValue)
                Spacer()
            }
            
            Spacer()
                .frame(width: 10, height: 30, alignment: .center)
            
            HStack{
                Text(op.opinion.uppercased())
                    .bold()
                Spacer()
                Button {
                    isPressLike = !isPressLike
//                    op.updateLikeCnt(day: op.opinionList[index].timestamp)
                } label: {
                    Image(systemName: isPressLike ? "hand.thumbsup.fill" : "hand.thumbsup")
                }
                Text("\(op.like)")

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
