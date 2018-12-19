<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class TypeUser extends Model
{

    /**
     * @var string
     */
    protected $table = 'TypesUsers';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'alias',
        'status',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createTypeUser($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'alias' => 'required',
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
            $typeUser = new typeUser();
            $typeUser->name = $request->has('name') ? $request->input('name') : null;
            $typeUser->alias = $request->has('alias') ? $request->input('alias') : null;
            $typeUser->status = $request->has('status') ? $request->input('status') : null;
            $typeUser->save();

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
    public function readTypeUsers($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $typeUsers = self::all();
        } else {
            $typeUsers = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $typeUsers,
            'status' => 200,
            'total' => count($typeUsers)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readTypeUser($request, $id)
    {
        $typeUser = self::where('id', $id)->first();

        return [
            $typeUser,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editTypeUser($request, $id)
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
            $typeUser = self::where('id', $id)->first();
            if ($request->has('name')) {
                $typeUser->name = $request->input('name');
            }
            if ($request->has('alias')) {
                $typeUser->alias = $request->input('alias');
            }
            if ($request->has('status')) {
                $typeUser->status = $request->input('status');
            }
            $typeUser->save();

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
    public function deleteTypeUser($request, $id)
    {
        $typeUser = self::where('id', $id)->first();

        $typeUser->delete();

        return [
            $typeUser,
            200
        ];
    }

    /**
     * @param $ids
     * @return array
     */
    public function getIdLike($ids)
    {
        $array = [];
        if (isset($ids) === true) {
            $array = explode('|', $ids);
        }

        return $array;
    }

    /**
     * @param $alias
     * @return mixed
     */
    public function getTypeUser($alias) {
        return $typeUser = self::where('alias', $alias)->first();
    }

}
