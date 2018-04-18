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

Route::get('/forum', 'ForumsController@index')->name('forum');
Route::get('/discuss', function () {
    return view('discuss');
});
Auth::routes();


Route::get('/home', 'HomeController@index')->name('home');
Route::get('/', 'SocialsController@welcome')->name('welcome');
Route::get('{provider}/auth', [
   'uses'  => 'SocialsController@auth',
    'as' => 'social.auth'
]);

Route::get('{provider}/redirect', [
    'uses'  => 'SocialsController@auth_callback',
    'as' => 'social.callback'
]);

Route::get('/discussion/{slug}', 'DiscussionsController@show')->name('discussion');
Route::get('/channel/{slug}', 'ForumsController@channel')->name('channel');

Route::group(['middleware' => 'auth'], function () {
    Route::resource('channels', 'ChannelsController')->middleware('admin');
    Route::get('/discussions/create/new', 'DiscussionsController@create')->name('discussions.create');
    Route::post('/discussions/store', 'DiscussionsController@store')->name('discussions.store');
    Route::get('/discussions/edit/{slug}', 'DiscussionsController@edit')->name('discussions.edit');
    Route::post('/discussions/update/{id}', 'DiscussionsController@update')->name('discussions.update');
    Route::post('/discussion/reply/{id}', 'DiscussionsController@reply')->name('discussion.reply');


    Route::get('/reply/like/{id}', 'RepliesController@like')->name('reply.like');
    Route::get('/reply/unlike/{id}', 'RepliesController@unlike')->name('reply.unlike');


    Route::get('/discussion/watch/{id}', 'WatchersController@watch')->name('discussion.watch');
    Route::get('/discussion/unwatch/{id}', 'WatchersController@unwatch')->name('discussion.unwatch');

    Route::get('/discussion/best/reply/{id}', 'RepliesController@best_answer')->name('discussion.best.answer');


    Route::get('/reply/edit/{id}', 'RepliesController@edit')->name('reply.edit');
    Route::post('/reply/update/{id}', 'RepliesController@update')->name('reply.update');
});
