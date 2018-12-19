<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * UserController constructor.
     */
    public function __construct() { }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {
        $user = new User();
        $retorno = $user->login();

        return response()->json(
            $retorno['data'],
            $retorno['status']
        );
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createUser(Request $request)
    {
        $user  = new User();
        $users = $user->createUser($request);

        return response()->json($users[0], $users[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readUsers(Request $request)
    {
        $user  = new User();
        $users = $user->readUsers($request);

        $headers = [
            'X-Total-Count' => $users['total']
        ];

        return response()->json($users['data'], $users['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readUser(Request $request, $id)
    {
        $user = new User();
        $user = $user->readUser($request, $id);

        return response()->json($user[0], $user[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readUserOrders(Request $request, $id)
    {
        $user = new User();
        $user = $user->readUserOrders($request, $id);

        return response()->json($user[0], $user[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editUser(Request $request, $id)
    {
        $user = new User();
        $user = $user->editUser($request, $id);

        return response()->json($user[0], $user[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteUser(Request $request, $id)
    {
        $user = new User();
        $user = $user->deleteUser($request, $id);

        return response()->json($user[0], $user[1]);
    }

}
