<?php

namespace App\Http\Controllers;
use App\Notifications\NewReplyAdded;
use Session;
use Notification;
use App\Discussion;
use App\Reply;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class DiscussionsController extends Controller
{
    public function create() {
        return view('discuss');
    }

    public function store() {
        $request =  \request();
        $this->validate($request, [
            'channel_id' => 'required',
            'content' => 'required',
            'title' => 'required'
        ]);

        $discussion = Discussion::create([
            'title' => $request->title,
            'content' => $request->content,
            'channel_id' => $request->channel_id,
            'user_id' => Auth::id(),
            'slug' => str_slug($request->title)
        ]);

        Session::flash('success', 'Discussion stored successfully.');
        return redirect()->route('discussion', ['slug' => $discussion->slug]);
    }

    public function show($slug) {
        $discussion = Discussion::where('slug', $slug)->first();
        $best_answer = $discussion->replies()->where('best_answer', 1)->first();
        return view('discussions.show', compact('discussion', 'best_answer'));
    }

    public function reply($id) {
        $discussion = Discussion::find($id);
        $reply = Reply::create([
            'user_id' => Auth::id(),
            'discussion_id' => $id,
            'content' => \request('reply')
        ]);

        $reply->user->points += 25;
        $reply->user->save();

        $watchers = array();
        foreach($discussion->watchers as $watcher){
            array_push($watchers, User::find($watcher->user_id));
        }

        Notification::send($watchers, new \App\Notifications\NewReplyAdded($discussion));

        Session::flash('success', 'Replied to discussion..');
        return redirect()->back();
    }

    public function edit($slug) {
        $discussion = Discussion::where('slug', $slug)->first();
        return view('discussions.edit', compact('discussion'));
    }

    public function update($id) {
        $this->validate(request(), [
           'content' => 'required'
        ]);

        $d = Discussion::find($id);
        $d->content = \request()->content;
        $d->save();
        Session::flash('success', 'Discussion updated successfully..');
        return redirect()->route('discussion', ['slug' => $d->slug]);
    }
}
