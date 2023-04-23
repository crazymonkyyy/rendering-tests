import std;
enum w=1920;
enum h=1080;
enum totalframes=255*4;
enum pixels=32;
//static assert((w*h)%pixels==0);

ubyte[3*pixels] pixels_;
int pix_i;
void pix(T,S,U)(T r,S b,U g){
	pixels_[pix_i*3+0]=r.to!ubyte;
	pixels_[pix_i*3+1]=g.to!ubyte;
	pixels_[pix_i*3+2]=b.to!ubyte;
	pix_i++;
	if(pix_i==pixels){
		stdout.rawWrite(pixels_);
		pix_i=0;
	}
}
void pixflush(){
	stdout.rawWrite(pixels_[0..pix_i*3]);
	pix_i=0;
}
string where(){
	return
	"x:"~x_.to!string~","~
	"y:"~y_.to!string~","~
	"frame:"~frame_.to!string~",";
}
int x_,y_,frame_;
void raw(bool callflush=true)(ubyte[] a){
	static if(callflush){
		pixflush;
	}
	assert(a.length%3==0,"offset pixels"~ a.length.to!string~where );
	assert(a.length/3+x_<=w,"over run"~ a.length.to!string~where);
	stdout.rawWrite(a);
	x_+=a.length/3;
}

static struct drawloop{
	auto front(){
		return tuple(frame_,x_,y_);
	}
	void popFront(){
		x_++;
		if(x_==w){
			x_=0;
			y_++;
			if(y_==h){
				y_=0;
				frame_++;
	}}}
	bool empty(){
		return frame_==totalframes;
	}
}
static ubyte[3*255] whitepixels=255;
static ubyte[3*255] blackpixels=0;

int color(int x,int y){
	x/=256;
	y/=256;
	if ((x*3+y)%5==0){
		return 2;
	}
	return (x+y)%2==0;
}


void main(){
	foreach(i,x,y;drawloop()){
		x+=i;
		y+=i;
		switch(color(x,y)){
			case 0: 
				if((x+255<w)&(color(x+255,y)==0)){
					raw(blackpixels);
				} else {
					pix(0,0,0);
				} 
				break;
			case 1: 
				if((x+255<w)&(color(x+255,y)==0)){
					raw(whitepixels);
				} else {
					pix(255,255,255);
				} 
				break;
			case 2:
				x-=(x/256)*256; 
				y-=(y/256)*256; 
				pix(x,y,i%256); 
				break;
			default: assert(0);
		}
	}
	pixflush;
}