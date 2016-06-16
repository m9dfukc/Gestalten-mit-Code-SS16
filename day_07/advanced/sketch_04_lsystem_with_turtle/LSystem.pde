class LSystem {
  String sentence;
  Rule[] rules;
  int generation;

  LSystem(String axiom, Rule[] r) {
    sentence = axiom ;
    rules = r;
    generation = 0;
  }

  void generate() {
    StringBuffer next = new StringBuffer();
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      String replace = c + "";
      for (int j = 0; j < rules.length; j++) {
        Rule r = rules[j];
        if (c == r.getPredecessor()) {
          replace = r.getSuccessor();
          break;
        }        
      }
      next.append(replace);
    }
    sentence = next.toString();
    generation++;
  }

  int getGeneration() {
    return generation;
  }

  String getSentence() {
    return sentence;
  }
}