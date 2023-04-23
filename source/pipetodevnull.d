import std;
void main(){
	foreach(i;1..1001){
		auto s=i.to!string;
		("cat trash/"~s~".png >> /dev/null").executeShell;
	}
}