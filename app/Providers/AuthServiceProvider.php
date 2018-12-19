<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Support\ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Boot the authentication services for the application.
     *
     * @return void
     */
    public function boot()
    {
        // Here you may define how you wish users to be authenticated for your Lumen
        // application. The callback which receives the incoming request instance
        // should return either a User instance or null. You're free to obtain
        // the User instance via an API token or any other method necessary.

        $this->app['auth']->viaRequest('api', function ($request) {
            if (empty($request->header('Autorization')) === false) {
                $usuario = new User();
                $token   = $request->header('Autorization');

                $validToken = $usuario->validarToken($token);

                return $validToken;
            }

            if (empty($request->input('email')) === false
                && empty($request->input('password')) === false
            ) {
                $usuario = User::where('email', $request->input('email'))->first();

                if (empty($usuario) === false) {
                    $senha = md5($request->input('password'));

                    if ($senha === $usuario->password) {
                        return $usuario;
                    }
                }
            }

            return null;
        });
    }
}
