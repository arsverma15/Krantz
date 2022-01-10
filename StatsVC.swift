import Foundation
struct StatsVC {
  var data : [String : Stats]
  var defalt = Stats(values: [1.0, 2.0, 3.0, 4.0, 5.0]) //add in dictionary
  //var default: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0] 
  init (){
    data = [String : Stats]()
    data["defalt"] = defalt
  }

  var curvalue = ""

  func info(){
    var myInfo = "["
    let star = "*"

    for (x,statsobj) in data{
      myInfo = "["
      if x == curvalue{
        for value in (statsobj.values){
          myInfo += " " + String(value) + ","
        }
        myInfo += "]"
        print("\(star)\(x) \(myInfo)")
      } else{
        if statsobj.values.count > 0 {
          myInfo = "["
          for value in (statsobj.values){
            myInfo += " " + String(value) + ", "
        }
        myInfo += "]"
        print("\(x) \(myInfo)")
        }
      }
    }  
  }

  mutating func runStats() {
    print("Welcome to Stats!")
    var command = getCommand()
    while (String(command) != "quit") {
      var userData = splitStringIntoParts(command)
      switch userData[0] {
        case "help": help()
        case "add": add(myArray: userData)
        case "current": 
        curvalue = userData[1]

        case "sum": 
          if (data[curvalue]! != nil) {
            let obj = data[curvalue]!
            print("sum is", obj.sum())
          } else {
            print("please set current collection to use")
          }

        case "mean":
          if (data[curvalue]! != nil) {
            let obj = data[curvalue]!
            print("mean is", obj.mean())
          } else {
            print("please set current collection to use")
          }

        case "median":
          if (data[curvalue]! != nil) {
            let obj = data[curvalue]!
            print("median is", obj.median())
          } else {
            print("please set current collection to use")
          }

        case "stdev":
          if (data[curvalue]! != nil) {
            let obj = data[curvalue]!
            print("standard deviation is", obj.stdev())
          } else {
            print("please set current collection to use")
          }
        case "primes":
          if (data[curvalue]! != nil) {
            let obj = data[curvalue]!
            print("prime numbers are", obj.primes())
          } else {
            print("please set current collection to use")
          }
        case "info": 
        info()
        default: print("INVALID COMMAND")
      }
      command = String(readLine()!)
      userData = splitStringIntoParts(command)
      //command = getCommand()
    }
    print("\n...exiting the system...\n")
  }

  func help() {
    print("\n*****COMMANDS*****")
    print("help: print these commands")
    print("add: add new key-value to dictionary")
    print("current: set the current stats data set to name")
    print("sum: get the sum of your numbers")
    print("mean: get the mean of your numbers")
    print("median: get the median of your numbers")
    print("standard deviation: get the standard deviation of your numbers")
    print("primes: get all prime numbers in current dataset")
    print("info: get the info report")
    print("quit: quit Stats")
    print("***************\n")
  }


  func getCommand() -> String {
  print("please enter an option from the list of commands", terminator: " -> ")
  var input = String(readLine()!)
  while input == nil {
    print("INVALID COMMAND")
    print("Please enter an option from the list of commands", terminator: " -> ")
    input = readLine()!
  }
  return input

  }

  mutating func add(myArray: [String]){
    //print(self.data)
    //print(myArray)
    //print(myArray[0])
    var newArray = [Double]()
    for i in 2..<myArray.count{
      //print(myArray[i])
      newArray.append(Double(myArray[i])!)
    }
    //print(newArray)
    self.data[myArray[1]] = Stats(values: newArray)
    print(self.data)
  }




//Basic Idea: Numbers -> Array -> Stats
}