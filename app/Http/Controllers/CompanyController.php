<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    /**
     * CompanyController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createCompany(Request $request)
    {
        $company   = new Company();
        $companies = $company->createCompany($request);

        return response()->json($companies[0], $companies[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCompanies(Request $request)
    {
        $company   = new Company();
        $companies = $company->readCompanies($request);

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
    public function readCompany(Request $request, $id)
    {
        $company = new Company();
        $company = $company->readCompany($request, $id);

        return response()->json($company[0], $company[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCompanyOrders(Request $request, $id)
    {
        $company = new Company();
        $company = $company->readCompanyOrders($request, $id);

        return response()->json($company[0], $company[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editCompany(Request $request, $id)
    {
        $company   = new Company();
        $company = $company->editCompany($request, $id);

        return response()->json($company[0], $company[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteCompany(Request $request, $id)
    {
        $company   = new Company();
        $company = $company->deleteCompany($request, $id);

        return response()->json($company[0], $company[1]);
    }

}
