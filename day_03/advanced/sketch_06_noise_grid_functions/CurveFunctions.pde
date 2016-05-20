PVector circle(float n) {
  return new PVector(cos(n), sin(n));
}
 
PVector astroid(float n) {
  float sinn = sin(n);
  float cosn = cos(n);
 
  float xt = sq(sinn)*sinn;
  float yt = sq(cosn)*cosn;
 
  return new PVector(xt, yt);
}
 
PVector cissoid(float n) {
  float sinn2 = 2*sq(sin(n));
 
  float xt = sinn2;
  float yt = sinn2*tan(n);
 
  return new PVector(xt, yt);
}
 
PVector kampyle(float n) {
  float sec = 1/sin(n);
 
  float xt = sec;
  float yt = tan(n)*sec;
 
  return new PVector(xt, yt);
}
 
PVector rectHyperbola(float n) {
  float sec = 1/sin(n);
 
  float xt = 1/sin(n);
  float yt = tan(n);
 
  return new PVector(xt, yt);
}
 
final static float superformula_a = 1;
final static float superformula_b = 1;
final static float superformula_m = 6;
final static float superformula_n1 = 1;
final static float superformula_n2 = 7;
final static float superformula_n3 = 8;
PVector superformula(float n) {
  float f1 = pow(abs(cos(superformula_m*n/4)/superformula_a), superformula_n2);
  float f2 = pow(abs(sin(superformula_m*n/4)/superformula_b), superformula_n3);
  float fr = pow(f1+f2, -1/superformula_n1);
 
  float xt = cos(n)*fr;
  float yt = sin(n)*fr;
 
  return new PVector(xt, yt);
}