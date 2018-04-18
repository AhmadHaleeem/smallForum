@extends('layouts.app')

@section('content')

        @foreach($results as $discussion)
            <div class="panel panel-default">
                <div class="panel-heading">
                    <img src="{{ $discussion->user->avatar }}" alt="" width="40px" height="40px">&nbsp;
                    <span>{{ $discussion->user->name }}, <b>{{ $discussion->created_at->diffForHumans() }}</b></span>
                    @if($discussion->hasBestAnswer())
                        <span class="btn btn pull-right btn-success btn-xs" style="margin-left: 8px">CLOSED</span>&nbsp;
                    @else
                        <span class="btn btn pull-right btn-danger btn-xs" style="margin-left: 8px">OPEN</span>&nbsp;
                    @endif


                   &nbsp; <a href="{{ route('discussion', ['slug' => $discussion->slug]) }}" class="btn btn-default btn-xs pull-right" style="margin-left: 8px">view</a>
                </div>

                <div class="panel-body">
                  <h5 class="text-center"> {!! $discussion->title  !!}</h5>
                    <p class="text-center">{!! str_limit($discussion->content, 50) !!}  </p>
                </div>

                <div class="panel-footer">
                    <span>{{ $discussion->replies->count() }} Replies</span>
                    <a href="{{ route('channel', ['slug' => $discussion->channel->slug]) }}" class="pull-right btn btn-default btn-xs">{{ $discussion->channel->title }}</a>
                </div>
            </div>
        @endforeach
        <div class="text-center">
            {{ $results->links() }}
        </div>
@endsection
