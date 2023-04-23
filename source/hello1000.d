import raylib;
import std;
enum windowx=1920;
enum windowy=1080;

void main(){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(2000,0);
	int i;
	while (i<=1000){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			DrawText("Hello, World!", 10,10, 20, Colors.WHITE);
			//DrawFPS(10,10);
		EndDrawing();
		i++;
		TakeScreenshot(("trash/"~i.to!string~".png").toStringz);
	}
	CloseWindow();
}