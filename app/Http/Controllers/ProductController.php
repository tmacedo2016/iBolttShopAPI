<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * ProductController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createProduct(Request $request, $companyId)
    {
        $product = new Product();
        $product = $product->createProduct($request, $companyId);

        return response()->json($product[0], $product[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readProducts(Request $request, $companyId)
    {
        $product  = new Product();
        $products = $product->readProducts($request, $companyId);

        $headers = [
            'X-Total-Count' => $products['total']
        ];

        return response()->json($products['data'], $products['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readProduct(Request $request, $companyId, $id)
    {
        $product = new Product();
        $product = $product->readProduct($request, $companyId, $id);

        return response()->json($product[0], $product[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editProduct(Request $request, $companyId, $id)
    {
        $product = new Product();
        $product = $product->editProduct($request, $companyId, $id);

        return response()->json($product[0], $product[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteProduct(Request $request, $companyId, $id)
    {
        $product = new Product();
        $product = $product->deleteProduct($request, $companyId, $id);

        return response()->json($product[0], $product[1]);
    }

}
