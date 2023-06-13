#include <iostream>
#include <Raylib/raylib.h>

#define NOEXPAND(A) #A
#define STR(A) NOEXPAND(A)

#define FIND_CONFIG(FilePath)  STR(CONFIG_PATH) FilePath
#define FIND_CONTENT(FilePath) STR(CONTENT_PATH) FilePath

int main(int argc, char* argv[])
{
	InitWindow(800,600,"Super Mario");
	SetTargetFPS(60);

	Texture2D emblema = LoadTexture(FIND_CONTENT("Texture/Emblema.png"));

	do{
		BeginDrawing();
		ClearBackground(DARKGRAY);

		DrawTexture(emblema, 0, 0, WHITE);

		EndDrawing();
	}while(!WindowShouldClose());

	UnloadTexture(emblema);
	CloseWindow();

	return 0;
}
