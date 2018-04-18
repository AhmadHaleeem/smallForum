@extends('layouts.app')

@section('content')

        <div class="panel panel-default">
            <div class="panel-heading">
                <img src="{{ $discussion->user->avatar }}" alt="" width="40px" height="40px">&nbsp;
                <span>{{ $discussion->user->name }}, <b>({{ $discussion->user->points }})</b></span>

                @if($discussion->hasBestAnswer())
                    <span class="btn btn pull-right btn-success btn-xs">CLOSED</span>&nbsp;
                @else
                    <span class="btn btn pull-right btn-danger btn-xs">OPEN</span>&nbsp;
                @endif
                @if(Auth::id() == $discussion->user_id)
                    @if(!$discussion->hasBestAnswer())
                        <a href="{{ route('discussions.edit', ['slug' => $discussion->slug]) }}" class="btn btn-info pull-right btn-xs" style="margin-right: 8px">Edit</a>
                    @endif
                @endif

                @if($discussion->is_being_watched_by_auth_user())
                    <a href="{{ route('discussion.unwatch', ['id' => $discussion->id]) }}" class="btn btn-default pull-right btn-xs" style="margin-right: 8px">unwatch</a>
                @else
                    <a href="{{ route('discussion.watch', ['id' => $discussion->id]) }}" class="btn btn-default pull-right btn-xs" style="margin-right: 8px">watch</a>
                @endif

            </div>

            <div class="panel-body">
                <h4 class="text-center"> {!! $discussion->title  !!}</h4>
                <hr>
                <p class="text-center">{!! $discussion->content !!}  </p>
                <hr>
                @if($best_answer)
                    <div class="text-center" style="padding: 40px">
                        <h3 class="text-center">BEST ANSWER</h3>
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <img src="{{ $best_answer->user->avatar }}" alt="" width="40px" height="40px">&nbsp;
                                <span>{{ $best_answer->user->name }}, <b>({{ $best_answer->user->points }})</b> </span>
                            </div>
                            <div class="panel-body">
                                {{ $best_answer->content }}
                            </div>
                        </div>
                    </div>
                @endif
            </div>

            <div class="panel-footer">
                <span>{{ $discussion->replies->count() }} Replies</span>
                <a href="{{ route('channel', ['slug' => $discussion->channel->slug]) }}" class="pull-right btn btn-default btn-xs">{{ $discussion->channel->title }}</a>
            </div>
        </div>
        @foreach($discussion->replies as $reply)
            <div class="panel panel-default">
                <div class="panel-heading">
                    <img src="{{ $reply->user->avatar }}" alt="" width="40px" height="4s0px">&nbsp;
                    <span>{{ $reply->user->name }}, <b>({{ $reply->user->points }})</b></span>
                    @if(!$best_answer)
                        @if(Auth::id() == $discussion->user->id)
                            <a href="{{ route('discussion.best.answer', ['id' => $reply->id]) }}" class="btn btn-xs btn-info pull-right">Mark as best answer</a>
                        @endif
                    @endif

                    @if(Auth::id() == $reply->user->id)
                        @if(!$reply->best_answer)
                            <a href="{{ route('reply.edit', ['slug' => $reply->id]) }}" class="btn btn-info pull-right btn-xs" style="margin-right: 8px">Edit</a>
                        @endif
                    @endif
                </div>

                <div class="panel-body">

                    <p class="text-center">{!! $reply->content !!}  </p>
                </div>

                <div class="panel-footer">
                    <p>
                        @if($reply->is_liked_by_auth_user())
                            <a href="{{ route('reply.unlike', ['id' => $reply->id]) }}" class="btn btn-danger btn-xs">Unlike {{ $reply->likes->count() }}</a>
                        @else
                            <a href="{{ route('reply.like', ['id' => $reply->id]) }}" class="btn btn-success btn-xs">Like <span class="badge">{{ $reply->likes->count() }}</span> </a>
                        @endif
                    </p>
                </div>
            </div>
        @endforeach

    <div class="panel panel-default">
        <div class="panel-body">
            @if(Auth::check())
            <form action="{{ route('discussion.reply', ['id' => $discussion->id]) }}" method="POST">
                {{ csrf_field() }}
                <div class="form-group">
                    <label for="reply">Leave a reply...</label>
                    <textarea name="reply" id="reply" cols="30" rows="8" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <button class="btn btn-primary pull-right" type="submit">Leave a reply</button>
                </div>
            </form>
            @else
                <div class="text-center">
                    <h2>Sign in to leave a reply</h2>
                </div>
            @endif
        </div>
    </div>

@endsection