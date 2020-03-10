//
//  TodoEditView.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/09.
//  Copyright © 2020 dooboolab. All rights reserved.
//

import SwiftUI

struct TodoEditView: View {
    @Binding var todo: TodoModel;

    var body: some View {
        VStack{
            Image(systemName: todo.image)
                .frame(width: 50 , height: 50, alignment: Alignment.center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding(.vertical, 50)

            VStack(alignment: .leading) {
                Text("TITLE")
                    .font(.callout)
                    .bold()
                TextField("ENTER_TITLE", text: $todo.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.horizontal)

            VStack(alignment: .leading) {
                Text("DESCRIPTION")
                    .font(.callout)
                    .bold()
                TextField("ENTER_TITLE", text: $todo.text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.horizontal)
            .padding(.vertical, 10)

            DatePicker(
                "Please enter date",
                selection: $todo.date,
                displayedComponents: .date
            ).labelsHidden()

            Spacer()
        }
    }
}

struct TodoEditView_Previews: PreviewProvider {
    static var previews: some View {
        TodoEditView(todo: .constant(todos[0]))
    }
}