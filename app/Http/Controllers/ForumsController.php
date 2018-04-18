<?php

namespace App\Http\Controllers;

use App\Channel;
use App\Discussion;
use Illuminate\Http\Request;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;

class ForumsController extends Controller
{
    public function index() {
//        $discussions = Discussion::orderBy('created_at', 'DESC')->paginate(5);
        switch (\request('filter')) {
            case 'me':
            $results = Discussion::where('user_id', Auth::id())->paginate(3);
            break;
            case 'solved':
            $answered = array();
            foreach (Discussion::all() as $d) {
                if($d->hasBestAnswer()) {
                    array_push($answered, $d);
                }
            }
            $results = new Paginator($answered, 3); // this is to paginate the array
            break;

            case 'unsolved':
                $unanswered = array();
                foreach (Discussion::all() as $d) {
                    if(!$d->hasBestAnswer()) {
                        array_push($unanswered, $d);
                    }
                }
                $results = new Paginator($unanswered, 3); // this is to paginate the array
                break;

            default:
            $results = Discussion::orderBy('created_at', 'DESC')->paginate(3);
            break;
        }
        return view('forum', compact('results'));
    }

    public function channel($slug) {
        $channel = Channel::where('slug', $slug)->first();
        $discussions = $channel->discussions()->paginate(5);

        return view('channel', compact('discussions'));
    }
}
