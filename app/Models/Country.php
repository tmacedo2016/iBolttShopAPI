<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class Country extends Model
{

    /**
     * @var string
     */
    protected $table = 'Countries';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'lat',
        'lng',
        'initials',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createCountry($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'initials' => 'required',
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
            $country = new Country();
            $country->name = $request->input('name');
            $country->lat = $request->has('lat') ? $request->input('lat') : null;
            $country->lng = $request->has('lng') ? $request->input('lng') : null;
            $country->initials = $request->input('initials');
            $country->save();

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
    public function readCountries($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $countries = self::all();
        } else {
            $countries = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $countries,
            'status' => 200,
            'total' => count($countries)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readCountry($request, $id)
    {
        $country = self::where('id', $id)->first();

        return [
            $country,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editCountry($request, $id)
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
            $country = self::where('id', $id)->first();
            if ($request->has('name')) {
                $country->name = $request->input('name');
            }
            if ($request->has('lat')) {
                $country->lat = $request->input('lat');
            }
            if ($request->has('lng')) {
                $country->lng = $request->input('lng');
            }
            if ($request->has('initials')) {
                $country->initials = $request->input('initials');
            }
            $country->save();

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
    public function deleteCountry($request, $id)
    {
        $country = self::where('id', $id)->first();

        $country->delete();

        return [
            $country,
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
