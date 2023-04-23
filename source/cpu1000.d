import raylib;
import std;
enum windowx=1920;
enum windowy=1080;

void main(){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(2000,0);
	Image canvas=LoadImageFromScreen;
	Texture2D t;
	int i;
	while (i<=1000){
		BeginDrawing();
			if(i==0){
				ImageClearBackground(&canvas,Colors.BLACK);
				ImageDrawText(&canvas,"Hello, World!", 10,10, 20, Colors.WHITE);
				t=LoadTextureFromImage(canvas);
			}
			DrawTexture(t,0,0,Colors.WHITE);
			//DrawFPS(10,10);
		EndDrawing();
		//UnloadTexture(t);
		i++;
		spawnShell("cat out.png >> /dev/null");
		ExportImageAsCode(canvas,"out.png".toStringz);
	}
	CloseWindow();
}