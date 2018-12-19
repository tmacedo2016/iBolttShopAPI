<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class Order extends Model
{

    /**
     * @var string
     */
    protected $table = 'Orders';

    /**
     * @var array
     */
    protected $fillable = [
        'company_id',
        'user_id',
    ];

    public function products() {
        return $this->belongsToMany('App\Models\Product', 'OrdersProducts')->withPivot(['price', 'quantity'])->withTimestamps();
    }

    public function payment() {
        return $this->belongsToMany('App\Models\Payment', 'OrdersPayments')->withTimestamps();
    }

    public function orderStatus() {
        return $this->belongsTo('App\Models\OrderStatus');
    }

    /**
     * @param $request
     * @return array
     */
    public function createOrder($request, $companyId, $userId)
    {
        $request['company_id'] = $companyId;
        $request['user_id'] = $userId;
        $request['order_status_id'] = '1';

        $validator = Validator::make(
            $request->all(),
            [
                'company_id' => 'required',
                'user_id' => 'required',
                'order_status_id' => 'required',
                'payment_id' => 'required',
                'payment_value' => 'required',
                'products.*.id' => 'required',
                'products.*.price' => 'required',
                'products.*.quantity' => 'required',
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
            $order = new Order();
            $order->company_id = $request->has('company_id') ? $request->input('company_id') : null;
            $order->user_id = $request->has('user_id') ? $request->input('user_id') : null;
            $order->observation = $request->has('observation') ? $request->input('observation') : null;
            $order->order_status_id = $request->has('order_status_id') ? $request->input('order_status_id') : null;
            $order->save();

            $products = $request->input('products');

            $productsAttach = [];
            if (is_array($products) === true) {
                foreach ($products as $product) {
                    $productsAttach[$product['id']] = [
                        'price' => $product['price'],
                        'quantity' => $product['quantity'],
                        'status' => 1,
                    ];
                }

                $order->products = $productsAttach;
            }

            $paymentId = $request->input('company_id');

            $paymentAttach[$paymentId] = [
                'value' => $request->input('payment_value')
            ];

            $order->payment_id = key($paymentAttach);
            $order->payment_value = $paymentAttach[$paymentId]['value'];

            $order->products()->attach($productsAttach);
            $order->payment()->attach($paymentAttach);

            $retorno = [
                $order,
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
    public function readOrders($request, $userId)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $orders = new Order();
        } else {
            $orders = self::whereIn('id', $ids);
        }

        $orders = $orders
            ->where('user_id', $userId)
            ->orderBy('updated_at', 'desc')
            ->get();

        return [
            'data' => $orders,
            'status' => 200,
            'total' => count($orders)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readOrder($request, $userId, $id)
    {
        $order = self::where('id', $id)
            ->where('user_id', $userId)
            ->with('orderStatus')
            ->with(['payment' => function($query) {
                $query->select(['Payments.id', 'Payments.name', 'Payments.slug'])
                    ->with(['details' => function($query) {
                    $query->select(['OrdersPayments.id', 'OrdersPayments.order_id', 'OrdersPayments.payment_id', 'OrdersPayments.value']);
                }]);
            }])
            ->with(['products' => function($query) {
                $query->select(['Products.id']);
            }])
            ->first();

        $products = array();

        foreach ($order->products as $product) {
            $products[$product->id]['price'] = $product->pivot->price;
            $products[$product->id]['quantity'] = $product->pivot->quantity;
        }

        $orderBeauty['id'] = $order->id;
        $orderBeauty['company_id'] = $order->company_id;
        $orderBeauty['user_id'] = $order->user_id;
        $orderBeauty['status'] = isset($order->orderStatus->name) === true ? $order->orderStatus->name : null;
        $orderBeauty['status_slug'] = isset($order->orderStatus->slug) === true ? $order->orderStatus->slug : null;
        if (isset($order->payment[0]) === true) {
            $orderBeauty['payment'] = $order->payment[0]->name;
            $orderBeauty['payment_slug'] = $order->payment[0]->slug;
        } else {
            $orderBeauty['payment'] = null;
            $orderBeauty['payment_slug'] = null;
        }
        $orderBeauty['products'] = $products;

        return [
            $orderBeauty,
            200
        ];
    }

    /**
     * @param $request
     * @param $companyId
     * @param $userId
     * @param $id
     * @return array
     */
    public function readOrderProducts($request, $userId, $id)
    {
        $order = self::where('id', $id)
            ->where('user_id', $userId)
            ->with(['products' => function($query) {
                $query->with('details');
            }])
            ->first();

        $products = isset($order->products) === true ? $order->products : [];

        return [
            'data' => $products,
            'status' => 200,
            'total' => count($products)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function cancelOrder($request, $userId, $id)
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
            $order = self::where('id', $id)
                ->where('user_id', $userId)
                ->first();
            $order->order_status_id = 9;
            $order->save();

            $retorno = [
                $order,
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
     * @param $userId
     * @return array
     */
    public function readCompanyOrders($request, $companyId)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $orders = new Order();
        } else {
            $orders = self::whereIn('id', $ids);
        }

        $orders = $orders
            ->where('company_id', $companyId)
            ->orderBy('updated_at', 'desc')
            ->get();

        return [
            'data' => $orders,
            'status' => 200,
            'total' => count($orders)
        ];
    }

    /**
     * @param $request
     * @param $companyId
     * @param $id
     * @return array
     */
    public function readCompanyOrder($request, $companyId, $id)
    {
        $order = self::where('id', $id)
            ->where('company_id', $companyId)
            ->with('orderStatus')
            ->with(['payment' => function($query) {
                $query->select(['Payments.id', 'Payments.name', 'Payments.slug'])
                    ->with(['details' => function($query) {
                        $query->select(['OrdersPayments.id', 'OrdersPayments.order_id', 'OrdersPayments.payment_id', 'OrdersPayments.value']);
                    }]);
            }])
            ->with(['products' => function($query) {
                $query->select(['Products.id', 'Products.price']);
            }])
            ->first();

        $products = array();

        if (empty($order->products) === false) {
            foreach ($order->products as $product) {
                $products[$product->id]['price'] = $product->pivot->price;
                $products[$product->id]['quantity'] = $product->pivot->quantity;
            }
        }

        $orderBeauty = [];

        if (isset($order) === true && empty($order) === false) {
            $orderBeauty['id'] = $order->id;
            $orderBeauty['company_id'] = $order->company_id;
            $orderBeauty['user_id'] = $order->user_id;
            $orderBeauty['status_id'] = isset($order->orderStatus->id) === true ? $order->orderStatus->id : null;
            $orderBeauty['status'] = isset($order->orderStatus->name) === true ? $order->orderStatus->name : null;
            $orderBeauty['status_slug'] = isset($order->orderStatus->slug) === true ? $order->orderStatus->slug : null;

            if (isset($order->payment[0]) === true) {
                $orderBeauty['payment'] = $order->payment[0]->name;
                $orderBeauty['payment_slug'] = $order->payment[0]->slug;
            } else {
                $orderBeauty['payment'] = null;
                $orderBeauty['payment_slug'] = null;
            }
            $orderBeauty['products'] = $products;
        }

        return [
            $orderBeauty,
            200
        ];
    }

    /**
     * @param $request
     * @param $userId
     * @param $id
     * @return array
     */
    public function readCompanyOrderProducts($request, $companyId, $id)
    {
        $order = self::where('id', $id)
            ->where('company_id', $companyId)
            ->with(['products' => function($query) {
                $query->with('details');
            }])
            ->first();

        $products = isset($order->products) === true ? $order->products : [];

        return [
            'data' => $products,
            'status' => 200,
            'total' => count($products)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editCompanyOrder($request, $id)
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
            $order = self::where('id', $id)->first();
            if ($request->has('status')) {
                $order->status = $request->input('status');
            }
            $order->save();

            $retorno = [
                $order,
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
    public function editCompanyOrderStatus($request, $companyId, $orderId, $id)
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
            $order = self::where('id', $orderId)
                ->where('company_id', $companyId)
                ->first();

            if (isset($order) === true && empty($order) === false) {
                $orderStatus = new OrderStatus();
                $orderStatus = $orderStatus::where('id', $id)->first();

                if (empty($orderStatus) === false) {
                    $order->order_status_id = $orderStatus->id;
                    $order->save();
                }
            }

            $retorno = [
                $order,
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

    public function getIdLike($ids)
    {
        $array = [];
        if (isset($ids) === true) {
            $array = explode('|', $ids);
        }

        return $array;
    }

}
