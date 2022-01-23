//
//  FilterView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/17.
//

import SwiftUI

struct filterBtn {
    var name: String
    var kind: String
    var isSelected: Bool
}

enum AgeCategory:String, CaseIterable {
    case teenager = "10대"
    case Earlytwenties = "20대 초반"
    case Midtwenties = "20대 후반"
    case thirties = "30대"
    case fourties = "40대"
}

enum RelationshipCategory:String, CaseIterable {
    case friend = "친구"
    case blindDate = "소개팅"
    case seniorsNJuniors = "선후배"
    case colleague = "동료"
    case priesthood = "사제지간"
}

struct FilterView: View {
    @Binding var isShowFilter: Bool
    var ageState = AgeCategory.teenager

    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        NavigationView {
            VStack{
                VStack(alignment: .leading) {
                    Divider()
                    Text("나이")
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading, 30)
                        .padding(.vertical, 20)
                    
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(AgeCategory.allCases, id: \.self) { i in
                            customCategory(text: i.rawValue)
                        }
                    }
                    .padding(.vertical)
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    Divider()
                    Text("관계")
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading, 30)
                        .padding(.vertical, 20)
                    
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(RelationshipCategory.allCases, id: \.self) { i in
                            customCategory(text: i.rawValue)
                        }
                    }
                }
                
                Spacer()
                    .frame(width: 0, height: .infinity, alignment: .top)
                
                Button {
                    // 필터 적용 기능
                    isShowFilter = false
                } label: {
                    Text("적용하기")
                        .font(.system(size: 20))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 5)
                }
                .buttonStyle(.borderedProminent)

                
            }
            .navigationTitle("필터")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowFilter = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isShowFilter: .constant(true))
    }
}
