<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class Product extends Model
{

    /**
     * @var string
     */
    protected $table = 'Products';

    /**
     * @var array
     */
    protected $fillable = [
        'company_id',
        'category_product_id',
        'name',
        'description',
        'image',
        'price',
        'promoting_active',
        'promotional_price',
        'availability_day1',
        'availability_day2',
        'availability_day3',
        'availability_day4',
        'availability_day5',
        'availability_day6',
        'availability_day7',
        'free_delivery',
        'status',
    ];

    public function details() {
        return $this->hasOne('App\Models\OrderProduct');
    }

    /**
     * @param $request
     * @return array
     */
    public function createProduct($request, $companyId)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'description' => 'required',
                'free_delivery' => 'required',
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
            $product = new Product();
            $product->company_id = $companyId;
            $product->category_product_id = $request->has('category_product_id') ? $request->input('category_product_id') : null;
            $product->name = $request->input('name');
            $product->description = $request->input('description');
            if ($request->has('image') === true) {
                $file = new File();
                $imageData = $file->gerarImagem($request->input('image'), 'products/');
                if (empty($imageData) === false) {
                    $product->image = $imageData['image'];
                }
            } else {
                $product->image = '';
                $imageData['url'] = '';
            }
            $product->price = $request->has('price') ? $request->input('price') : null;
            $product->promoting_active = $request->has('promoting_active') ? $request->input('promoting_active') : null;
            $product->promotional_price = $request->has('promotional_price') ? $request->input('promotional_price') : null;
            $product->availability_day1 = $request->has('availability_day1') ? $request->input('availability_day1') : null;
            $product->availability_day2 = $request->has('availability_day2') ? $request->input('availability_day2') : null;
            $product->availability_day3 = $request->has('availability_day3') ? $request->input('availability_day3') : null;
            $product->availability_day4 = $request->has('availability_day4') ? $request->input('availability_day4') : null;
            $product->availability_day5 = $request->has('availability_day5') ? $request->input('availability_day5') : null;
            $product->availability_day6 = $request->has('availability_day6') ? $request->input('availability_day6') : null;
            $product->availability_day7 = $request->has('availability_day7') ? $request->input('availability_day7') : null;
            $product->free_delivery = $request->has('free_delivery') ? $request->input('free_delivery') : null;
            $product->status = $request->has('status') ? $request->input('status') : null;
            $product->save();

            $product->image_url = $imageData['url'];

            $retorno = [
                $product,
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
    public function readProducts($request, $companyId)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $products = new Product();
        } else {
            $products = self::whereIn('id', $ids);
        }

        $products = $products->where('company_id', $companyId)->get();

        foreach ($products as $productKey => $productValue) {
            $urlImagem = 'http://' . $_SERVER['SERVER_NAME'] . '/images/products/' . $productValue->image;

            $products[$productKey]['image_url'] = $urlImagem;
        }

//        dd($products);

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
    public function readProduct($request, $companyId, $id)
    {
        $product = self::where('id', $id)
            ->where('company_id', $companyId)
            ->first();

        return [
            $product,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editProduct($request, $companyId, $id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'description' => 'required',
                'free_delivery' => 'required',
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
            $product = self::where('id', $id)->where('company_id', $companyId)->first();
            if ($request->has('category_product_id')) {
                $product->category_product_id = $request->input('category_product_id');
            }
            if ($request->has('name')) {
                $product->name = $request->input('name');
            }
            if ($request->has('description')) {
                $product->description = $request->input('description');
            }
            if ($request->has('image') === true) {
                $file = new File();
                $imageData = $file->gerarImagem($request->input('image'), 'products/');
                if (empty($imageData) === false) {
                    $product->image = $imageData['image'];
                }
            }
            if ($request->has('price')) {
                $product->price = $request->input('price');
            }
            if ($request->has('promoting_active')) {
                $product->promoting_active = $request->input('promoting_active');
            }
            if ($request->has('promotional_price')) {
                $product->promotional_price = $request->input('promotional_price');
            }
            if ($request->has('availability_day1')) {
                $product->availability_day1 = $request->input('availability_day1');
            }
            if ($request->has('availability_day2')) {
                $product->availability_day2 = $request->input('availability_day2');
            }
            if ($request->has('availability_day3')) {
                $product->availability_day3 = $request->input('availability_day3');
            }
            if ($request->has('availability_day4')) {
                $product->availability_day4 = $request->input('availability_day4');
            }
            if ($request->has('availability_day5')) {
                $product->availability_day5 = $request->input('availability_day5');
            }
            if ($request->has('availability_day6')) {
                $product->availability_day6 = $request->input('availability_day6');
            }
            if ($request->has('availability_day7')) {
                $product->availability_day7 = $request->input('availability_day7');
            }
            if ($request->has('free_delivery')) {
                $product->free_delivery = $request->input('free_delivery');
            }
            if ($request->has('status')) {
                $product->status = $request->input('status');
            }
            $product->save();

            $retorno = [
                $product,
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
    public function deleteProduct($request, $companyId, $id)
    {
        $product = self::where('id', $id)
            ->where('company_id', $companyId)
            ->first();

        $product->delete();

        return [
            $product,
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
