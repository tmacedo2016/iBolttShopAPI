<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class City extends Model
{

    /**
     * @var string
     */
    protected $table = 'Cities';

    /**
     * @var array
     */
    protected $fillable = [
        'state_id',
        'country_id',
        'name',
        'lat',
        'lng',
        'status',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createCity($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'status' => 'required',
            ]
        );

        $arrayErrors = false;
        $fails       = $validator->fails();
        if ($fails === true) {
            $errors = $validator->errors()->messages();

            foreach ($errors as $key => $error) {
                $arrayErrors[]
                    = [
                    'field'   => $key,
                    'message' => $error[0],
                ];
            }
        }

        if ($arrayErrors === false) {
            $city = new City();
            $city->country_id = $request->has('country_id') ? $request->input('country_id') : null;
            $city->name = $request->input('name');
            $city->lat = $request->has('lat') ? $request->input('lat') : null;
            $city->lng = $request->has('lng') ? $request->input('lng') : null;
            $city->status = $request->input('status');
            $city->save();

            $retorno = [
                [
                    'message' => 'Success',
                ],
                201
            ];
        } else {
            $retorno = [
                [
                    'message' => 'Error',
                    'errors'  => $arrayErrors,
                ],
                422
            ];

        }

        return $retorno;

    }

    /**
     * @param $request
     * @return array
     */
    public function readCities($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $cities = self::all();
        } else {
            $cities = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $cities,
            'status' => 200,
            'total' => count($cities)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readCity($request, $id)
    {
        $city = self::where('id', $id)->first();

        return [
            $city,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editCity($request, $id)
    {
        $validator = Validator::make(
            $request->all(), []
        );

        $arrayErrors = false;
        $fails       = $validator->fails();
        if ($fails === true) {
            $errors = $validator->errors()->messages();

            foreach ($errors as $key => $error) {
                $arrayErrors[]
                    = [
                    'field'   => $key,
                    'message' => $error[0],
                ];
            }
        }

        if ($arrayErrors === false) {
            $city = self::where('id', $id)->first();
            if ($request->has('name')) {
                $city->country_id = $request->input('country_id');
            }
            if ($request->has('name')) {
                $city->name = $request->input('name');
            }
            if ($request->has('lat')) {
                $city->lat = $request->input('lat');
            }
            if ($request->has('lng')) {
                $city->lng = $request->input('lng');
            }
            if ($request->has('status')) {
                $city->status = $request->input('status');
            }
            $city->save();

            $retorno = [
                [
                    'message' => 'Success',
                ],
                201
            ];
        } else {
            $retorno = [
                [
                    'message' => 'Error',
                    'errors'  => $arrayErrors,
                ],
                422
            ];

        }

        return $retorno;

    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function deleteCity($request, $id)
    {
        $city = self::where('id', $id)->first();

        $city->delete();

        return [
            $city,
            200
        ];
    }

    public function getIdLike($ids)
    {
        $array = [];
        if (isset($ids) === true) {
            $array = explode('|', $ids);
        }

        return $array;
    }

}
