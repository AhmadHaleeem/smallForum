<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\User::create([
            'name' => 'admin',
            'password' => bcrypt('123123'),
            'email' => 'ahmad@gmail.com',
            'admin' => 1,
            'avatar' => asset('avatars/avatar.jpg'),
        ]);

        App\User::create([
            'name' => 'Ahmad Haleem',
            'password' => bcrypt('123123'),
            'email' => 'haleem@gmail.com',
            'avatar' => asset('avatars/avatar.jpg'),
        ]);
    }
}
