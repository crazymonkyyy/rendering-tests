import std;
struct foo{}
int i;
auto front(foo){
	return i;
}
void popFront(foo){
	i++;
}
bool empty(foo){
	return i<10;
}
void main(){
	foreach(a;foo()){
		a.writeln;
}}