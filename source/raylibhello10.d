import raylib;

enum windowx=800;
enum windowy=600;

void main(){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(2000,0);
	int i;
	while (i++<=10){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			DrawText("Hello, World!", 10,10, 20, Colors.WHITE);
			//DrawFPS(10,10);
		EndDrawing();
		//TakeScreenshot("hi.png");
	}
	CloseWindow();
}