<?php

namespace App\Http\Controllers;

use App\Models\CategoryProduct;
use Illuminate\Http\Request;

class CategoryProductController extends Controller
{
    /**
     * CategoryProductController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createCategoryProduct(Request $request, $companyId)
    {
        $categoryProduct = new CategoryProduct();
        $categoryProduct = $categoryProduct->createCategoryProduct($request, $companyId);

        return response()->json($categoryProduct[0], $categoryProduct[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCategoryProducts(Request $request, $companyId)
    {
        $categoryProduct  = new CategoryProduct();
        $categoryProducts = $categoryProduct->readCategoryProducts($request, $companyId);

        $headers = [
            'X-Total-Count' => $categoryProducts['total']
        ];

        return response()->json($categoryProducts['data'], $categoryProducts['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCategoryProduct(Request $request, $id)
    {
        $categoryProduct = new CategoryProduct();
        $categoryProduct = $categoryProduct->readCategoryProduct($request, $id);

        return response()->json($categoryProduct[0], $categoryProduct[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editCategoryProduct(Request $request, $companyId, $id)
    {
        $categoryProduct = new CategoryProduct();
        $categoryProduct = $categoryProduct->editCategoryProduct($request, $companyId, $id);

        return response()->json($categoryProduct[0], $categoryProduct[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteCategoryProduct(Request $request, $companyId, $id)
    {
        $categoryProduct = new CategoryProduct();
        $categoryProduct = $categoryProduct->deleteCategoryProduct($request, $companyId, $id);

        return response()->json($categoryProduct[0], $categoryProduct[1]);
    }

}
