<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class OrderProduct extends Model
{

    /**
     * @var string
     */
    protected $table = 'OrdersProducts';

    /**
     * @var array
     */
    protected $fillable = [
        'order_id',
        'product_id',
        'price',
        'status',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createOrderProduct($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'order_id' => 'required',
                'product_id' => 'required',
                'price' => 'required',
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
            $orderProduct = new OrderProduct();
            $orderProduct->order_id = $request->has('order_id') ? $request->input('order_id') : null;
            $orderProduct->product_id = $request->has('product_id') ? $request->input('product_id') : null;
            $orderProduct->price = $request->has('price') ? $request->input('price') : null;
            $orderProduct->status = $request->has('status') ? $request->input('status') : null;
            $orderProduct->save();

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
    public function readOrderProducts($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $orderProductProducts = self::all();
        } else {
            $orderProductProducts = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $orderProductProducts,
            'status' => 200,
            'total' => count($orderProductProducts)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readOrderProduct($request, $id)
    {
        $orderProduct = self::where('id', $id)->first();

        return [
            $orderProduct,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editOrderProduct($request, $id)
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
            $orderProduct = self::where('id', $id)->first();
            if ($request->has('order_id')) {
                $orderProduct->order_id = $request->input('order_id');
            }
            if ($request->has('product_id')) {
                $orderProduct->product_id = $request->input('product_id');
            }
            if ($request->has('price')) {
                $orderProduct->price = $request->input('price');
            }
            if ($request->has('status')) {
                $orderProduct->status = $request->input('status');
            }
            $orderProduct->save();

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
    public function deleteOrderProduct($request, $id)
    {
        $orderProduct = self::where('id', $id)->first();

        $orderProduct->delete();

        return [
            $orderProduct,
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
