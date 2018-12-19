<?php

namespace App\Http\Controllers;

use App\Models\TypeUser;
use Illuminate\Http\Request;

class TypeUserController extends Controller
{
    /**
     * TypeUserController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createTypeUser(Request $request)
    {
        $typeUser = new TypeUser();
        $typeUser = $typeUser->createTypeUser($request);

        return response()->json($typeUser[0], $typeUser[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readTypeUsers(Request $request)
    {
        $typeUser  = new TypeUser();
        $typeUsers = $typeUser->readTypeUsers($request);

        $headers = [
            'X-Total-Count' => $typeUsers['total']
        ];

        return response()->json($typeUsers['data'], $typeUsers['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readTypeUser(Request $request, $id)
    {
        $typeUser = new TypeUser();
        $typeUser = $typeUser->readTypeUser($request, $id);

        return response()->json($typeUser[0], $typeUser[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editTypeUser(Request $request, $id)
    {
        $typeUser = new TypeUser();
        $typeUser = $typeUser->editTypeUser($request, $id);

        return response()->json($typeUser[0], $typeUser[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteTypeUser(Request $request, $id)
    {
        $typeUser = new TypeUser();
        $typeUser = $typeUser->deleteTypeUser($request, $id);

        return response()->json($typeUser[0], $typeUser[1]);
    }

}
