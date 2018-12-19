<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class State extends Model
{

    /**
     * @var string
     */
    protected $table = 'States';

    /**
     * @var array
     */
    protected $fillable = [
        'country_id',
        'name',
        'lat',
        'lng',
        'initials',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createState($request)
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
            $state = new State();
            $state->country_id = $request->has('country_id') ? $request->input('country_id') : null;
            $state->name = $request->input('name');
            $state->lat = $request->has('lat') ? $request->input('lat') : null;
            $state->lng = $request->has('lng') ? $request->input('lng') : null;
            $state->initials = $request->input('initials');
            $state->save();

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
    public function readStates($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $states = self::all();
        } else {
            $states = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $states,
            'status' => 200,
            'total' => count($states)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readState($request, $id)
    {
        $state = self::where('id', $id)->first();

        return [
            $state,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editState($request, $id)
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
            $state = self::where('id', $id)->first();
            if ($request->has('country_id')) {
                $state->country_id = $request->input('country_id');
            }
            if ($request->has('name')) {
                $state->name = $request->input('name');
            }
            if ($request->has('lat')) {
                $state->lat = $request->input('lat');
            }
            if ($request->has('lng')) {
                $state->lng = $request->input('lng');
            }
            if ($request->has('initials')) {
                $state->initials = $request->input('initials');
            }
            $state->save();

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
    public function deleteState($request, $id)
    {
        $state = self::where('id', $id)->first();

        $state->delete();

        return [
            $state,
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
