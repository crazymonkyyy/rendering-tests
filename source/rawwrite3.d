import std;
enum w=1920;
enum h=1080;
enum pixels=w*24;
static assert((w*h)%pixels==0);

ubyte[3*pixels] pixels_;
pragma(inline):
void pix(T,S,U)(T r,S b,U g){
	static int i=0;
	pixels_[i*3+0]=cast(ubyte)r;
	pixels_[i*3+1]=cast(ubyte)g;
	pixels_[i*3+2]=cast(ubyte)b;
	i++;
	if(i==pixels){
		stdout.rawWrite(pixels_);
		i=0;
	}
}

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
			pragma(inline)
			pix(x,y,i%256);
		} else {
			if ((x_+y_)%2==0){
				pragma(inline)
				pix(255,255,255);
			} else {
				pragma(inline)
				pix(0,0,0);
			}
		}
	}}
	}
}