import std;
enum w=1920;
enum h=1080;
enum pixels=32;
static assert((w*h)%pixels==0);

ubyte[3*pixels] pixels_;

//void pix(T,S,U)(T r,S b,U g){
//	static int i=0;
//	pixels_[i*3+0]=r.to!ubyte;
//	pixels_[i*3+1]=g.to!ubyte;
//	pixels_[i*3+2]=b.to!ubyte;
//	i++;
//	if(i==pixels){
//		stdout.rawWrite(pixels_);
//		i=0;
//	}
//}

void main(){
	foreach(i;0..(w*h*255*4)/pixels){
		stdout.rawWrite(pixels_);
}}