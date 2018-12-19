<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * OrderController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @param $companyId
     * @param $userId
     * @return \Illuminate\Http\JsonResponse
     */
    public function createOrder(Request $request, $companyId, $userId)
    {
        $order   = new Order();
        $orders = $order->createOrder($request, $companyId, $userId);

        return response()->json($orders[0], $orders[1]);
    }

    /**
     * @param Request $request
     * @param $userId
     * @return \Illuminate\Http\JsonResponse
     */
    public function readOrders(Request $request, $userId)
    {
        $order   = new Order();
        $orders = $order->readOrders($request, $userId);

        $headers = [
            'X-Total-Count' => $orders['total']
        ];

        return response()->json($orders['data'], $orders['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readOrder(Request $request, $userId, $id)
    {
        $order = new Order();
        $order = $order->readOrder($request, $userId, $id);

        return response()->json($order[0], $order[1]);
    }

    /**
     * @param Request $request
     * @param $userId
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readOrderProducts(Request $request, $userId, $id)
    {
        $order   = new Order();
        $orders = $order->readOrderProducts($request, $userId, $id);

        $headers = [
            'X-Total-Count' => $orders['total']
        ];

        return response()->json($orders['data'], $orders['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $userId
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function cancelOrder(Request $request, $userId, $id)
    {
        $order   = new Order();
        $order = $order->cancelOrder($request, $userId, $id);

        return response()->json($order[0], $order[1]);
    }

    /**
     * @param Request $request
     * @param $companyId
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCompanyOrders(Request $request, $companyId)
    {
        $order   = new Order();
        $orders = $order->readCompanyOrders($request, $companyId);

        $headers = [
            'X-Total-Count' => $orders['total']
        ];

        return response()->json($orders['data'], $orders['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $companyId
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCompanyOrder(Request $request, $companyId, $id)
    {
        $order = new Order();
        $order = $order->readCompanyOrder($request, $companyId, $id);

        return response()->json($order[0], $order[1]);
    }

    /**
     * @param Request $request
     * @param $userId
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCompanyOrderProducts(Request $request, $companyId, $id)
    {
        $order   = new Order();
        $orders = $order->readCompanyOrderProducts($request, $companyId, $id);

        $headers = [
            'X-Total-Count' => $orders['total']
        ];

        return response()->json($orders['data'], $orders['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editCompanyOrder(Request $request, $id)
    {
        $order   = new Order();
        $order = $order->editCompanyOrder($request, $id);

        return response()->json($order[0], $order[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editCompanyOrderStatus(Request $request, $companyId, $orderId, $id)
    {
        $order   = new Order();
        $order = $order->editCompanyOrderStatus($request, $companyId, $orderId, $id);

        return response()->json($order[0], $order[1]);
    }

}
