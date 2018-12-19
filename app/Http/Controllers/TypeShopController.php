<?php

namespace App\Http\Controllers;

use App\Models\TypeShop;
use Illuminate\Http\Request;

class TypeShopController extends Controller
{
    /**
     * TypeShopController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createTypeShop(Request $request)
    {
        $typeShop  = new TypeShop();
        $typesShop = $typeShop->createTypeShop($request);

        return response()->json($typesShop[0], $typesShop[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readTypeShops(Request $request)
    {
        $typeShop  = new TypeShop();
        $typesShop = $typeShop->readTypeShops($request);

        $headers = [
            'X-Total-Count' => $typesShop['total']
        ];

        return response()->json($typesShop['data'], $typesShop['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readTypeShop(Request $request, $id)
    {
        $typeShop = new TypeShop();
        $typeShop = $typeShop->readTypeShop($request, $id);

        return response()->json($typeShop[0], $typeShop[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editTypeShop(Request $request, $id)
    {
        $typeShop   = new TypeShop();
        $typeShop = $typeShop->editTypeShop($request, $id);

        return response()->json($typeShop[0], $typeShop[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteTypeShop(Request $request, $id)
    {
        $typeShop   = new TypeShop();
        $typeShop = $typeShop->deleteTypeShop($request, $id);

        return response()->json($typeShop[0], $typeShop[1]);
    }

}
