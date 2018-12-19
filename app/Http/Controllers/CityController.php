<?php

namespace App\Http\Controllers;

use App\Models\City;
use Illuminate\Http\Request;

class CityController extends Controller
{
    /**
     * CityController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createCity(Request $request)
    {
        $city = new City();
        $city = $city->createCity($request);

        return response()->json($city[0], $city[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCities(Request $request)
    {
        $city   = new City();
        $cities = $city->readCities($request);

        $headers = [
            'X-Total-Count' => $cities['total'],
            'Access-Control-Allow-Headers' => 'X-Total-Count'
        ];

        return response()->json($cities['data'], $cities['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readCity(Request $request, $id)
    {
        $city = new City();
        $city = $city->readCity($request, $id);

        return response()->json($city[0], $city[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editCity(Request $request, $id)
    {
        $city = new City();
        $city = $city->editCity($request, $id);

        return response()->json($city[0], $city[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteCity(Request $request, $id)
    {
        $city = new City();
        $city = $city->deleteCity($request, $id);

        return response()->json($city[0], $city[1]);
    }

}
