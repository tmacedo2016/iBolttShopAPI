<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\TypeCompany;
use Illuminate\Http\Request;

class TypeCompanyController extends Controller
{
    /**
     * TypeCompanyController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createTypeCompany(Request $request)
    {
        $company   = new TypeCompany();
        $companies = $company->createTypeCompany($request);

        return response()->json($companies[0], $companies[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readTypeCompanies(Request $request)
    {
        $company   = new TypeCompany();
        $companies = $company->readTypeCompanies($request);

        $headers = [
            'X-Total-Count' => $companies['total']
        ];

        return response()->json($companies['data'], $companies['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readTypeCompany(Request $request, $id)
    {
        $company = new TypeCompany();
        $company = $company->readTypeCompany($request, $id);

        return response()->json($company[0], $company[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editTypeCompany(Request $request, $id)
    {
        $company   = new TypeCompany();
        $company = $company->editTypeCompany($request, $id);

        return response()->json($company[0], $company[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteTypeCompany(Request $request, $id)
    {
        $company   = new TypeCompany();
        $company = $company->deleteTypeCompany($request, $id);

        return response()->json($company[0], $company[1]);
    }

}
