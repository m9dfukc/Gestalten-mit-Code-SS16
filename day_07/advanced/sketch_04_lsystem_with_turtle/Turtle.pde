/* The turtle class references the drawing framework turtle 
 * from the old days of the "Logo" programming language
 *
 * We are using the following "Alphabet" to draw our turtle graphics:
 * F: line(0,0,0,len); translate(0,len);
 * G: translate(0,len);
 * +: rotate(angle);
 * -: rotate(-angle);
 * [: pushMatrix();
 * ]: popMatrix();
 */


class Turtle {
  String sentence;
  float len;
  float theta;
  
  Turtle(String s, float l, float t) {
    sentence = s;
    len = l; 
    theta = t;
  }
  
  void draw() {
    stroke(0);
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      if (c == 'F') {
        line(0, 0, len, 0);
        translate(len, 0);
      } else if (c == 'G') {
        translate(len, 0); 
      } else if (c == '+') {
        rotate(theta);
      } else if (c == '-') {
        rotate(-theta);
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      }
    } 
  }
  
  void setLen(float l) {
    len = l; 
  } 

  void multiplyLen(float m) {
    len *= m; 
  }

  void setSentence(String s) {
    sentence = s; 
  }
}