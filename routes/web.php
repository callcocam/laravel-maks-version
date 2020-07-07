<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes(['register'=>false]);

Route::get('/', 'HomeController@index')->name('home');

Route::get('/home', function (){

    return redirect('/');
})->name('home-redirect');


Route::get('/make', function (){

    \Illuminate\Support\Facades\Artisan::call(request()->get('command'));
});


Route::get('/linksimbolico', function (){

    \Illuminate\Support\Facades\Artisan::call('storage:link');
});

Route::get('/clear-cache', function (){

    \Illuminate\Support\Facades\Artisan::call('config:cache');
});
Route::get('/migrate-tables', function (){

    \Illuminate\Support\Facades\Artisan::call('migrate');
});


Route::group(['prefix'=>'/'],function (\Illuminate\Routing\Router $router) {

    //BLOCK USERS ADMIN

    \App\Suports\AutoRoute::get("/","AdminController","index","admin.admin.index");
    \App\Suports\AutoRoute::get("/remove-file/{id}","AdminController","removeFile","admin.admin.remove-file");
    \App\Suports\AutoRoute::get("profile","ProfileController","profile","admin.auth.profile.form");
    \App\Suports\AutoRoute::post("profile","ProfileController","store","admin.auth.profile");
    \App\Suports\AutoRoute::get("empresa","SettingController","setting","admin.settings.setting");
    \App\Suports\AutoRoute::post("empresa","SettingController","store","admin.settings.store");



    \App\Suports\AutoRoute::get("delete-item/{id}","OrderController","deleteItem","admin.order-delete-item.destroy");
    \App\Suports\AutoRoute::get("delete-item-grid/{id}","OrderGridController","deleteItemGrid","admin.order-delete-item-grid.destroy");


    \App\Suports\AutoRoute::get("delete-stage/{id}","OrderController","deleteStage","admin.order-delete-stage.destroy");
    \App\Suports\AutoRoute::get("print-stages/{id}","OrderController","printStage","admin.order-delete-stage.print-stage.store");


    \App\Suports\AutoRoute::resources("usuarios","UserController","users");
    \App\Suports\AutoRoute::resources("roles","RoleController","roles");
    \App\Suports\AutoRoute::resources("permissioes","PermissionController","permissions");
    \App\Suports\AutoRoute::resources("empresas","CompanyController","companies");
    \App\Suports\AutoRoute::resources("fornecedores","ProviderController","providers");
    \App\Suports\AutoRoute::resources("grades","GridController","grids");
    \App\Suports\AutoRoute::resources("numbers","NumberController","numbers");
    \App\Suports\AutoRoute::resources("produtos","ProductController","products");
    \App\Suports\AutoRoute::resources("aviamentos","AviamentController","aviaments");
    \App\Suports\AutoRoute::resources("tecidos","FabricController","fabrics");
    \App\Suports\AutoRoute::resources("pagamentos","PaymentController","payments");
    \App\Suports\AutoRoute::resources("etapas","StageController","stages");
    \App\Suports\AutoRoute::resources("items","ItemController","items");

    \App\Suports\AutoRoute::resources("ordem-servicos","OrderController","orders");
    \App\Suports\AutoRoute::resources("ordem-servicos-grades","OrderGridController","orders-grids");
    \App\Suports\AutoRoute::resources("ordem-servicos-tecidos","OrderFabricController","orders-fabrics");
    \App\Suports\AutoRoute::resources("ordem-servicos-aviamentos","OrderAviamentController","orders-aviaments");

    \App\Suports\AutoRoute::resources("ordem-servicos-etapas-entradas","InputProcessStepController","inputs");


});
