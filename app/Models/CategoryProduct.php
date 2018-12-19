<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class CategoryProduct extends Model
{

    /**
     * @var string
     */
    protected $table = 'CategoriesProducts';

    /**
     * @var array
     */
    protected $fillable = [
        'company_id',
        'name',
    ];

    /**
     * @param $request
     * @return array
     */
    public function createCategoryProduct($request, $companyId)
    {
        $request['company_id'] = $companyId;

        $validator = Validator::make(
            $request->all(),
            [
                'company_id' => 'required',
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
            $categoryProduct = new CategoryProduct();
            $categoryProduct->company_id = $request->has('company_id') ? $request->input('company_id') : null;
            $categoryProduct->name = $request->input('name');
            $categoryProduct->save();

            $retorno = [
                $categoryProduct,
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
    public function readCategoryProducts($request, $companyId)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $categoryProducts = self::where('company_id', $companyId);
        } else {
            $categoryProducts = self::whereIn('id', $ids)
            ->where('company_id', $companyId);
        }

        $categoryProducts = $categoryProducts->get();

        return [
            'data' => $categoryProducts,
            'status' => 200,
            'total' => count($categoryProducts)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readCategoryProduct($request, $id)
    {
        $categoryProduct = self::where('id', $id)->first();

        return [
            $categoryProduct,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editCategoryProduct($request, $companyId, $id)
    {
        $request['company_id'] = $companyId;

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
            $categoryProduct = self::where('id', $id)->first();
            if ($request->has('company_id')) {
                $categoryProduct->company_id = $request->input('company_id');
            }
            if ($request->has('name')) {
                $categoryProduct->name = $request->input('name');
            }
            $categoryProduct->save();

            $retorno = [
                $categoryProduct,
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
    public function deleteCategoryProduct($request, $companyId, $id)
    {
        $categoryProduct = self::where('id', $id)
            ->where('company_id', $companyId)
            ->first();

        $categoryProduct->delete();

        return [
            $categoryProduct,
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
