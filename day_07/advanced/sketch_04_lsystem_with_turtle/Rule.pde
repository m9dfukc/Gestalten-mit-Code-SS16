class Rule {
  
  char predecessor;
  String successor;
  
  Rule(char a, String b) {
    predecessor = a;
    successor = b;
  }
  
  char getPredecessor() {
    return predecessor; 
  }
  
  String getSuccessor() {
    return successor;
  }
  
  
}