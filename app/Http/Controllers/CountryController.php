<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\TypeCompany;
use Illuminate\Http\Request;

class CountryController extends Controller
{
    /**
     * CountryController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createCountry(Request $request)
    {
        $country = new Country();
        $country = $country->createCountry($request);

        return response()->json($country[0], $country[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCountries(Request $request)
    {
        $country   = new Country();
        $countries = $country->readCountries($request);

        $headers = [
            'X-Total-Count' => $countries['total']
        ];

        return response()->json($countries['data'], $countries['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCountry(Request $request, $id)
    {
        $country = new Country();
        $country = $country->readCountry($request, $id);

        return response()->json($country[0], $country[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editCountry(Request $request, $id)
    {
        $country = new Country();
        $country = $country->editCountry($request, $id);

        return response()->json($country[0], $country[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteCountry(Request $request, $id)
    {
        $country = new Country();
        $country = $country->deleteCountry($request, $id);

        return response()->json($country[0], $country[1]);
    }

}
