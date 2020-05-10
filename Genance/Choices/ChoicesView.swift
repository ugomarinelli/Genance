//
//  ChoicesView.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import Foundation
import SwiftUI

struct ChoicesView: View {
    private var presenter: ChoicesPresenter?
    @State var currentStory: Story?

    init(presenter: ChoicesPresenter?) {
        self.presenter = presenter
        presenter?.prepare()
    }
    
    var body: some View {
        ZStack {
            Color.pastelPurple
            VStack {
                Text("Hello World").frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.roseannaLow, Color.roseannaHigh]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                Spacer(minLength: 12)
                Text("Hello World").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.red)
            }.padding(.all).cornerRadius(10)
        }.edgesIgnoringSafeArea(.all)
        
    }
    
    func update(with state: ChoicesState) {
        
    }
}

#if DEBUG
struct ChoicesView_Previews : PreviewProvider {
    static var previews: some View {
        ChoicesView(presenter: ChoicesPresenterImpl())
    }
}
#endif
