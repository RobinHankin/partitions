#include<iostream>
#include<vector>
#include<limits>


namespace prt {

 inline void alive(const char* s) {std::cerr << "alive:" << s << std::endl;}


 class Print {
 protected:
  Print() {}

 public:
  virtual void print(std::ostream& s) const {}
 }; // Print


 inline std::ostream& operator<<(std::ostream& s, const Print& p) {p.print(s); return s;}


 template<typename T >
 class Vector: public Print, public std::vector<T > {
  void print(std::ostream& s) const {s << "{"; for(size_t i=0;i<std::vector<T >::size();i++) s << (i?",":"") << std::vector<T >::at(i); s << "}";}

 protected:
  Vector(size_t n):std::vector<T >(n) {}
 }; // Vector


 class Digits: public Vector<int > {
 public:
  Digits(size_t n):Vector<int>(n) {for(int i=0;i<(int)n;i++) at(i)=i+1;}

  int  get(size_t i)        {int r=at(i); at(i)=back(); pop_back(); return r;}
  void put(size_t i, int v) {if (i==size()) push_back(v); else {push_back(at(i)); at(i)=v;}}
 }; // Digits


 class Tuple: public Vector<int > {
 public:
  Tuple(int n=0):Vector<int>(n) {}

  bool lt(const Tuple& c) {if (size()==c.size()) for(size_t i=0;i<size();i++) if (at(i)!=c[i]) return at(i)<c[i]; return c.size()<size();}

  bool ordered() const {for(int i=1;i<(int)size();i++) if (at(i)<=at(i-1)) return false; return true;}

  bool find(const int& a) const {for(int i=0;i<(int)size();i++) if (at(i)==a) return true; return false;}

  void fillmaxint() {for(int i=0;i<(int)size();i++) at(i)=std::numeric_limits<int>::max()-size()+i;}
 }; // Tuple


 class Partition: public Vector<Tuple > {
  size_t num;

  void print(std::ostream& s) const {for(int j=0;j<(int)size();j++) s << at(j) << "\n";}

 public:
  Partition(const Tuple& t):Vector<Tuple >(t.size()),num(0) {for(size_t i=0;i<t.size();i++) {at(i)=Tuple(t[i]); at(i).fillmaxint(); num+=t[i];}}

  size_t number() const {return num;}

  void inject(int* o) {
   for(int i=0;i<(int)num;i++) {
    for(int j=0;j<(int)size();j++) {
     if (at(j).find(i+1)) o[i]=j+1;
    }
   }
  }
 }; // Partition


 class Partitions: public Print {
  Partition shape;
  Digits    digits;
  int* out;
  size_t ind;
  size_t num;
  size_t total;

  void saveit() {shape.inject(out+ind*num); ind++;}

  void doit(size_t t, size_t e) {
   if (t==shape.size()) return saveit();

   if (!shape[t].ordered()) return;

   if (shape[t].size()==e) {
//    if (shape[t].find(4)&&shape[t].find(1)) return;
    if (!shape[t].ordered()) return;
    if (t&&(!shape[t-1].lt(shape[t]))) return;
    return doit(t+1,0);
   }

   for(int i=0;i<(int)digits.size();i++) {
    shape[t][e]=digits.get(i);
    doit(t,e+1);
    digits.put(i,shape[t][e]);
    shape[t][e]=std::numeric_limits<int>::max()-shape[t].size()+e;
   }
  }

 public:
  Partitions(const Tuple& t, int n, int* o):shape(t),digits(n),out(o),ind(0),num(n) {doit(0,0); total=0; for(int i=0;i<(int)t.size();i++) total+=t[i];}
 }; // Partitions
}
