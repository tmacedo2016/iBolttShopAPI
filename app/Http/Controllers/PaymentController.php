<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    /**
     * PaymentController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createPayment(Request $request)
    {
        $payment = new Payment();
        $payment = $payment->createPayment($request);

        return response()->json($payment[0], $payment[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readPayments(Request $request)
    {
        $payment  = new Payment();
        $payments = $payment->readPayments($request);

        $headers = [
            'X-Total-Count' => $payments['total']
        ];

        return response()->json($payments['data'], $payments['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readPayment(Request $request, $id)
    {
        $payment = new Payment();
        $payment = $payment->readPayment($request, $id);

        return response()->json($payment[0], $payment[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editPayment(Request $request, $id)
    {
        $payment = new Payment();
        $payment = $payment->editPayment($request, $id);

        return response()->json($payment[0], $payment[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deletePayment(Request $request, $id)
    {
        $payment = new Payment();
        $payment = $payment->deletePayment($request, $id);

        return response()->json($payment[0], $payment[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCompanyPayments(Request $request, $companyId)
    {
        $payment  = new Payment();
        $payments = $payment->readCompanyPayments($request, $companyId);

        $headers = [
            'X-Total-Count' => $payments['total']
        ];

        return response()->json($payments['data'], $payments['status'], $headers);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateCompanyPayment(Request $request, $companyId)
    {
        $payment = new Payment();
        $payment = $payment->updateCompanyPayment($request, $companyId);

        return response()->json($payment[0], $payment[1]);
    }

}
