<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class OrderStatus extends Model
{

    /**
     * @var string
     */
    protected $table = 'OrdersStatus';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'order',
        'slug',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createOrderStatus($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'order' => 'required',
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
            $orderStatus = new OrderStatus();
            $orderStatus->name = $request->input('name');
            $orderStatus->order = $request->input('order');
            $orderStatus->slug = str_slug($request->input('name'), '-');
            $orderStatus->save();

            $retorno = [
                $orderStatus,
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
    public function readOrderStatusList($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $orderStatus = self::all();
        } else {
            $orderStatus = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $orderStatus,
            'status' => 200,
            'total' => count($orderStatus)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readOrderStatus($request, $id)
    {
        $orderStatus = self::where('id', $id)->first();

        return [
            $orderStatus,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editOrderStatus($request, $id)
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
            $orderStatus = self::where('id', $id)->first();
            if ($request->has('name')) {
                $orderStatus->name = $request->input('name');
                $orderStatus->slug = str_slug($request->input('name'), '-');
            }
            if ($request->has('order')) {
                $orderStatus->order = $request->input('order');
            }
            $orderStatus->save();

            $retorno = [
                $orderStatus,
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
    public function deleteOrderStatus($request, $id)
    {
        $orderStatus = self::where('id', $id)->first();

        $orderStatus->delete();

        return [
            $orderStatus,
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
