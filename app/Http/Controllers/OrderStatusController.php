<?php

namespace App\Http\Controllers;

use App\Models\OrderStatus;
use Illuminate\Http\Request;

class OrderStatusController extends Controller
{
    /**
     * StateController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createOrderStatus(Request $request)
    {
        $state = new OrderStatus();
        $state = $state->createOrderStatus($request);

        return response()->json($state[0], $state[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readOrderStatusList(Request $request)
    {
        $state  = new OrderStatus();
        $states = $state->readOrderStatusList($request);

        $headers = [
            'X-Total-Count' => $states['total']
        ];

        return response()->json($states['data'], $states['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readOrderStatus(Request $request, $id)
    {
        $state = new OrderStatus();
        $state = $state->readOrderStatus($request, $id);

        return response()->json($state[0], $state[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editOrderStatus(Request $request, $id)
    {
        $state = new OrderStatus();
        $state = $state->editOrderStatus($request, $id);

        return response()->json($state[0], $state[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteOrderStatus(Request $request, $id)
    {
        $state = new OrderStatus();
        $state = $state->deleteOrderStatus($request, $id);

        return response()->json($state[0], $state[1]);
    }

}
