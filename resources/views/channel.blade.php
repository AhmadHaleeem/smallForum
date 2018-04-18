@extends('layouts.app')

@section('content')

        @foreach($discussions as $discussion)
            <div class="panel panel-default">
                <div class="panel-heading">
                    <img src="{{ $discussion->user->avatar }}" alt="" width="40px" height="40px">&nbsp;
                    <span>{{ $discussion->user->name }}, <b>{{ $discussion->created_at->diffForHumans() }}</b></span>
                    <a href="{{ route('discussion', ['slug' => $discussion->slug]) }}" class="btn btn-default btn-xs pull-right" style="margin-left: 8px">view</a>

                    @if($discussion->hasBestAnswer())
                        <span class="btn btn pull-right btn-success btn-xs">CLOSED</span>&nbsp;
                    @else
                        <span class="btn btn pull-right btn-danger btn-xs">OPEN</span>&nbsp;
                    @endif

                </div>

                <div class="panel-body">
                  <h5 class="text-center"> {!! $discussion->title  !!}</h5>
                    <p class="text-center">{!! str_limit($discussion->content, 50) !!}  </p>
                </div>

                <div class="panel-footer">
                    <p>{{ $discussion->replies->count() }} Replies</p>
                </div>
            </div>
        @endforeach
        <div class="text-center">
            {{ $discussions->links() }}
        </div>
@endsection
