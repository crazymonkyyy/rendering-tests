import std;
ProcessPipes pipe;
void init(){
	pipe=pipeShell("calc -p");
	pipe.stdout.byLine.take(10);//.writeln;//
}
auto calc(string s){
	pipe.stdin.writeln(s);
	pipe.stdin.flush;
	string t;
	if(s.canFind('=')){
		t="success";
	} else {
		t=pipe.stdout.byLineCopy.front;
	}
	return t;//.map!(a=>a.to!int);
	//return pipe.stdout.byLineCopy;
}
void main(){
	init;
	calc("a=10").writeln;
	calc("a+a").writeln;
	calc("1+3").writeln;
	calc("1+4").writeln;
	calc("1+5").writeln;
	calc("ctrl(6)").writeln;
	calc("a=10").writeln;
	calc("a+a").writeln;
	calc("1+3").writeln;
	calc("1+4").writeln;
	calc("1+5").writeln;
}