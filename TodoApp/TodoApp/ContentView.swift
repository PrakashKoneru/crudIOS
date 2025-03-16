import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = []
    @State private var newTask: String = ""
    @State private var editingTaskIndex: Int? = nil

    var body: some View {
        VStack(alignment: .leading) {
            
            Text("To-Do List")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .center)
            
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    HStack {
                        if editingTaskIndex == index {
                            // Directly bind TextField to tasks[index]
                            TextField("Edit task", text: $tasks[index])
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(height: 40)
                        } else {
                            Text(tasks[index])
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            editingTaskIndex = (editingTaskIndex == index) ? nil : index
                        }) {
                            Image(systemName: editingTaskIndex == index ? "checkmark.circle.fill" : "pencil.circle.fill")
                                .foregroundColor(editingTaskIndex == index ? .green : .blue)
                        }
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            deleteTask(at: index)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.vertical, 5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack {
                TextField("Enter a task", text: $newTask)
                    .padding(10)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding(.leading, 10)

                Button(action: addTask) {
                    Text("Add")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }

    private func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask)
            newTask = ""
        }
    }

    private func deleteTask(at index: Int) {
        tasks.remove(at: index)
    }
}

#Preview {
    ContentView()
}
