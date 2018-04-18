<?php

use Illuminate\Database\Seeder;

class ChannelsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $channel8 = ['title' => 'PHP tersting', 'slug' => str_slug('PHP tersting')];
        $channel1 = ['title' => 'Wordpress', 'slug' => str_slug('Wordpress')];
        $channel2 = ['title' => 'OOP', 'slug' => str_slug('OOP')];
        $channel3 = ['title' => 'MVC', 'slug' => str_slug('MVC')];
        $channel4 = ['title' => 'PHP', 'slug' => str_slug('PHP')];
        $channel5 = ['title' => 'laravel', 'slug' => str_slug('laravel')];
        $channel6 = ['title' => 'Lumen', 'slug' => str_slug('Lumen')];
        $channel7 = ['title' => 'Forge', 'slug' => str_slug('Forge')];

        \App\Channel::create($channel1);
        \App\Channel::create($channel2);
        \App\Channel::create($channel3);
        \App\Channel::create($channel4);
        \App\Channel::create($channel5);
        \App\Channel::create($channel6);
        \App\Channel::create($channel7);
        \App\Channel::create($channel8);
    }
}
