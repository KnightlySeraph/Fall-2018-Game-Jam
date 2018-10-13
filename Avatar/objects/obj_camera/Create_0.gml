/// @description Init Main Camera Vars
//Documentaion
//Change SizeFactor to Edit viewport, please do not modify matrix_build_projection_ortho without permission
//follow can be changed to be any object, even during runtime. The camera will follow the specified object
//lerpRate is the rate the camera moves to position. It must be a value betweem 1 and 99

//User Variables
vectorViewSizeFactor = 4;
follow = obj_player;
lerpRate = 15;


//Do not touch stuff
camera = camera_create();

var vm = matrix_build_lookat (x, y, - 10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(640*vectorViewSizeFactor, 480*vectorViewSizeFactor, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;


xTo = x;
yTo = y;

