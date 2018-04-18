<?php

use Illuminate\Database\Seeder;

class DiscussionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $t1 = 'By increasing the scope you will be asking the user to grant access to additional information';
        $t2 = 'One of the goals of the Eloquent OAuth package is to normalize the data received across all supported providers';
        $t3 = 'each provider offers its own sets of additional data';
        $t4 = 'Say for example we want to collect the user\'s gender when they login using Facebook.';

        $d1 = [
          'title' => $t1,
          'content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,1',
          'channel_id' => 1,
          'user_id' => 2,
          'slug' => str_slug($t1)
        ];
        $d2 = [
            'title' => $t2,
            'content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,2',
            'channel_id' => 2,
          'user_id' => 1,
          'slug' => str_slug($t2)
        ];
        $d3 = [
            'title' => $t3,
            'content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,3',
            'channel_id' => 2,
          'user_id' => 1,
          'slug' => str_slug($t3)
        ];
        $d4 = [
            'title' => $t4,
            'content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,4',
            'channel_id' => 5,
          'user_id' => 2,
          'slug' => str_slug($t4)
        ];
        \App\Discussion::create($d1);
        \App\Discussion::create($d2);
        \App\Discussion::create($d3);
        \App\Discussion::create($d4);
    }
}
