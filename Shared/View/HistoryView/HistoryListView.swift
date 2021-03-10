//
//  HistoryListView.swift
//  Time Of Work (iOS)
//
//  Created by Robert Adamczyk on 09.03.21.
//

import SwiftUI

struct HistoryListView: View {
    @EnvironmentObject var viewModel: HistoryViewModel
    var result : FetchedResults<Dates>
    var body: some View {
        
        ForEach(viewModel.weeksAndYears, id: \.self) { item in
            VStack{
                HStack{
                    Text("\(item.weekOfYear)/\(String(item.yearForWeekOfYear))").bold()
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                VStack(spacing: 0){
                    Button(action:{
                        withAnimation {
                            viewModel.weeksAndYears[viewModel.weeksAndYears.firstIndex(of: item)!].showWeek.toggle()
                        }
                    }){
                        HStack{
                            Spacer()
                            Text("\(item.beginOfWeek, style: .date) -").bold()
                            Text("\(item.endOfWeek, style: .date)").bold()
                            Spacer()
                        }
                        .foregroundColor(Color("Orange"))
                        .padding(10)
                    }
                    
                    if item.showWeek {
                        VStack(spacing: 0){
                            ForEach(result, id: \.self) { date in
                                if viewModel.dateIsEqualWeekAndYear(date: date.date, value: item) {
                                    Divider()
                                    HistoryRow(value: date)
                                }
                            }
                        }
                    }
                }
                .roundedBackgroundWithBorder
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
