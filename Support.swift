import Foundation


func splitStringIntoParts(_ expression: String)->[String]{
  return expression.split{$0 == " "}.map{ String($0) }
}


func splitStringIntoLines(_ expression: String)->[String]{
  return expression.split{$0 == "\n"}.map{ String($0)
}
}

/*
//Function to read a text file (extra credit only)
func readTextFile(_ path: String)->(message: String, fileText: String?){
  let text: String
do {
text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
}
catch {
return ("\(error)", nil)
}
return ("", text)
}
//Function to write a text file (extra credit only)
func writeTextFile(_ path: String, data: String)->String? {
do {
// Write contents to file
try data.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
}
catch let error as NSError {
return "\(error)"
}
return nil
}
*/
