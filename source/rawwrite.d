import std;

void main(){
	foreach(r;0..256){
	foreach(g;0..256){
	foreach(b;0..256){
		stdout.rawWrite([cast(ubyte)r,cast(ubyte)g,cast(ubyte)b]);
	}}}
}