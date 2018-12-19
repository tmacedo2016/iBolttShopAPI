<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class TypeShop extends Model
{

    /**
     * @var string
     */
    protected $table = 'TypesShops';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createTypeShop($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
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
            $typeShop = new TypeShop();
            $typeShop->name = $request->has('name') ? $request->input('name') : null;
            $typeShop->save();

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
    public function readTypeShops($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $typeShops = self::all();
        } else {
            $typeShops = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $typeShops,
            'status' => 200,
            'total' => count($typeShops)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readTypeShop($request, $id)
    {
        $typeShop = self::where('id', $id)->first();

        return [
            $typeShop,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editTypeShop($request, $id)
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
            $typeShop = self::where('id', $id)->first();
            if ($request->has('name')) {
                $typeShop->name = $request->input('name');
            }
            if ($request->has('status')) {
                $typeShop->status = $request->input('status');
            }
            $typeShop->save();

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
    public function deleteTypeShop($request, $id)
    {
        $typeShop = self::where('id', $id)->first();

        $typeShop->delete();

        return [
            $typeShop,
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
