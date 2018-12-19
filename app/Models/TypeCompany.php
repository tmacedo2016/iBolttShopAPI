<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class TypeCompany extends Model
{

    /**
     * @var string
     */
    protected $table = 'TypeCompanies';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'status',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createTypeCompany($request)
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
            $typeCompany = new TypeCompany();
            $typeCompany->name = $request->has('name') ? $request->input('name') : null;
            $typeCompany->status = $request->has('status') ? $request->input('status') : null;
            $typeCompany->save();

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
    public function readTypeCompanies($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $typeCompanies = self::all();
        } else {
            $typeCompanies = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $typeCompanies,
            'status' => 200,
            'total' => count($typeCompanies)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readTypeCompany($request, $id)
    {
        $company = self::where('id', $id)->first();

        return [
            $company,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editTypeCompany($request, $id)
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
            $typeCompany = self::where('id', $id)->first();
            if ($request->has('name')) {
                $typeCompany->name = $request->input('name');
            }
            if ($request->has('status')) {
                $typeCompany->status = $request->input('status');
            }
            $typeCompany->save();

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
    public function deleteTypeCompany($request, $id)
    {
        $typeCompany = self::where('id', $id)->first();

        $typeCompany->delete();

        return [
            $typeCompany,
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
