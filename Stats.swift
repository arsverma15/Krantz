import Foundation
struct Stats{
  let values: [Double]
  init (values: [Double]){
    self.values = values
  }


  func sum()-> Double{
    var add = 0.0
    for number in values {
      add = add + number
    }
    return add
  }

  
  func mean() -> Double {
    return(sum() / Double(values.count))
  }

  func median() -> Double{
    var data = values
    data.sort()
    let length = data.count
 
    if (length % 2 == 0){
      return(((Double(data[length / 2 - 1]) + Double(data[length / 2])))/2)
    }
    return Double(data[length / 2])
 
  }



  func stdev() -> Double{
    let average = mean()
    var sumOfSquares = 0.0
    for x in values{
      sumOfSquares += (x - average) * (x - average)
    }
    let denominator = Double(values.count) - 1
    let divide = sumOfSquares / denominator
    return(sqrt(divide))
    }


  
  func isPrime(number: Int) -> Bool{
      switch number {
        case 0,1: 
          return false
        case 2,3:
          return true
        default:
          for x in 2...Int(sqrt(Double(number))) {
            if number % x == 0{
              return false
            }
          }
      return true

      }
    }

  func primes()->[Double]{
    var mySet = Set<Double>()
    for b in values{
      if isPrime(number: Int(b)) == true{
        mySet.insert(b)
      }
    }
    return(mySet.sorted())
  }
}