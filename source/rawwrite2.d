import std;
enum w=1920;
enum h=1080;
void main(){
	int y;
	foreach(i;0..255*4){
	foreach(truey;0..h){
	foreach(x;0..w){//inverse order intentional
		y=truey;
		x+=i;
		y+=i;
		int x_=x/256;
		int y_=y/256;
		if ((x_*3+y_)%5==0){
			x%=256;
			y%=256;
			stdout.rawWrite([cast(ubyte)x,cast(ubyte)y,cast(ubyte)(i%256)]);
		} else {
			if ((x_+y_)%2==0){
				stdout.rawWrite([cast(ubyte)255,cast(ubyte)255,cast(ubyte)255]);
			} else {
				stdout.rawWrite([cast(ubyte)0,cast(ubyte)0,cast(ubyte)0]);
			}
		}
	}}
	}
}